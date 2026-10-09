inlets = 1;
outlets = 5; // 0 steps, 1 generated, 2 init, 3 mapped pitch, 4 last seed

include("lm.js");

var temperature = 1.0;
var velocity = 100;
var patternLength = 16;
var currentSteps = [];
var majorVersion;

function setInitialized(v) {
    if (v === 0) {
        outlet(2, 1);
        generate();
        outlet(0, "zoom_fit");
    }
}

// Lowest effective temperature; keeps the exponent finite.
var MIN_TEMPERATURE = 0.05;

var seed = 0;
var rngState = 1;

// xorshift32, so a pattern can be reproduced from its seed.
// Only uses ES5 integer ops, as Max's js engine may lack Math.imul.
function seedRandom(s) {
    rngState = (s >>> 0) || 1;
    for (var i = 0; i < 8; i++) random();
}

function random() {
    var x = rngState;
    x ^= x << 13;
    x >>>= 0;
    x ^= x >>> 17;
    x ^= x << 5;
    x >>>= 0;
    rngState = x;
    return x / 4294967296;
}

// Samples the next character from p^(1/T), renormalized.
// T = 1 gives the trained distribution, T > 1 flattens it, T < 1 sharpens it.
// Returns undefined if the history has no continuation in the model.
function generateLetter(lm, history, order, temperature) {
    var h = history.slice(-order);
    var l = lm[h];
    if (l === undefined) return undefined;

    var inv = 1.0 / Math.max(temperature, MIN_TEMPERATURE);
    var keys = [];
    var weights = [];
    var total = 0;
    for (var key in l) {
        if (l.hasOwnProperty(key)) {
            var w = Math.pow(l[key], inv);
            keys.push(key);
            weights.push(w);
            total += w;
        }
    }
    if (keys.length === 0) return undefined;

    var x = random() * total;
    for (var i = 0; i < keys.length; i++) {
        x -= weights[i];
        if (x <= 0.0) return keys[i];
    }
    return keys[keys.length - 1];
}

var startKeys = null;

function randomStart(lm) {
    if (startKeys === null) {
        startKeys = Object.keys(lm).filter(function (k) { return k.slice(-2) === "~\n"; });
    }
    return startKeys[Math.floor(random() * startKeys.length)];
}

function generateText(lm, order, nletters, temperature) {
    var history = randomStart(lm);
    var s = "";
    for (var i = 0; i < nletters; i++) {
        var c = generateLetter(lm, history, order, temperature);
        if (c === undefined) {
            // dead end (the end of the training data): start over
            history = randomStart(lm);
            c = generateLetter(lm, history, order, temperature);
        }
        history = history.slice(1) + c;
        s += c;
    }
    return s;
}

function generatePattern(lm, order, patternLength, temperature) {
    var stepLength = 9;
    var text = generateText(lm, order, (stepLength + 2) * patternLength, temperature);
    var lines = text.split("\n");
    var re = /^(.)!([01])\$([01])#([01])=$/;
    var s = 0;
    var steps = [];
    var c1 = 36;

    for (var l = 0; l < lines.length; l++) {
        var line = lines[l];
        if (line === "~") continue;
        var m = line.match(re);
        if (m === null) continue;

        var step = {
            note: editorPitch(m[1].charCodeAt(0) - 82 + c1),
            accent: m[2] === "1",
            slide: m[3] === "1" ? 1 : 0,
            gate: m[4] === "1" ? 1 : 0
        };

        steps.push(step);

        s = s + 1;
        if (s === patternLength) break;
    }

    applyDensity(steps);
    return steps;
}

// Density: the share of the steps that are rests, and the share of the notes that slide
// or are accented, in percent. The model's own rests, slides and accents are not used.
// Every step gets three fixed random numbers (u). The steps that are rests / slides /
// accents are those with the lowest numbers, so raising or lowering a percentage adds or
// removes the same steps in the same order, and the editor always shows exactly the percentage.
var restsPct = 10;
var slidesPct = 33;
var accentsPct = 33;

// baseSteps[i] = { u: [rests, slides, accents] }, one entry per step of the generated pattern
var baseSteps = [];
// the number of steps the flags in the editor were last derived for
var managedLength = 0;

function clampPct(p) {
    return Math.min(100, Math.max(0, Math.round(p)));
}

function targets() {
    return [restsPct, slidesPct, accentsPct];
}

function setRests(p) { var old = targets(); restsPct = clampPct(p); applyDensityToEditor(old); }
function setSlides(p) { var old = targets(); slidesPct = clampPct(p); applyDensityToEditor(old); }
function setAccents(p) { var old = targets(); accentsPct = clampPct(p); applyDensityToEditor(old); }

// The first k of the indices, ordered by the random number u[channel] (then by index).
function lowest(entries, indices, channel, k) {
    var sorted = indices.slice().sort(function (x, y) {
        return entries[x].u[channel] - entries[y].u[channel] || x - y;
    });
    return sorted.slice(0, k);
}

// The flags { gate, slide, accent } of the first n steps for the percentages t.
// Returns null if the entries do not cover all n steps.
function deriveFlags(entries, n, t) {
    var i;
    for (i = 0; i < n; i++) if (!entries[i]) return null;
    var all = [];
    for (i = 0; i < n; i++) all.push(i);

    var rests = lowest(entries, all, 0, Math.round(n * t[0] / 100));
    var flags = [];
    for (i = 0; i < n; i++) flags.push({ gate: 1, slide: 0, accent: false });
    for (i = 0; i < rests.length; i++) flags[rests[i]].gate = 0;

    var notes = [];
    for (i = 0; i < n; i++) if (flags[i].gate === 1) notes.push(i);
    var slides = lowest(entries, notes, 1, Math.round(notes.length * t[1] / 100));
    var accents = lowest(entries, notes, 2, Math.round(notes.length * t[2] / 100));
    for (i = 0; i < slides.length; i++) flags[slides[i]].slide = 1;
    for (i = 0; i < accents.length; i++) flags[accents[i]].accent = true;
    return flags;
}

function flagsDiffer(a, b) {
    return a.gate !== b.gate || a.slide !== b.slide || a.accent !== b.accent;
}

// Called for a newly generated pattern: gives every step its random numbers (step.density)
// and its flags for the current percentages. The caller keeps the entries in baseSteps.
function applyDensity(steps) {
    var entries = [];
    for (var i = 0; i < steps.length; i++) {
        var entry = { u: [random(), random(), random()] };
        entries.push(entry);
        steps[i].density = entry;
    }
    var flags = deriveFlags(entries, steps.length, targets());
    if (flags === null) return;
    for (var j = 0; j < steps.length; j++) {
        steps[j].gate = flags[j].gate;
        steps[j].slide = flags[j].slide;
        steps[j].accent = flags[j].accent;
    }
}

// Sends the changed flags of step j to the editor. Only the flags that differ between
// before and after are replaced, so other manual edits of the step stay.
function sendFlagChange(j, before, after) {
    var live = liveSteps[j];
    var gate = before.gate !== after.gate ? after.gate : live.gate;
    var slide = before.slide !== after.slide ? after.slide : live.slide;
    var vel = live.velocity;
    if (before.accent !== after.accent) vel = after.accent ? 127 : velocity;
    outlet(0, "step", j + 1, live.pitch, vel, 120, slide, gate);
    live.gate = gate;
    live.slide = slide;
    live.velocity = vel;
}

// Makes the rests, slides and accents of the first n steps of the editor match the
// percentages. Used when the pattern length changed after the pattern was generated:
// new steps get their own random numbers, and the percentages are taken of the new length.
// Returns false for a pattern that was not generated in this session.
function resyncDensity(n) {
    if (baseSteps.length === 0 || n === 0) return false;
    while (baseSteps.length < n) baseSteps.push({ u: [random(), random(), random()] });
    var after = deriveFlags(baseSteps, n, targets());
    for (var i = 0; i < n; i++) {
        var live = liveSteps[i];
        var current = { gate: live.gate, slide: live.slide, accent: live.velocity === 127 };
        if (flagsDiffer(current, after[i])) sendFlagChange(i, current, after[i]);
    }
    managedLength = n;
    return true;
}

// Applies a changed density setting to the pattern in the editor. Patterns that were not
// generated in this session (e.g. a loaded set) are left alone.
function applyDensityToEditor(oldTargets) {
    if (baseSteps.length === 0) return;
    try { callPatternStepDump(); } catch (e) { return; /* no editor, e.g. in tests */ }
    if (liveStepsLen !== managedLength) {
        pushUndo("density");
        if (resyncDensity(liveStepsLen)) {
            syncCurrentSteps(liveStepsLen);
            clipOut();
        }
        return;
    }
    var n = Math.min(baseSteps.length, liveStepsLen);
    var before = deriveFlags(baseSteps, n, oldTargets);
    var after = deriveFlags(baseSteps, n, targets());
    if (before === null || after === null) return;
    var changes = [];
    for (var i = 0; i < n; i++) if (flagsDiffer(before[i], after[i])) changes.push(i);
    if (changes.length === 0) return;

    pushUndo("density");
    for (var c = 0; c < changes.length; c++) sendFlagChange(changes[c], before[changes[c]], after[changes[c]]);
    syncCurrentSteps(n);
    clipOut();
}

// Keeps the steps used by setVelocity in sync with the editor.
function syncCurrentSteps(n) {
    var steps = [];
    for (var j = 0; j < n; j++) {
        var live = liveSteps[j];
        steps.push({ note: live.pitch, accent: live.velocity === 127, slide: live.slide, gate: live.gate });
    }
    currentSteps = steps;
}

function sendCurrentSteps() {
    for (var s = 0; s < currentSteps.length; s++) {
        var step = currentSteps[s];
        outlet(0, "step", s + 1, step.note, step.accent ? 127 : velocity, 120, step.slide, step.gate);
    }
    clipOut();
}

var MAX_SEED = 999999;

function startGeneration() {
    lastSeed = seed !== 0 ? seed : Math.floor(Math.random() * MAX_SEED) + 1;
    seedRandom(lastSeed);
    outlet(4, "set", lastSeed);
}

function generate() {
    startGeneration();
    currentSteps = generatePattern(lm, 18, patternLength, temperature);
    baseSteps = [];
    for (var i = 0; i < currentSteps.length; i++) baseSteps.push(currentSteps[i].density);
    managedLength = currentSteps.length;
    sendCurrentSteps();
    outlet(1, "bang");
}

function bang() {
    pushUndo();
    generate();
}

function setTemperature(t) {
    temperature = t;
}

var lastSeed = 0;

var mutateAmount = 25;

// Percentage of steps that mutate() replaces.
function setMutateAmount(a) {
    mutateAmount = Math.min(100, Math.max(0, a));
}

// Picks n distinct indices out of 0..length-1.
function pickIndices(length, n) {
    var all = [];
    for (var i = 0; i < length; i++) all.push(i);
    for (var j = 0; j < n; j++) {
        var k = j + Math.floor(random() * (length - j));
        var t = all[j];
        all[j] = all[k];
        all[k] = t;
    }
    return all.slice(0, n);
}

// Replaces mutateAmount percent of the steps (at least one) of the pattern in the
// editor with the steps at the same positions of a freshly generated pattern.
// The remaining steps, including manual edits, stay as they are.
function mutate() {
    callPatternStepDump();
    var n = liveStepsLen;
    if (n === 0 || mutateAmount === 0) return;

    // Mutate always uses a new random seed: with a fixed seed it would pick the same
    // steps and replacements every time, so after the first press nothing would change.
    pushUndo();
    seedRandom(Math.floor(Math.random() * MAX_SEED) + 1);
    var fresh = generatePattern(lm, 18, n, temperature);
    var count = Math.min(fresh.length, Math.max(1, Math.round(n * mutateAmount / 100)));
    var indices = pickIndices(fresh.length, count);

    // With a density-managed pattern the new steps get new pitches, and the rest / slide /
    // accent pattern of the mutated steps is shuffled among themselves, which keeps the
    // percentages exact. Otherwise the new steps bring their own flags.
    if (baseSteps.length > 0 && n !== managedLength) resyncDensity(n);
    var managed = deriveFlags(baseSteps, n, targets()) !== null;
    var before = null;
    var after = null;
    if (managed) {
        before = deriveFlags(baseSteps, n, targets());
        for (var c = 0; c < 3; c++) {
            var values = [];
            for (var k = 0; k < indices.length; k++) values.push(baseSteps[indices[k]].u[c]);
            for (var m = values.length - 1; m > 0; m--) {
                var r = Math.floor(random() * (m + 1));
                var t = values[m]; values[m] = values[r]; values[r] = t;
            }
            for (var q = 0; q < indices.length; q++) baseSteps[indices[q]].u[c] = values[q];
        }
        after = deriveFlags(baseSteps, n, targets());
    }

    var replaced = {};
    for (var i = 0; i < indices.length; i++) {
        var s = indices[i];
        var step = fresh[s];
        var flags = managed ? after[s] : { gate: step.gate, slide: step.slide, accent: step.accent };
        var vel = flags.accent ? 127 : velocity;
        outlet(0, "step", s + 1, step.note, vel, 120, flags.slide, flags.gate);
        liveSteps[s] = { pitch: step.note, velocity: vel, slide: flags.slide, gate: flags.gate };
        replaced[s] = true;
    }
    if (managed) {
        // other steps may change when the shuffled flags move across the cut-off
        for (var j = 0; j < n; j++) {
            if (!replaced[j] && flagsDiffer(before[j], after[j])) sendFlagChange(j, before[j], after[j]);
        }
    }

    syncCurrentSteps(n);
    clipOut();
}

// 0 = a new random pattern on every Generate, anything else = reproducible pattern.
function setSeed(s) {
    seed = Math.min(MAX_SEED, Math.max(0, Math.floor(s)));
}

function setVelocity(v) {
    velocity = v;
    sendCurrentSteps();
}

function setPatternLength(p) {
    patternLength = p;
    clipOut();
}

var transpose = 0;

// Semitones added to the pitches of the clip and the playback;
// the step editor is not affected.
function setTranspose(t) {
    transpose = Math.round(t);
    clipOut();
}

// Names of the scale menu in Aicd.maxpat, in the same order.
var SCALES = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], // Off
    [0, 2, 4, 5, 7, 9, 11],                  // Major
    [0, 2, 3, 5, 7, 8, 10],                  // Minor
    [0, 2, 3, 5, 7, 9, 10],                  // Dorian
    [0, 1, 3, 5, 7, 8, 10],                  // Phrygian
    [0, 2, 4, 6, 7, 9, 11],                  // Lydian
    [0, 2, 4, 5, 7, 9, 10],                  // Mixolydian
    [0, 1, 3, 5, 6, 8, 10],                  // Locrian
    [0, 2, 3, 5, 7, 8, 11],                  // Harmonic minor
    [0, 3, 5, 7, 10],                        // Minor pentatonic
    [0, 2, 4, 7, 9],                         // Major pentatonic
    [0, 3, 5, 6, 7, 10],                     // Blues
    [0, 1, 4, 5, 7, 8, 10]                   // Phrygian dominant
];

var scaleIndex = 0;
var scaleRoot = 0;

var SCALE_NAMES = ["Off", "Major", "Minor", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Locrian",
    "Harmonic minor", "Minor pentatonic", "Major pentatonic", "Blues", "Phrygian dominant"];
var NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];

function setScale(i) {
    scaleIndex = Math.min(SCALES.length - 1, Math.max(0, Math.round(i)));
    applyScaleToEditor();
    clipOut();
}

function setRoot(r) {
    scaleRoot = ((Math.round(r) % 12) + 12) % 12;
    applyScaleToEditor();
    clipOut();
}

// Pitch of a step in the editor: moved into the scale, within the MIDI range.
function editorPitch(pitch) {
    if (scaleIndex === 0) return pitch;
    var p = quantizePitch(pitch, scaleRoot, scaleIndex);
    // scales repeat every octave, so shifting by 12 stays in the scale
    while (p > 127) p -= 12;
    while (p < 0) p += 12;
    return p;
}

// Moves the steps of the editor into the scale; returns the number of steps changed.
// This overwrites the pitches (history can bring them back).
function applyScaleToEditor() {
    if (scaleIndex === 0) return 0;
    try { callPatternStepDump(); } catch (e) { return 0; /* no editor, e.g. in tests */ }
    var changes = [];
    for (var i = 0; i < liveStepsLen; i++) {
        var pitch = editorPitch(liveSteps[i].pitch);
        if (pitch !== liveSteps[i].pitch) changes.push(i);
    }
    if (changes.length === 0) return 0;

    pushUndo();
    for (var c = 0; c < changes.length; c++) {
        var j = changes[c];
        var step = liveSteps[j];
        step.pitch = editorPitch(step.pitch);
        outlet(0, "step", j + 1, step.pitch, step.velocity, 120, step.slide, step.gate);
        if (j < currentSteps.length) currentSteps[j].note = step.pitch;
    }
    return changes.length;
}

// History of the editor: Generate, Mutate and scale changes can be undone.
var MAX_HISTORY = 50;
var undoStack = [];
var redoStack = [];

function snapshot() {
    callPatternStepDump();
    var steps = [];
    for (var i = 0; i < liveStepsLen; i++) {
        var s = liveSteps[i];
        steps.push({ pitch: s.pitch, velocity: s.velocity, slide: s.slide, gate: s.gate });
    }
    return steps;
}

var lastUndoKind = "";

// kind: consecutive changes of the same kind (e.g. dragging a density control)
// share one history entry.
function pushUndo(kind) {
    if (kind && kind === lastUndoKind) return;
    lastUndoKind = kind || "";
    var steps;
    try { steps = snapshot(); } catch (e) { return; /* no editor, e.g. in tests */ }
    if (steps.length === 0) return;
    undoStack.push(steps);
    if (undoStack.length > MAX_HISTORY) undoStack.shift();
    redoStack = [];
}

function restoreSteps(steps) {
    currentSteps = [];
    for (var i = 0; i < steps.length; i++) {
        var s = steps[i];
        outlet(0, "step", i + 1, s.pitch, s.velocity, 120, s.slide, s.gate);
        currentSteps.push({ note: s.pitch, accent: s.velocity === 127, slide: s.slide, gate: s.gate });
    }
    clipOut();
}

function historyBack() {
    lastUndoKind = "";
    if (undoStack.length === 0) return;
    redoStack.push(snapshot());
    restoreSteps(undoStack.pop());
}

function historyForward() {
    lastUndoKind = "";
    if (redoStack.length === 0) return;
    undoStack.push(snapshot());
    restoreSteps(redoStack.pop());
}

// Moves a pitch to the nearest note of the scale (the lower one if there are two).
function quantizePitch(pitch, root, scale) {
    var degrees = SCALES[scale];
    for (var d = 0; d < 12; d++) {
        var down = (((pitch - d - root) % 12) + 12) % 12;
        if (degrees.indexOf(down) >= 0) return pitch - d;
        var up = (((pitch + d - root) % 12) + 12) % 12;
        if (degrees.indexOf(up) >= 0) return pitch + d;
    }
    return pitch;
}

// The pitch that is played and written to the clip for a pitch of the step editor.
function outputPitch(pitch) {
    var p = pitch + transpose;
    if (scaleIndex !== 0) {
        p = quantizePitch(p, scaleRoot, scaleIndex);
        // scales repeat every octave, so shifting by 12 stays in the scale
        while (p > 127) p -= 12;
        while (p < 0) p += 12;
    }
    return Math.min(127, Math.max(0, p));
}

// Playback: the playMIDI subpatcher sends the pitch of each step here.
function mapPitch(pitch) {
    outlet(3, outputPitch(pitch));
}

var fixGate = false;

function setFixGate(v) {
    fixGate = v === 1;
    clipOut();
}

function Note(pitch, start, duration, velocity, muted) {
    this.Pitch = pitch;
    this.Start = start;
    this.Duration = duration;
    this.Velocity = velocity;
}

var liveSteps = [];
var liveStepsLen = 0;

function dumpStep(s, i, pitch, velocity, l, slide, gate) {
    if (s === "changed") {
        clipOut();
    } else {
        if (gate === undefined) return;
        liveSteps[i - 1] = {
            pitch: pitch,
            velocity: velocity,
            slide: slide,
            gate: gate
        };
        liveStepsLen = i;
    }
}

function generateMidi() {
    var notes = [];
    var i;
    var previousNote = null;

    for (i = 0; i < liveStepsLen; i++) {
        var step = liveSteps[i];
        var previousStep = i > 0 ? liveSteps[i - 1] : null;
        if (!fixGate && step.gate === 0) continue;
        if (previousStep !== null && previousStep.pitch === step.pitch && previousStep.slide === 1 && (fixGate || previousStep.gate === 1)) {
            // slide and same pitch as previous step -> extend duration of previous note
            if (step.slide === 1)
                previousNote.Duration += 0.25;
        } else {
            var note = new Note(outputPitch(step.pitch), i / 4.0, step.slide === 1 ? 0.375 : 0.125, step.velocity);
            notes.push(note);
            previousNote = note;
        }
    }

    return notes;
}

function getTrackPath() {
    var path = "this_device canonical_parent";
    var parent = new LiveAPI(path);
    
    while (parent.type !== "Track") {
        path = path + " canonical_parent";
        parent = new LiveAPI(path);
    } 

    return path;
}

function clip() {
    var trackPath = getTrackPath();
    var track = new LiveAPI(trackPath);
    var clipSlots = track.getcount("clip_slots");
    var clipSlot;

    var firstClip = null;

    for (var clipSlotNum = 0; clipSlotNum < clipSlots; clipSlotNum++) {
        clipSlot = new LiveAPI(trackPath + " clip_slots " + clipSlotNum);
        var hasClip = clipSlot.get("has_clip").toString() !== "0";
        if (!hasClip) break;
    }

    if (clipSlotNum === clipSlots) {
        // have to create new clip slot (scene)
        var set = new LiveAPI("live_set");
        set.call("create_scene", -1);
        clipSlot = new LiveAPI(trackPath + " clip_slots " + clipSlotNum);
    }

    var beats = Math.ceil(patternLength / 4);
    clipSlot.call("create_clip", beats);
    var clip = new LiveAPI(trackPath + " clip_slots " + clipSlotNum + " clip");
    var notes = generateMidi();

    setNotes(clip, notes);
}

function setNotes(clip, notes) {
    if (majorVersion <= 10) {
        clip.call("set_notes");
        clip.call("notes", notes.length);
    
        for (var i = 0; i < notes.length; i++) {
            var note = notes[i];
            clip.call("note", note.Pitch, note.Start.toFixed(4), note.Duration.toFixed(4), note.Velocity, note.Muted);
        }
    
        clip.call("done");
    } else {
        var noteSpecifications = [];

        for (var i = 0; i < notes.length; i++) {
            var note = notes[i];
            var noteSpecification = {
                pitch: note.Pitch,
                start_time: note.Start,
                duration: note.Duration,
                velocity: note.Velocity,
                mute: note.Muted
            };
            noteSpecifications.push(noteSpecification);
        }

        var notesToAdd = {
            notes: noteSpecifications
        };

        clip.call("add_new_notes", notesToAdd);
    }
}

var clips = {
    out: null
};
var ids = {
    out: 0
};
var init = false;

function liveInit() {
    majorVersion = new LiveAPI("live_app").call("get_major_version");
    init = true;
    if (ids.out !== 0) {
        setOut(ids.out);
    }
}

function setClip(name, id) {
    if (!init) {
        ids[name] = id;
        return;
    }
    if (id === 0) {
        clips[name] = null;
        return;
    }
    var clipId = "id " + id;
    clips[name] = new LiveAPI(clipId);
}

function setOut(id) {
    setClip("out", id);
    clipOut();
}

function clipOut() {
    if (clips.out !== null) {
        var outClip = clips.out;
        callPatternStepDump();
        var stepNotes = generateMidi();
        if (stepNotes === undefined) stepNotes = [];
        replaceAllNotes(outClip, stepNotes);
    }
}

function replaceAllNotes(clip, notes) {
    if (majorVersion <= 10) {
        clip.call("select_all_notes");
        clip.call("replace_selected_notes");
        clip.call("notes", notes.length);
    
        for (var i = 0; i < notes.length; i++) {
            var note = notes[i];
            callNote(clip, note);
        }
    
        clip.call("done");
    } else {
        clip.call("remove_notes_extended", 0, 127, 0, 4294967295);
        setNotes(clip, notes);
    }
}

function callNote(clip, note) {
    clip.call("note", note.Pitch, note.Start.toFixed(4), note.Duration.toFixed(4), note.Velocity, note.Muted);
}

function callPatternStepDump() {
    var patternStep = this.patcher.getnamed("patternStep");
    patternStep.message("dump");
}

function recallPreset() {
    clipOut();
}
