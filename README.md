# Standardizing RNA-seq Analysis of Fungal Pathogens Using BRC-Analytics

A *Candidozyma auris* case study demonstrating reproducible RNA-seq analysis workflows.

## Overview

This repository contains the manuscript, data, and supporting materials for a white paper demonstrating the utility of [BRC-Analytics](https://brc-analytics.org) for standardized fungal pathogen RNA-seq analysis.

**Key findings:**
- Re-analyzed RNA-seq data from two high-impact publications (Santana et al. 2023 *Science*, Wang et al. 2024 *Nature Communications*)
- Achieved near-perfect correlation with published results (R^2 > 0.98)
- Demonstrated that standardized workflows with versioned references enable reproducible analyses

## Repository Structure

```
whitePaper2/
├── MANUSCRIPT.md          # Main manuscript (Markdown with Pandoc citations)
├── MANUSCRIPT.pdf         # Compiled PDF with figures
├── compile.sh             # Pandoc compilation script
├── references.bib         # BibTeX bibliography
├── vancouver-brackets.csl # NIH numbered citation style
├── Figure1_combined_overview.png    # Literature survey overview
├── Figure2_combined_analysis.png    # Standardization challenges
├── Figure3_santana_validation.png   # Santana et al. validation
├── Figure4_wang_validation.png      # Wang et al. validation
├── Cauris_SRA.csv         # NCBI SRA metadata for C. auris
├── STEPS.md               # Complete research/writing documentation
├── CITATION_GUIDE.md      # How to use the citation system
├── REFERENCES.md          # Organized reference list
└── logical_outline.md     # Original manuscript outline
```

## Quick Start

### Compile the Manuscript

```bash
# Generate PDF (default)
./compile.sh

# Generate Word document
./compile.sh docx

# Generate HTML
./compile.sh html

# Generate all formats
./compile.sh all
```

### Requirements

- **Pandoc** (>= 2.9): `sudo apt install pandoc pandoc-citeproc`
- **LaTeX** (for PDF): `sudo apt install texlive-latex-base texlive-latex-extra texlive-fonts-recommended`

## Manuscript Summary

### Abstract

*Candidozyma auris* has emerged as a critical global health threat due to multidrug resistance and healthcare-associated transmission. We demonstrate the utility of BRC-Analytics for launching reproducible, best-practice RNA-seq workflows on fungal pathogen data. By re-analyzing data from two recent publications using a defined reference genome (GCA_002759435.3) and IWC workflows, we achieved near-perfect correlation (R^2 > 0.98) with published results.

### Key Statistics

- **Literature survey**: 32 published *C. auris* RNA-seq studies (2018-2025)
- **SRA analysis**: 27,201 runs across 237 BioProjects; 27% of projects are RNA-seq
- **Validation**:
  - Santana et al.: R^2 = 0.9996 (203 DEGs mapped)
  - Wang et al.: r = 0.9914-1.0000 (73-195 DEGs mapped)

## Data Sources

### Validation Studies

| Study | Journal | BioProject | Focus |
|-------|---------|------------|-------|
| Santana et al. 2023 | *Science* | PRJNA904261 | SCF1 adhesin, biofilm formation |
| Wang et al. 2024 | *Nature Comm* | PRJNA1086003 | Glycan-lectin interactions |

### Galaxy Histories (Reproducibility)

- Santana et al.: https://usegalaxy.org/u/cartman/h/prjna904261-final
- Wang et al.: https://usegalaxy.org/histories/view?id=bbd44e69cb8906b58b85fc3ebc05b72b

### Analysis Scripts

Full analysis code and intermediate files available at:
- https://github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_survey
- https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261
- https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003

## Citation Management

This manuscript uses Pandoc with BibTeX for citations (similar to LaTeX).

### Adding Citations

In `MANUSCRIPT.md`:
```markdown
First described in 2009 [@satoh2009], *C. auris* has spread worldwide.
Multiple studies [@santana2023; @wang2024] demonstrate...
```

In `references.bib`:
```bibtex
@article{satoh2009,
  author = {Satoh, Kazuo and others},
  title = {Candida auris sp. nov.},
  journal = {Microbiology and Immunology},
  year = {2009},
  doi = {10.1111/j.1348-0421.2008.00083.x}
}
```

See [CITATION_GUIDE.md](CITATION_GUIDE.md) for full documentation.

## Figures

| Figure | Description | File |
|--------|-------------|------|
| 1 | Literature survey overview (32 studies, tool consensus) | `Figure1_combined_overview.png` |
| 2 | Standardization challenges (genome versions, gene IDs) | `Figure2_combined_analysis.png` |
| 3 | Santana et al. validation (R^2 scatter plots, SCF1) | `Figure3_santana_validation.png` |
| 4 | Wang et al. validation (in vitro/in vivo, key genes) | `Figure4_wang_validation.png` |

## Methods Summary

1. **Literature Survey**: NCBI GEO + PubMed/Europe PMC searches identified 32 RNA-seq studies
2. **SRA Analysis**: Analyzed 27,201 runs across 237 BioProjects for *C. auris* (NCBI:txid498019)
3. **Reference Genome**: *C. auris* B8441 GCA_002759435.3 (5,593 genes)
4. **Pipeline**: FastQC -> fastp -> STAR -> featureCounts -> DESeq2 (IWC workflows)
5. **Validation**: LFC-based correlation mapping to reconcile annotation versions

## Status

- [x] Literature survey and SRA analysis
- [x] Re-analysis of Santana et al. (2023)
- [x] Re-analysis of Wang et al. (2024)
- [x] Manuscript draft with figures
- [x] Citation system setup
- [ ] User to write "Obtaining Data from BRC-Analytics" section

## License

This work is provided for academic and research purposes.

## Acknowledgments

- [BRC-Analytics](https://brc-analytics.org) - Pathogen bioinformatics platform
- [Galaxy Project](https://galaxyproject.org) - Workflow execution
- [IWC](https://iwc.galaxyproject.org) - Intergalactic Workflow Commission

---

*Manuscript generated with [Claude Code](https://claude.com/claude-code)*
