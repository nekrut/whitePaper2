# Project: C. auris RNA-seq White Paper

## Overview
White paper demonstrating BRC-Analytics + agentic AI (Claude Code Agent) for standardized *C. auris* RNA-seq analysis. Re-analyzed two published studies using official NCBI gene ID mapping validated by protein sequence identity.

## Current Status (Dec 12, 2025)
- Manuscript complete with corrected methodology
- Gene mapping: NCBI `old_locus_tag` attribute (NOT LFC correlation)
- Validation: Santana R²=0.89-0.94, Wang R²=0.98-0.9998
- AI mistakes section added to Discussion (cautionary tale)

## Key Files
- `MANUSCRIPT.md` - Main manuscript (Pandoc + BibTeX)
- `MANUSCRIPT.pdf` - Compiled PDF
- `SLIDES.md` / `SLIDES.pdf` - Presentation slides (Marp format)
- `references.bib` - Bibliography (20+ entries)
- `compile.sh` - Run `./compile.sh` to generate PDF
- `validation_figures/` - Scatter plots with validated gene mappings

## Compilation
```bash
./compile.sh      # PDF (default)
./compile.sh docx # Word
./compile.sh html # HTML
npx @marp-team/marp-cli SLIDES.md -o SLIDES.pdf --allow-local-files  # Slides
```

## Key Statistics
- 20 published RNA-seq studies with linked BioProjects (2018-2025)
- 64 RNA-seq BioProjects in SRA (27% of all C. auris projects)
- Validation (NCBI official mapping): Santana R²=0.89-0.94, Wang R²=0.98-0.9998
- Reference genome: GCA_002759435.3 (B8441)

## Important: Gene ID Mapping
- **DO NOT USE** LFC correlation mapping (only 1% accurate despite R²=0.9996)
- **USE** NCBI `old_locus_tag` attribute from GTF file for v2→v3 gene correspondence
- Validate with protein sequence identity (100% match confirms correct mapping)

## Related Repos
- Survey: github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_survey
- Santana: github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261
- Wang: github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003

## Citation Style
Vancouver numbered [1], [2]. Use `[@key]` syntax in markdown.
