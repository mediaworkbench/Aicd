#!/usr/bin/env node
// Trains the character n-gram model (lm.js) used by acid.js.
// Replaces patterns.csx and model.csx; needs only Node.js.
//
//   node train.js <dir-with-.pat-files> [--order 18] [--out lm.js] [--text-out input_patterns.txt]
//   node train.js --text input_patterns.txt [--order 18] [--out lm.js]

const fs = require("fs");
const path = require("path");

// A step is encoded as 9 characters, e.g. "F!0$1#1=\n":
// note char, "!" accent, "$" slide, "#" gate, "=" end of step.
// A pattern ends with "~\n".
const STEP_RE = /^(-?\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/;

function toNote(m) {
    let n = parseInt(m[1], 10);
    if (m[2] === "1") n -= 12;
    if (m[3] === "1") n += 12;
    if (n >= 36) n = (n % 12) + 24;
    return String.fromCharCode(n + 82);
}

function stepToText(m) {
    return `${toNote(m)}!${m[4]}$${m[5]}#${m[6]}=`;
}

function patternToText(contents) {
    const steps = contents
        .split(/\r?\n/)
        .filter((l) => !l.startsWith(";"))
        .map((l) => l.match(STEP_RE))
        .filter((m) => m !== null)
        .map(stepToText);
    return steps.length === 0 ? "" : steps.join("\n") + "\n~\n";
}

function findPatFiles(dir) {
    const files = [];
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) files.push(...findPatFiles(full));
        else if (entry.name.toLowerCase().endsWith(".pat")) files.push(full);
    }
    return files.sort();
}

function patternsToText(dir) {
    return findPatFiles(dir)
        .map((f) => patternToText(fs.readFileSync(f, "utf8")))
        .join("");
}

function trainCharLm(data, order) {
    const counts = new Map();
    for (let i = 0; i < data.length - order; i++) {
        const history = data.substr(i, order);
        const ch = data[i + order];
        let counter = counts.get(history);
        if (counter === undefined) counts.set(history, (counter = new Map()));
        counter.set(ch, (counter.get(ch) || 0) + 1);
    }

    const lm = {};
    for (const [history, counter] of counts) {
        let total = 0;
        for (const c of counter.values()) total += c;
        const dist = {};
        for (const [ch, c] of counter) dist[ch] = c / total;
        lm[history] = dist;
    }
    return lm;
}

function main(argv) {
    const args = { order: 18, out: "lm.js", textOut: null, text: null, dir: null };
    for (let i = 0; i < argv.length; i++) {
        const a = argv[i];
        if (a === "--order") args.order = parseInt(argv[++i], 10);
        else if (a === "--out") args.out = argv[++i];
        else if (a === "--text-out") args.textOut = argv[++i];
        else if (a === "--text") args.text = argv[++i];
        else args.dir = a;
    }
    if (!args.dir && !args.text) {
        console.error("usage: node train.js <pattern-dir> | --text <file> [--order 18] [--out lm.js] [--text-out file]");
        process.exit(1);
    }

    const data = args.text ? fs.readFileSync(args.text, "utf8") : patternsToText(args.dir);
    if (args.textOut) fs.writeFileSync(args.textOut, data);

    const lm = trainCharLm(data, args.order);
    fs.writeFileSync(args.out, "var lm = " + JSON.stringify(lm) + ";");
    console.log(`order ${args.order}: ${data.length} chars, ${Object.keys(lm).length} states -> ${args.out}`);
}

if (require.main === module) main(process.argv.slice(2));

module.exports = { toNote, patternToText, patternsToText, trainCharLm };
