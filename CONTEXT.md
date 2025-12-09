# Session Context (December 9, 2025)

## Current State

Manuscript in active development with significant Results section expansion underway.

## Recent Changes (this session)
- Added WF-LAUNCH.md tutorial with 11 screenshots for BRC-Analytics workflow
- Updated compile.sh to build both MANUSCRIPT.pdf and WF-LAUNCH.pdf
- Sorted Supp Table 2 by Year (ascending), Runs (descending)
- Added paragraph justifying Wang/Santana as representative studies
- Created harmonized SRA sample table (ready to insert):

## Harmonized Sample Table (ready to use)

| Study | Condition | SRR Accessions | Description |
|-------|-----------|----------------|-------------|
| Santana et al. | AR0382_WT | SRR22376031, SRR22376032 | Wild-type reference (n=2) |
| | AR0387_WT | SRR22376029, SRR22376030 | Poorly adhesive strain (n=2) |
| | tnSWI1 | SRR22376027, SRR22376028 | SWI1 mutant (n=2) |
| Wang et al. | AR0382_in_vitro | SRR28790270, SRR28790272, SRR28790274 | In vitro culture (n=3) |
| | AR0387_in_vitro | SRR28790276, SRR28790278, SRR28790280 | In vitro culture (n=3) |
| | AR0382_in_vivo | SRR28791430, SRR28791431, SRR28791432 | In vivo infection (n=3) |
| | AR0387_in_vivo | SRR28791433, SRR28791434, SRR28791437, SRR28791438 | In vivo infection (n=4) |

## Manuscript Status

### Completed Sections
- Abstract
- Introduction (with Table 1: SRA stats, Table 2: methodology summary)
- Supp Table 1: WGS contributors
- Supp Table 2: RNA-seq methodology (20 studies, sorted)

### In Progress (line ~50-115)
User actively writing Results section:
- "Two representative studies" - DONE
- "Generating counts" - DONE
- "Configuring analysis" - DONE
- "Organizing data" - DONE (describes CCA/Galaxy API workflow)
- Methods/Results summary block (lines 79-103) - needs integration/editing
- "Representative studies" section (line 109+) - partially written, needs completion

### Pending
- Complete Results section editing
- Figures 1-2 (Santana/Wang validation) still referenced but may need updates
- Final proofreading

## Key Files
- MANUSCRIPT.md - Main manuscript
- MANUSCRIPT.pdf - Compiled PDF
- WF-LAUNCH.md/pdf - BRC-Analytics tutorial
- wf-images/ - Tutorial screenshots
- compile.sh - `./compile.sh` builds both PDFs
- STEPS.md - Detailed process log (Phases 1-15)
- BioProject_PAPERS.md - Literature survey details

## Compilation
```bash
./compile.sh      # Builds MANUSCRIPT.pdf + WF-LAUNCH.pdf
```
Requires: pandoc, texlive-latex-recommended, imagemagick

## Repository
https://github.com/nekrut/whitePaper2

## Notes
- User is writing LLM-assisted analysis workflow description in Results
- CCA = Claude Code Agent interacting with Galaxy via API
- Lines 79-103 contain a summary block that may need reformatting
