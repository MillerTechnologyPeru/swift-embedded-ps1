#!/usr/bin/env python3
"""
elf2psexe.py — Wrap a raw binary with a PS-X EXE header.

Usage:
    python3 elf2psexe.py input.bin output.psexe [load_addr [entry_addr]]

    load_addr   where the binary is DMA'd into PS1 RAM  (default: 0x80010000)
    entry_addr  execution entry point                    (default: load_addr)
"""
import sys, struct

HEADER_SIZE = 2048

def make_psexe(binary: bytes, load: int, entry: int) -> bytes:
    pad = (-len(binary)) % 2048
    binary += b"\x00" * pad
    hdr = bytearray(HEADER_SIZE)
    hdr[0:8] = b"PS-X EXE"
    struct.pack_into("<I", hdr, 0x010, entry)   # initial PC
    struct.pack_into("<I", hdr, 0x014, 0)       # GP (unused)
    struct.pack_into("<I", hdr, 0x018, load)    # load address
    struct.pack_into("<I", hdr, 0x01C, len(binary))
    region = b"Sony Computer Entertainment Inc. for North America area"
    hdr[0x04C:0x04C + len(region)] = region
    return bytes(hdr) + binary

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(__doc__); sys.exit(1)
    load  = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0x80010000
    entry = int(sys.argv[4], 16) if len(sys.argv) > 4 else load
    binary = open(sys.argv[1], "rb").read()
    out = make_psexe(binary, load, entry)
    open(sys.argv[2], "wb").write(out)
    print(f"  ✓  {sys.argv[2]}  ({len(out)} bytes,  load=0x{load:08X}  entry=0x{entry:08X})")
