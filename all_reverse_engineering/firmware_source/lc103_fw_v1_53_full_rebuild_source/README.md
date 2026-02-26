# LC103 FW v1.53 Full Source Package

This package is a full source-equivalent reconstruction of `Sencore_LC103_FW_v1.53.BIN`.

## What this gives you
- Full normalized firmware source listing for all addresses `0x00000000..0x0001FFFF`.
- Machine-editable byte map for deterministic patch/rebuild workflows.
- Rebuild script that regenerates a binary and verifies byte identity.

## Files
- `source/fw153_full_source.lst` - full listing (`offset: bytes | instruction`).
- `source/fw153_full_source.csv` - same data in CSV form.
- `source/bank0_source.lst` - bank 0 listing (`0x0000..0xFFFF`).
- `source/bank1_source.lst` - bank 1 listing (`0x10000..0x1FFFF`).
- `source/fw153_bytes.map` - full byte map, one byte per offset.
- `source/fw153_full_source_annotated.lst` - full listing with function-level developer comments.
- `source/fw153_function_map.csv/.md/.json` - exhaustive function map with inferred purpose, confidence, and evidence.
- `source/fw153_region_map_0x100.csv` - region-by-region map for whole firmware.
- `source/fw153_symbols.inc` - inferred symbol names for patch/assembly workflows.
- `source/bank0_reconstructed_annotated.asm` - bank0 reconstructed assembly with function comments.
- `source/bank1_reconstructed_annotated.asm` - bank1 reconstructed assembly with function comments.
- `source/fw153_human_map_overview.md` - human-readable subsystem and coverage summary.
- `build/Sencore_LC103_FW_v1.53.rebuilt.bin` - listing-derived rebuilt image.
- `verify/rebuild_verification.txt` and `.json` - rebuild integrity checks.
- `tools/build_from_listing.py` - generator/rebuilder.
- `tools/generate_human_mapping.py` - builds annotated source, function map, region map, and symbols.
- `input/firmware.bin` - source firmware image used for deterministic rebuild checks.
- `rizin/linear_disasm_8051_full_clean.txt` - full clean linear disassembly used by rebuild tool.
- `maps/` + `reports/protocol_strings_with_offsets.tsv` - inputs used by human mapping generator.

## Regenerate
```sh
python3 tools/build_from_listing.py \
  --listing rizin/linear_disasm_8051_full_clean.txt \
  --firmware input/firmware.bin \
  --outdir .

python3 tools/generate_human_mapping.py
```

## Important
This is full source-equivalent from binary RE, not original vendor C/LabVIEW source.
