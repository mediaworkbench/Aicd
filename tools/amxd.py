#!/usr/bin/env python3
"""Packs and unpacks the frozen Max for Live device Aicd.amxd.

A frozen .amxd embeds its dependencies (acid.js, lm.js, ...), so editing
acid.js in the repo has no effect on the device until it is packed again.

    python3 tools/amxd.py extract Aicd.amxd Aicd.maxpat
    python3 tools/amxd.py build Aicd.maxpat Aicd.amxd

`build` embeds the patch plus clipSelect.maxpat, acid.js, lm.js and acid.png
from the folder containing the patch.

Container layout (all fields little endian unless noted):
  'ampf' 4 'mmmm' 'meta' 4 <u32> 'ptch' <len>
  'mx@c' <u32 BE 16> <u32 BE 0> <u32 BE 16 + data size>
  <data: dependency files, concatenated>
  'dlst' <len> then one 'dire' record per file (fnam, sz32, of32, ...)
"""

import json
import os
import struct
import sys
import time

# (file name, 'dtype'/'type' tag, flag) in embedding order
DEPENDENCIES = [
    ("Aicd.amxd", b"JSON", 0x11),
    ("clipSelect.maxpat", b"JSON", 0),
    ("acid.js", b"TEXT", 0),
    ("lm.js", b"TEXT", 0),
    ("acid.png", b"\0\0\0\0", 0),
]
HEADER = b"ampf\x04\x00\x00\x00mmmmmeta\x04\x00\x00\x00\x07\x00\x00\x00ptch"
MAC_EPOCH_OFFSET = 2082844800  # seconds between 1904-01-01 and 1970-01-01


def _chunk(tag, payload):
    return tag + struct.pack(">I", len(payload) + 8) + payload


def _field(tag, value):
    return tag + struct.pack(">I", 12) + value


def parse(data):
    """Returns {name: bytes} for the files embedded in an .amxd."""
    assert data[:4] == b"ampf" and data[24:28] == b"ptch", "not an .amxd file"
    base = 32  # start of the ptch payload; of32 offsets are relative to it
    dlst = data.rfind(b"dlst")
    pos = dlst + 8
    files = {}
    while pos < len(data):
        assert data[pos:pos + 4] == b"dire"
        size = struct.unpack(">I", data[pos + 4:pos + 8])[0]
        record = data[pos + 8:pos + size]
        fields, p = {}, 0
        while p < len(record):
            tag = record[p:p + 4]
            length = struct.unpack(">I", record[p + 4:p + 8])[0]
            fields[tag] = record[p + 8:p + length]
            p += length
        name = fields[b"fnam"].rstrip(b"\0").decode()
        start = base + struct.unpack(">I", fields[b"of32"])[0]
        files[name] = data[start:start + struct.unpack(">I", fields[b"sz32"])[0]]
        pos += size
    return files


def patcher_text(raw):
    return raw.decode("utf8").rstrip("\r\n\0")


def pack(files, mdat=None):
    """Builds an .amxd from {name: bytes}, in the order of DEPENDENCIES."""
    if mdat is None:
        mdat = int(time.time()) + MAC_EPOCH_OFFSET
    body = b""
    records = b""
    offset = 16  # the mx@c header precedes the data
    for name, kind, flag in DEPENDENCIES:
        content = files[name]
        fname = name.encode() + b"\0"
        fname += b"\0" * (-(len(fname) + 8) % 4)  # pad record to 4 bytes
        record = (
            b"type" + struct.pack(">I", 12) + kind
            + b"fnam" + struct.pack(">I", len(fname) + 8) + fname
            + _field(b"sz32", struct.pack(">I", len(content)))
            + _field(b"of32", struct.pack(">I", offset))
            + _field(b"vers", b"\0\0\0\0")
            + _field(b"flag", struct.pack(">I", flag))
            + _field(b"mdat", struct.pack(">I", mdat))
        )
        records += _chunk(b"dire", record)
        body += content
        offset += len(content)
    dlst = _chunk(b"dlst", records)
    mxc = b"mx@c" + struct.pack(">III", 16, 0, 16 + len(body))
    payload = mxc + body + dlst
    return HEADER + struct.pack("<I", len(payload)) + payload


def main(argv):
    if len(argv) == 4 and argv[1] == "extract":
        files = parse(open(argv[2], "rb").read())
        text = patcher_text(files["Aicd.amxd"])
        json.loads(text)  # validate
        with open(argv[3], "w", encoding="utf8", newline="") as f:
            f.write(text + "\r\n")
    elif len(argv) == 4 and argv[1] == "build":
        src = os.path.dirname(os.path.abspath(argv[2]))
        files = {}
        for name, _, _ in DEPENDENCIES:
            path = argv[2] if name == "Aicd.amxd" else os.path.join(src, name)
            files[name] = open(path, "rb").read()
        patch = patcher_text(files["Aicd.amxd"])
        json.loads(patch)  # refuse to embed a broken patch
        files["Aicd.amxd"] = patch.encode("utf8") + b"\r\n\0"
        open(argv[3], "wb").write(pack(files))
    else:
        print(__doc__)
        sys.exit(1)


if __name__ == "__main__":
    main(sys.argv)
