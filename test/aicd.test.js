// Run with: node --test
// Loads acid.js into a vm context with stubs for the Max js globals.

const test = require("node:test");
const assert = require("node:assert");
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const { toNote, patternToText, trainCharLm } = require("../train.js");

const root = path.join(__dirname, "..");

function loadAcid() {
    const ctx = { post() {}, outlet() {}, Math, Object, JSON };
    vm.createContext(ctx);
    ctx.include = (f) => vm.runInContext(fs.readFileSync(path.join(root, f), "utf8"), ctx);
    vm.runInContext(fs.readFileSync(path.join(root, "acid.js"), "utf8"), ctx);
    return ctx;
}

test("seeded generation is reproducible, unseeded differs", () => {
    const a = loadAcid();
    const gen = (seed) => {
        a.seedRandom(seed);
        return JSON.stringify(a.generatePattern(a.lm, 18, 16, 1.0));
    };
    assert.strictEqual(gen(42), gen(42));
    assert.notStrictEqual(gen(42), gen(43));
});

test("generated patterns have the requested length at all temperatures", () => {
    const a = loadAcid();
    for (const t of [0, 0.05, 0.5, 1, 2, 5]) {
        let short = 0;
        for (let i = 1; i <= 200; i++) {
            a.seedRandom(i);
            const steps = a.generatePattern(a.lm, 18, 16, t);
            if (steps.length !== 16) short++;
            for (const s of steps) {
                assert.ok(Number.isFinite(s.note), `bad note at T=${t}`);
            }
        }
        assert.strictEqual(short, 0, `${short}/200 patterns too short at T=${t}`);
    }
});

test("temperature 1 samples the trained distribution", () => {
    const a = loadAcid();
    const lm = { abc: { x: 0.7, y: 0.2, z: 0.1 } };
    a.seedRandom(7);
    const n = 20000;
    const counts = { x: 0, y: 0, z: 0 };
    for (let i = 0; i < n; i++) counts[a.generateLetter(lm, "abc", 3, 1.0)]++;
    assert.ok(Math.abs(counts.x / n - 0.7) < 0.02);
    assert.ok(Math.abs(counts.y / n - 0.2) < 0.02);
    assert.ok(Math.abs(counts.z / n - 0.1) < 0.02);
});

test("high temperature flattens, low temperature sharpens", () => {
    const a = loadAcid();
    const lm = { abc: { x: 0.7, y: 0.2, z: 0.1 } };
    const freqX = (t) => {
        a.seedRandom(11);
        let x = 0;
        for (let i = 0; i < 20000; i++) if (a.generateLetter(lm, "abc", 3, t) === "x") x++;
        return x / 20000;
    };
    assert.ok(freqX(5) < 0.55);
    assert.ok(freqX(5) > 0.34); // never below uniform
    assert.ok(freqX(0.3) > 0.9);
});

test("dead ends in the model restart instead of emitting undefined", () => {
    const a = loadAcid();
    const lm = { "ab~\n": { c: 1.0 }, "b~\nc": {} };
    delete lm["b~\nc"];
    a.seedRandom(1);
    const text = a.generateText(lm, 4, 20, 1.0);
    assert.strictEqual(text.length, 20);
    assert.ok(!text.includes("undefined"));
});

test("trainer converts .pat lines like patterns.csx", () => {
    // note down up accent slide gate
    assert.strictEqual(toNote(["", "0", "0", "0"]), "R");
    const text = patternToText("; comment\n0 0 0 1 0 1\n12 1 0 0 1 1\n\n");
    // 2nd step: 12 - 12 = 0 -> "R"
    assert.strictEqual(text, "R!1$0#1=\nR!0$1#1=\n~\n");
    assert.strictEqual(patternToText("; only a comment\n"), "");
    // notes >= 36 fold into 24..35
    assert.strictEqual(toNote(["", "40", "0", "0"]), String.fromCharCode(4 + 24 + 82));
});

test("trainer reproduces the shipped model's transitions", () => {
    const a = loadAcid();
    // generate patterns from the shipped model, retrain, and check every
    // transition of the new model exists in the original
    a.seedRandom(5);
    const text = a.generateText(a.lm, 18, 30000, 1.0);
    const lm2 = trainCharLm(text, 18);
    let checked = 0;
    for (const h of Object.keys(lm2)) {
        const sum = Object.values(lm2[h]).reduce((x, y) => x + y, 0);
        assert.ok(Math.abs(sum - 1) < 1e-9);
        for (const c of Object.keys(lm2[h])) {
            assert.ok(a.lm[h] && a.lm[h][c] !== undefined, `missing transition ${JSON.stringify(h)} -> ${c}`);
            checked++;
        }
    }
    assert.ok(checked > 1000);
});

test("transpose shifts the clip pitches and clamps to 0..127", () => {
    const a = loadAcid();
    a.clipOut = () => {}; // no Live API outside of Max
    a.dumpStep("", 1, 36, 100, 120, 0, 1);
    a.dumpStep("", 2, 120, 100, 120, 0, 1);
    const pitches = () => Array.from(a.generateMidi(), (n) => n.Pitch);
    assert.deepStrictEqual(pitches(), [36, 120]);
    a.setTranspose(12);
    assert.deepStrictEqual(pitches(), [48, 127]);
    a.setTranspose(-48);
    assert.deepStrictEqual(pitches(), [0, 72]);
});

function mutateSetup(n) {
    const a = loadAcid();
    const calls = [];
    a.clipOut = () => {};
    a.callPatternStepDump = () => {};
    a.outlets = [];
    a.outlet = (...args) => (args[0] === 0 ? calls.push(args) : a.outlets.push(args));
    for (let i = 1; i <= n; i++) a.dumpStep("", i, 36, 100, 120, 0, 1);
    return { a, calls };
}

test("mutate replaces the requested share of steps, all distinct", () => {
    for (const [amount, expected] of [[25, 4], [50, 8], [100, 16], [1, 1]]) {
        const { a, calls } = mutateSetup(16);
        a.setMutateAmount(amount);
        a.mutate();
        assert.strictEqual(calls.length, expected, `amount ${amount}`);
        const idx = calls.map((c) => c[2]);
        assert.strictEqual(new Set(idx).size, expected);
        for (const c of calls) {
            assert.strictEqual(c[1], "step");
            assert.ok(c[2] >= 1 && c[2] <= 16 && Number.isFinite(c[3]));
        }
    }
});

test("mutate does nothing for amount 0 or an empty pattern", () => {
    const zero = mutateSetup(16);
    zero.a.setMutateAmount(0);
    zero.a.mutate();
    assert.strictEqual(zero.calls.length, 0);
    const empty = mutateSetup(0);
    empty.a.mutate();
    assert.strictEqual(empty.calls.length, 0);
});

test("mutate ignores a fixed seed, so repeated mutations differ", () => {
    const { a, calls } = mutateSetup(16);
    a.setSeed(99);
    a.setMutateAmount(50);
    const results = new Set();
    for (let i = 0; i < 5; i++) {
        calls.length = 0;
        a.mutate();
        results.add(JSON.stringify(calls));
    }
    assert.ok(results.size > 1);
    // and it does not touch the displayed seed
    assert.ok(a.outlets.every((o) => o[0] !== 4));
});

test("seed numbers are short and shown on outlet 4; a set seed is reused", () => {
    const { a } = mutateSetup(0);
    for (let i = 0; i < 200; i++) {
        a.startGeneration();
        const [outlet, set, value] = a.outlets[a.outlets.length - 1];
        assert.strictEqual(outlet, 4);
        assert.strictEqual(set, "set");
        assert.ok(Number.isInteger(value) && value >= 1 && value <= 999999);
    }
    a.startGeneration();
    const last = a.outlets[a.outlets.length - 1][2];
    a.setSeed(last);
    a.startGeneration();
    assert.strictEqual(a.outlets[a.outlets.length - 1][2], last);
    a.setSeed(1e9);
    a.startGeneration();
    assert.strictEqual(a.outlets[a.outlets.length - 1][2], 999999);
});

// an editor with 8 steps, held in `editor`, that applies "step" messages to itself
function historySetup() {
    const a = loadAcid();
    const editor = [];
    for (let i = 0; i < 8; i++) editor.push({ pitch: 36 + i, velocity: 100, slide: 0, gate: 1 });
    a.clipOut = () => {};
    a.outlet = (...args) => {
        if (args[0] === 0 && args[1] === "step") {
            editor[args[2] - 1] = { pitch: args[3], velocity: args[4], slide: args[6], gate: args[7] };
        }
    };
    a.callPatternStepDump = () => editor.forEach((s, i) => a.dumpStep("", i + 1, s.pitch, s.velocity, 120, s.slide, s.gate));
    a.setPatternLength(8);
    return { a, editor, pitches: () => editor.map((s) => s.pitch) };
}

test("history: back and forward restore the editor", () => {
    const { a, editor, pitches } = historySetup();
    const original = pitches();
    a.setSeed(5);
    a.bang();
    const generated = pitches();
    assert.notDeepStrictEqual(generated, original);
    a.mutate();
    const mutated = pitches();
    a.historyBack();
    assert.deepStrictEqual(pitches(), generated);
    a.historyBack();
    assert.deepStrictEqual(pitches(), original);
    a.historyBack(); // nothing left
    assert.deepStrictEqual(pitches(), original);
    a.historyForward();
    assert.deepStrictEqual(pitches(), generated);
    a.historyForward();
    assert.deepStrictEqual(pitches(), mutated);
    a.historyForward(); // nothing left
    assert.deepStrictEqual(pitches(), mutated);
});

test("history: a new change clears redo, and manual edits are kept in the snapshot", () => {
    const { a, editor, pitches } = historySetup();
    a.bang();
    editor[0].pitch = 50; // manual edit
    const edited = pitches();
    a.bang();
    a.historyBack();
    assert.deepStrictEqual(pitches(), edited);
    a.mutate(); // new change after undo
    const mutated = pitches();
    a.historyForward(); // redo is gone
    assert.deepStrictEqual(pitches(), mutated);
});

test("history: a scale change can be undone, and unchanged steps add nothing", () => {
    const { a, pitches } = historySetup();
    const before = pitches();
    a.setScale(9);
    const quantized = pitches();
    assert.notDeepStrictEqual(quantized, before);
    a.setScale(9); // nothing left to move: no new history entry
    a.historyBack();
    assert.deepStrictEqual(pitches(), before);
});

test("history keeps at most 50 entries", () => {
    const { a } = historySetup();
    for (let i = 0; i < 80; i++) a.bang();
    let back = 0;
    for (let i = 0; i < 80; i++) {
        const before = a.undoStack.length;
        a.historyBack();
        if (a.undoStack.length < before) back++;
    }
    assert.strictEqual(back, 50);
});

test("quantizing moves pitches to the nearest scale note, down on ties", () => {
    const a = loadAcid();
    const C_MAJOR = 1, A_MINOR_PENT = 9;
    assert.strictEqual(a.quantizePitch(60, 0, C_MAJOR), 60);
    assert.strictEqual(a.quantizePitch(61, 0, C_MAJOR), 60); // C# -> C (tie, down)
    assert.strictEqual(a.quantizePitch(63, 0, C_MAJOR), 62); // D# -> D (tie, down)
    assert.strictEqual(a.quantizePitch(66, 0, C_MAJOR), 65); // F# -> F (tie, down)
    // root D: D major contains F#
    assert.strictEqual(a.quantizePitch(66, 2, C_MAJOR), 66);
    assert.strictEqual(a.quantizePitch(65, 2, C_MAJOR), 64); // F -> E
    // A minor pentatonic (A C D E G): B -> C, D# -> D (tie, down), F -> E
    assert.strictEqual(a.quantizePitch(71, 9, A_MINOR_PENT), 72);
    assert.strictEqual(a.quantizePitch(63, 9, A_MINOR_PENT), 62);
    assert.strictEqual(a.quantizePitch(65, 9, A_MINOR_PENT), 64);
});

test("every quantized pitch is in the scale for all scales and roots", () => {
    const a = loadAcid();
    for (let scale = 1; scale < a.SCALES.length; scale++) {
        for (let root = 0; root < 12; root++) {
            for (let pitch = 0; pitch < 128; pitch++) {
                const q = a.quantizePitch(pitch, root, scale);
                assert.ok(a.SCALES[scale].includes((((q - root) % 12) + 12) % 12), `scale ${scale} root ${root} pitch ${pitch}`);
                assert.ok(Math.abs(q - pitch) <= 6);
            }
        }
    }
});

test("output pitch applies transpose, then the scale, and stays in range", () => {
    const a = loadAcid();
    a.clipOut = () => {};
    a.setTranspose(1);
    a.setScale(1); // major, root C
    assert.strictEqual(a.outputPitch(36), 36); // 37 (C#) -> C
    a.setRoot(2); // D major
    assert.strictEqual(a.outputPitch(36), 37); // 37 = C# is in D major
    a.setScale(0);
    assert.strictEqual(a.outputPitch(36), 37);
    a.setScale(1);
    a.setTranspose(24);
    for (let p = 0; p < 128; p++) {
        const o = a.outputPitch(p);
        assert.ok(o >= 0 && o <= 127);
        assert.ok(a.SCALES[1].includes((((o - 2) % 12) + 12) % 12));
    }
});

test("mapPitch sends the output pitch to outlet 3", () => {
    const a = loadAcid();
    const calls = [];
    a.outlet = (...args) => calls.push(args);
    a.clipOut = () => {};
    a.setScale(2); // minor
    a.mapPitch(40); // E is not in C minor: tie between Eb and F -> down
    assert.deepStrictEqual(calls, [[3, 39]]);
});

test("changing the scale moves the editor steps into the scale", () => {
    const { a, calls } = mutateSetup(0);
    a.clipOut = () => {};
    const pitches = [36, 37, 39, 40, 42, 43, 46, 48];
    pitches.forEach((p, i) => a.dumpStep("", i + 1, p, 100, 120, 0, 1));
    a.setScale(9); // C minor pentatonic: C Eb F G Bb
    const moved = calls.filter((c) => c[1] === "step");
    assert.ok(moved.length > 0 && moved.length < pitches.length);
    for (const c of moved) assert.ok(a.SCALES[9].includes(((c[3] % 12) + 12) % 12));
    // steps already in the scale are not touched
    for (const p of [36, 39, 43, 46, 48]) assert.ok(!moved.some((c) => c[3] === p && c[2] === pitches.indexOf(p) + 1));
    // a second call has nothing left to move
    calls.length = 0;
    a.setScale(9);
    assert.strictEqual(calls.length, 0);
    // off leaves the editor alone
    a.setScale(0);
    assert.strictEqual(calls.length, 0);
});

test("generated and mutated steps are put into the active scale", () => {
    const { a, calls } = mutateSetup(16);
    a.clipOut = () => {};
    a.setScale(9);
    a.setRoot(9); // A minor pentatonic
    calls.length = 0;
    for (let i = 1; i <= 50; i++) {
        a.seedRandom(i);
        for (const s of a.generatePattern(a.lm, 18, 16, 1.0)) {
            assert.ok(a.SCALES[9].includes((((s.note - 9) % 12) + 12) % 12));
        }
    }
    a.setMutateAmount(100);
    a.mutate();
    for (const c of calls.filter((c) => c[1] === "step")) {
        assert.ok(a.SCALES[9].includes((((c[3] - 9) % 12) + 12) % 12));
    }
});

// editor stub where step messages change the steps, with a pattern generated by bang()
function densitySetup(seed, length = 16) {
    const a = loadAcid();
    const editor = [];
    for (let i = 0; i < length; i++) editor.push({ pitch: 36, velocity: 100, slide: 0, gate: 1 });
    a.clipOut = () => {};
    a.outlet = (...args) => {
        if (args[0] === 0 && args[1] === "step") {
            editor[args[2] - 1] = { pitch: args[3], velocity: args[4], slide: args[6], gate: args[7] };
        }
    };
    a.callPatternStepDump = () => editor.forEach((s, i) => a.dumpStep("", i + 1, s.pitch, s.velocity, 120, s.slide, s.gate));
    a.setPatternLength(length);
    a.setSeed(seed);
    a.bang();
    const flags = () => editor.map((s) => ({ g: s.gate, s: s.slide, a: s.velocity === 127 }));
    const rests = () => editor.filter((s) => s.gate === 0).length;
    const notes = () => editor.filter((s) => s.gate === 1).length;
    const slides = () => editor.filter((s) => s.slide === 1).length;
    const accents = () => editor.filter((s) => s.velocity === 127).length;
    return { a, editor, flags, rests, notes, slides, accents };
}

test("density starts at the defaults and the editor shows exactly the percentages", () => {
    const { a, rests, notes, slides, accents } = densitySetup(7);
    assert.strictEqual(rests(), 2); // 10% of 16
    assert.strictEqual(slides(), Math.round(notes() * 0.33));
    assert.strictEqual(accents(), Math.round(notes() * 0.33));
    for (const [r, sl, ac] of [[0, 0, 0], [25, 50, 100], [50, 10, 20], [100, 100, 100]]) {
        a.setRests(r); a.setSlides(sl); a.setAccents(ac);
        assert.strictEqual(rests(), Math.round(16 * r / 100));
        assert.strictEqual(slides(), Math.round(notes() * sl / 100));
        assert.strictEqual(accents(), Math.round(notes() * ac / 100));
    }
});

test("rests 100 silences the pattern, and slides and accents sit on notes", () => {
    const { a, editor, rests, notes } = densitySetup(2);
    a.setRests(100);
    assert.strictEqual(notes(), 0);
    assert.strictEqual(rests(), 16);
    a.setSlides(100); a.setAccents(100);
    for (const s of editor) { assert.strictEqual(s.slide, 0); assert.notStrictEqual(s.velocity, 127); }
    a.setRests(50);
    assert.strictEqual(rests(), 8);
    for (const s of editor) if (s.gate === 0) { assert.strictEqual(s.slide, 0); assert.notStrictEqual(s.velocity, 127); }
    a.setRests(0);
    assert.strictEqual(rests(), 0);
});

test("density changes are consistent: the same steps come and go, and it is reversible", () => {
    const { a, flags } = densitySetup(9);
    const snapshots = {};
    for (const v of [0, 20, 40, 60, 80, 100]) { a.setSlides(v); snapshots[v] = flags(); }
    for (let i = 1; i < 6; i++) {
        const lo = snapshots[[0, 20, 40, 60, 80, 100][i - 1]], hi = snapshots[[0, 20, 40, 60, 80, 100][i]];
        // every slide at the lower value is still there at the higher one (for the same notes)
        lo.forEach((f, k) => { if (f.s === 1 && hi[k].g === 1) assert.strictEqual(hi[k].s, 1); });
    }
    a.setSlides(40);
    assert.strictEqual(JSON.stringify(flags()), JSON.stringify(snapshots[40]));
});

test("density keeps manual edits of steps it does not change", () => {
    const { a, editor } = densitySetup(3);
    a.setSlides(0);
    editor[0].pitch = 55;
    a.setAccents(100); // only accents change
    assert.strictEqual(editor[0].pitch, 55);
    editor[1].slide = 1; // manual slide
    a.setAccents(50);
    assert.strictEqual(editor[1].slide, 1);
});

test("a drag of density controls is one history entry", () => {
    const { a, flags } = densitySetup(11);
    const base = JSON.stringify(flags());
    a.setRests(40); a.setRests(60); a.setSlides(90);
    a.historyBack();
    assert.strictEqual(JSON.stringify(flags()), base);
});

test("density is reproducible with a seed and clamped", () => {
    const run = () => { const { flags, a } = densitySetup(21); a.setSlides(50); a.setRests(500); return JSON.stringify(flags()); };
    assert.strictEqual(run(), run());
    const { a, rests } = densitySetup(21);
    a.setRests(-30);
    assert.strictEqual(rests(), 0);
});

test("mutate keeps the density percentages exact", () => {
    for (let seed = 1; seed <= 30; seed++) {
        const { a, rests, notes, slides, accents } = densitySetup(seed);
        a.setRests(25); a.setSlides(40); a.setAccents(20);
        const r = rests(), sl = slides(), ac = accents();
        a.setMutateAmount(60);
        a.mutate();
        assert.strictEqual(rests(), r);
        assert.strictEqual(slides(), Math.round(notes() * 0.4));
        assert.strictEqual(accents(), Math.round(notes() * 0.2));
    }
});

test("mutate changes pitches and keeps unmutated pitches", () => {
    const { a, editor } = densitySetup(4);
    editor.forEach((s, i) => { s.pitch = 40 + i; });
    a.setMutateAmount(25);
    a.mutate();
    const unchanged = editor.filter((s, i) => s.pitch === 40 + i).length;
    assert.ok(unchanged >= 12 && unchanged < 16);
});

test("without a density-managed pattern, mutate falls back to the new steps' own flags", () => {
    const { a, calls } = mutateSetup(16); // never generated: no density entries
    a.setMutateAmount(100);
    a.mutate();
    const steps = calls.filter((c) => c[1] === "step");
    assert.strictEqual(steps.length, 16);
    assert.ok(steps.every((c) => Number.isFinite(c[3])));
});

test("density follows a pattern length that was changed after generating", () => {
    const { a, editor, rests, notes, slides, accents } = densitySetup(13);
    // the length is raised to 32: the new steps are managed too
    for (let i = 16; i < 32; i++) editor.push({ pitch: 36, velocity: 100, slide: 0, gate: 1 });
    a.setPatternLength(32);
    a.setSlides(100); a.setAccents(100);
    assert.strictEqual(editor.filter((s) => s.gate === 1 && s.slide === 0).length, 0);
    assert.strictEqual(editor.filter((s) => s.gate === 1 && s.velocity !== 127).length, 0);
    assert.strictEqual(rests(), Math.round(32 * 0.1));
    a.setRests(50);
    assert.strictEqual(rests(), 16);
    a.setRests(100);
    assert.strictEqual(notes(), 0);
    // and shortened to 8
    editor.length = 8;
    a.setPatternLength(8);
    a.setRests(25);
    assert.strictEqual(rests(), 2);
    assert.strictEqual(editor.filter((s) => s.gate === 1 && s.slide === 0).length, 0);
    a.setSlides(50);
    assert.strictEqual(slides(), Math.round(notes() * 0.5));
});

test("mutate after a length change keeps the percentages exact", () => {
    const { a, editor, rests, notes, slides } = densitySetup(17);
    for (let i = 16; i < 24; i++) editor.push({ pitch: 36, velocity: 100, slide: 0, gate: 1 });
    a.setPatternLength(24);
    a.setRests(25); a.setSlides(40);
    a.setMutateAmount(50);
    a.mutate();
    assert.strictEqual(rests(), 6);
    assert.strictEqual(slides(), Math.round(notes() * 0.4));
});
