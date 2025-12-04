# Project: C. auris RNA-seq White Paper

## Overview
White paper demonstrating BRC-Analytics for standardized *C. auris* RNA-seq analysis. Re-analyzed two published studies (Santana 2023 Science, Wang 2024 Nature Comm) achieving R² > 0.98 correlation.

## Current Status (Dec 4, 2025)
- Manuscript draft complete with figures, citations
- BioProject literature survey done (20/64 RNA-seq projects have papers)
- **PENDING**: User to write "Obtaining Data from BRC-Analytics" section in Results

## Key Files
- `MANUSCRIPT.md` - Main manuscript (Pandoc + BibTeX)
- `MANUSCRIPT.pdf` - Compiled PDF
- `references.bib` - Bibliography (20+ entries)
- `compile.sh` - Run `./compile.sh` to generate PDF
- `BioProject_PAPERS.md` - RNA-seq BioProject survey (20 papers, genome/tools)
- `Cauris_SRA.csv` - Complete SRA metadata (27,201 runs)
- `STEPS.md` - Detailed process documentation (Phases 1-14)

## Compilation
```bash
./compile.sh      # PDF (default)
./compile.sh docx # Word
./compile.sh html # HTML
```

## Key Statistics
- 32 published RNA-seq studies (2018-2025)
- 64 RNA-seq BioProjects in SRA (27% of all C. auris projects)
- Validation: Santana R²=0.9996, Wang r=0.9914-1.0000
- Reference genome: GCA_002759435.3 (B8441)

## Related Repos
- Survey: github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_survey
- Santana: github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261
- Wang: github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003

## Citation Style
Vancouver numbered [1], [2]. Use `[@key]` syntax in markdown.
