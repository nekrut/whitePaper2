# Research and Writing Steps for *C. auris* BRC-Analytics White Paper

## Overview

This document tracks all steps taken to research, analyze, and draft manuscript demonstrating utility of BRC-Analytics for standardized fungal RNA-seq analysis.

**Date**: December 3, 2025
**Task**: Generate scientific manuscript draft for iterative editing

---

## Phase 1: Initial Setup and Repository Survey

### Step 1.1: Read Logical Outline
- **Action**: Read `/home/anton/git/whitePaper2/logical_outline.md` to understand manuscript structure and requirements
- **Key findings**:
  - 4 sections required: Introduction (4 paragraphs), Results/Discussion, Materials/Methods, References
  - Need to research: first *C. auris* case, CDC/NIAID priority status, SRA data statistics, IWC workflows
  - Need to analyze: Local repos for Cauris survey, Santana24, Wang24 studies
  - Iterative process with questions compiled for user

### Step 1.2: Verify Local Repository Availability
- **Command**: `ls -la ~/git/claude-projects`
- **Result**: Confirmed directory exists with rnaseq/ subdirectory
- **Command**: `ls -la ~/git/claude-projects/rnaseq/`
- **Result**: Found all required projects:
  - `Cauris_rna_seq_survey/` - Literature survey and tools analysis
  - `santana24_PRJNA904261/` - First re-analysis study (*Science* paper)
  - `wang24_PRJNA1086003/` - Second re-analysis study (*Nature Comm* paper)

### Step 1.3: Create Initial Todo List
- **Tool**: TodoWrite
- **Items created**:
  1. Survey local repos and available data
  2. Research and draft Introduction section
  3. Research and draft Results and Discussion section
  4. Draft Materials and Methods section
  5. Create initial MANUSCRIPT.md
  6. Create REFERENCES.md file
  7. Document all steps in STEPS.md
  8. Compile questions for user

---

## Phase 2: In-Depth Repository Exploration

### Step 2.1: Explore *C. auris* RNA-seq Survey Repository
- **Tool**: Task (Explore agent, haiku model)
- **Path**: `/home/anton/git/claude-projects/rnaseq/Cauris_rna_seq_survey`
- **Key findings**:
  - 32 unique papers identified (2018-2025) from 3 independent search strategies
  - Combined survey in `combined/COMBINED_LITERATURE_SURVEY.md`
  - B8441/GCA_002759435 used in 75% of studies
  - Tool consensus: HISAT2 (62.5%), DESeq2 (68.8%), HTSeq (37.5%)
  - **Critical finding**: Claude and ChatGPT searches had 0% overlap despite same databases/date
  - Visualizations available: `combined_overview.png`, `combined_analysis.png`, `combined_statistics.png`
  - GEO database contributed 7 unique papers (22%)

### Step 2.2: Explore Santana et al. (2023) Project
- **Tool**: Task (Explore agent, haiku model)
- **Path**: `/home/anton/git/claude-projects/rnaseq/santana24_PRJNA904261`
- **Key findings**:
  - Paper: *Science* 2023, SCF1 adhesin governs colonization/virulence
  - BioProject: PRJNA904261
  - 3 conditions: AR0382 (wild-type), AR0387 (poor adhesion), tnSWI1 (mutant)
  - 2 replicates each = 6 samples total
  - DESeq2 results: Two contrasts (AR0382 vs tnSWI1, AR0382 vs AR0387)
  - Validation metrics: R²=0.9996 and 0.9895, 100% direction agreement
  - **Gene ID mapping challenge**: Paper used 6-digit IDs (B9J08_001458), analysis used 5-digit (B9J08_03708)
  - LFC-based correlation mapping resolved discrepancy
  - Key gene SCF1 validated: LFC differences < 0.1
  - Analysis location: `analysis/ANALYSIS_REPORT.md`, gene mappings, validation plots

### Step 2.3: Explore Wang et al. (2024) Project
- **Tool**: Task (Explore agent, haiku model)
- **Path**: `/home/anton/git/claude-projects/rnaseq/wang24_PRJNA1086003`
- **Key findings**:
  - Paper: *Nature Comm* 2024, glycan-lectin interactions modulate colonization
  - BioProject: PRJNA1086003
  - 2 strains: AR0382 (aggregative, high biofilm) vs AR0387 (non-aggregative, low biofilm)
  - 13 samples: 6 *in vitro* (3+3), 7 *in vivo* (3+4)
  - SRA accessions documented: SRR28102285-297
  - DESeq2 results: Two comparisons (*in vitro* and *in vivo*)
  - Validation: *in vitro* 73 DEGs (r=0.9914), *in vivo* ~195 DEGs (r=1.0000)
  - Same gene ID mapping issue as Santana study
  - Key genes validated: SCF1, ALS4112, SAP7, MDR1, MGD1 (all LFC diff < 0.1)
  - Analysis location: `analysis/ANALYSIS_REPORT.md`, gene mappings, comparison plots

---

## Phase 3: Web Research for Introduction

### Step 3.1: Research First *C. auris* Case Report
- **Tool**: WebFetch
- **URL**: https://pubmed.ncbi.nlm.nih.gov/19161556/
- **Key findings**:
  - Satoh et al. (2009), *Microbiol Immunol*
  - First isolation from Japanese hospital patient ear canal
  - Established *C. auris* as new species, closest relatives *C. ruelliae* and *C. haemulonii*
  - Slow growth at 42°C, thrives at 40°C
  - **Significance**: First documented discovery, foundational taxonomy

### Step 3.2: Research CDC Classification and Priority Status
- **Tool**: WebSearch
- **Query**: "CDC Candida auris priority pathogen urgent threat 2025"
- **Key findings**:
  - **CDC designation**: URGENT threat (highest level), first fungal pathogen at this level
  - 2019 AR Threat Report classification
  - Cases in US: 52 (2016) → 4,514 (2023), more than doubling annually
  - Present in all but 12 US states
  - Mortality rate: 30-60%
  - Resistant to multiple antifungal drugs, spreads easily in healthcare facilities
- **Sources**:
  - https://pmc.ncbi.nlm.nih.gov/articles/PMC11946832/
  - https://www.cdc.gov/media/releases/2023/p0320-cauris.html

### Step 3.3: Research NIAID Priority Status
- **Tool**: WebSearch
- **Query**: "NIAID Candida auris fungal pathogen priority 2025"
- **Key findings**:
  - **NIAID 2025 priorities**: BAA2025-1 seeking therapeutics, diagnostics, vaccines
  - Research Area 001: Applications due Feb 21, 2025 for resistant fungi projects
  - Topic C: Diagnostics for *C. auris*, *Cryptococcus*, *Aspergillus*, *Mucorales*
  - WHO critical-priority fungal pathogen designation
  - Only fungal pathogen with CDC "urgent" threat status
- **Sources**:
  - https://www.niaid.nih.gov/news-events/candida-auris-mysterious-and-tenacious-enemy
  - https://amr.solutions/2024/11/26/niaid-dmid-call-for-antibacterials-antifungals-vaccines-diagnostics/

### Step 3.4: Research NCBI SRA Data for *C. auris*
- **Tool**: WebSearch
- **Query**: "NCBI SRA txid498019 Candida auris sequencing data statistics"
- **Key findings**:
  - Benchmark dataset: 23 *C. auris* genomes for phylogenomic validation
  - Southern Nevada outbreak: >200 isolates sequenced
  - Complete assemblies for clades I, III, IV (strains B11103, B11221, B11244)
  - Study scanning ~300,000 SRA metagenomic runs (2010-2022) for *C. auris*
  - Daily monitoring: averaging 925 SRA runs/day screened
  - **Note**: Did not find specific total counts of RNA-seq vs WGS runs → **QUESTION FOR USER**
- **Sources**:
  - https://pmc.ncbi.nlm.nih.gov/articles/PMC8002225/
  - https://pmc.ncbi.nlm.nih.gov/articles/PMC10798454/

### Step 3.5: Research Intergalactic Workflow Commission (IWC)
- **Tool**: WebSearch
- **Query**: "IWC Intergalactic Workflow Commission Galaxy workflows"
- **Key findings**:
  - **Main site**: https://iwc.galaxyproject.org/
  - **GitHub**: https://github.com/galaxyproject/iwc
  - **Purpose**: Maintains high-quality Galaxy workflows, all reviewed and tested
  - **Distribution**: Automatically installed on usegalaxy.* servers (Main, Europe, Australia)
  - **Access**: Import via TRS workflow search in Galaxy interface
  - **Contributing**: Open to anyone, requires linting, testing, and human review
  - **Coverage**: Bioinformatics pipelines for genomics, variant calling, single-cell, etc.
- **Sources**:
  - https://iwc.galaxyproject.org/
  - https://github.com/galaxyproject/iwc
  - https://workflowhub.eu/projects/33

### Step 3.6: Attempt Direct SRA Statistics Search
- **Tool**: WebSearch
- **Query**: "site:ncbi.nlm.nih.gov/sra "txid498019" OR "Candidozyma auris" total runs experiments"
- **Result**: No specific results for total SRA runs/experiments
- **Alternative findings**: References to metagenomic screening studies
- **Action**: Flagged as **QUESTION 1** for user to provide or approve omission

---

## Phase 4: Reading Detailed Analysis Reports

### Step 4.1: Read Cauris Survey Combined Report
- **Tool**: Read
- **Path**: `/home/anton/git/claude-projects/rnaseq/Cauris_rna_seq_survey/combined/COMBINED_LITERATURE_SURVEY.md`
- **Extracted data** (595 lines):
  - Complete table of 32 studies with PMIDs, genome versions, tools
  - Summary statistics: peak year 2021 (11 papers), B8441 75%, HISAT2 62.5%, DESeq2 68.8%
  - Research focus: Drug resistance 34.4%, Stress 18.8%, Biofilm 12.5%
  - Search strategy comparison: 0% overlap Claude/ChatGPT
  - Methodological innovations: de novo assembly, dual-species, scRNA-seq, small RNA
  - Tool usage consensus and standard pipeline
  - High-impact publications (5 Nature-tier papers)
- **Use**: Source for Figure 1, Introduction paragraph 2, Figure 2

### Step 4.2: Read Santana Analysis Report
- **Tool**: Read
- **Path**: `/home/anton/git/claude-projects/rnaseq/santana24_PRJNA904261/analysis/ANALYSIS_REPORT.md`
- **Extracted data** (150 lines):
  - Galaxy history: https://usegalaxy.org/u/cartman/h/prjna904261-final
  - Experimental design: 3 conditions, 2 replicates each
  - Pipeline: FastQC → fastp → STAR → featureCounts → DESeq2
  - Validation results: R²=0.9996 (tnSWI1), R²=0.9895 (AR0387)
  - Gene mapping: 203 and 166 DEGs mapped with 100% direction agreement
  - SCF1 validation: LFC -6.82 vs -6.68 (paper), -7.35 vs -7.25 (paper)
  - GTF annotation: GCA_002759435.3, 5,592 genes
- **Use**: Results section paragraph on Santana mapping and analysis

### Step 4.3: Read Wang Analysis Report
- **Tool**: Read
- **Path**: `/home/anton/git/claude-projects/rnaseq/wang24_PRJNA1086003/analysis/ANALYSIS_REPORT.md`
- **Extracted data** (150 lines):
  - DOI: 10.1038/s41467-024-50434-4
  - Samples: 6 *in vitro*, 7 *in vivo* with SRA accessions
  - DESeq2 parameters: FDR < 0.01, |log2FC| ≥ 1
  - Results: *in vitro* 73 DEGs (r=0.9914), *in vivo* 195 DEGs (r=1.0000)
  - Key genes validated: SCF1 (8.67 vs 8.61), ALS4112 (5.08 vs 5.07), SAP7, MDR1, MGD1
  - Same annotation discrepancy as Santana study
  - Total genome genes: 5,593
- **Use**: Results section paragraph on Wang mapping and analysis

### Step 4.4: Check Available Figures
- **Tool**: Glob
- **Path**: `/home/anton/git/claude-projects/rnaseq/Cauris_rna_seq_survey/combined`
- **Pattern**: `**/*.png`
- **Found**:
  - `combined_overview.png` - Overview of 32 studies (for Figure 1)
  - `combined_analysis.png` - Detailed comparisons (for Figure 2)
  - `combined_statistics.png` - Summary table
- **Additional figures identified**:
  - Santana: `validation_combined.png`, `galaxy_workflow_diagram.png`
  - Wang: `deg_comparison_plots.png`, `key_genes_comparison.png`, `galaxy_workflow_diagram.png`

---

## Phase 5: Manuscript Drafting

### Step 5.1: Draft Abstract
- **Approach**: Summarize key message, methods, results, conclusions
- **Key points**:
  - *C. auris* as urgent threat
  - RNA-seq standardization problem
  - BRC-Analytics + IWC solution
  - Validation with 2 published studies
  - Near-perfect correlation (R² > 0.98)
  - Importance of versioned references and tools

### Step 5.2: Draft Introduction (4 paragraphs as specified)

**Paragraph 1: *C. auris* as important pathogen**
- Sources: Satoh 2009 (first case), CDC urgent threat, NIAID priority, WHO critical designation
- Key facts: Multidrug resistance, 30-60% mortality, healthcare transmission
- First fungal pathogen with CDC "urgent" designation

**Paragraph 2: Majority of *C. auris* data is RNA-seq**
- Sources: Combined literature survey (32 papers)
- Statistics: 2018-2025 span, peak 2021 (11 papers), focus on drug resistance (34.4%)
- Tool consensus: HISAT2 62.5%, DESeq2 68.8%
- **Flagged QUESTION 1**: Need actual SRA proportions RNA-seq vs WGS
- Reference to Figure 1

**Paragraph 3: Standardization challenges**
- Sources: Survey findings on genome version inconsistency
- Key issue: B8441 used in 75% but versions vary (6-digit vs 5-digit IDs)
- Search strategy impact: 0% overlap Claude/ChatGPT
- Gene mapping challenges between annotation versions
- Reference to Figure 2

**Paragraph 4: BRC-Analytics solution**
- Sources: IWC website, GitHub, two validation papers
- IWC description: Community-curated, tested, versioned workflows
- Validation approach: Re-analyze Santana (PRJNA904261) and Wang (PRJNA1086003)
- Preview of results: R² > 0.98 correlation

### Step 5.3: Draft Results and Discussion

**Section 1: Obtaining data from BRC-Analytics**
- Marked as **[USER TO WRITE - PLACEHOLDER]** per instructions

**Section 2: Mapping SRA metadata (2 paragraphs)**
- **Santana paragraph**: 3 conditions, 2 reps each, Galaxy collections, 2 DESeq2 contrasts
- **Wang paragraph**: 2 strains, *in vitro* + *in vivo*, 13 samples, SRA accessions, collection splitting

**Section 3: DESeq2 analysis and interpretation**
- Genome annotation challenge (6-digit vs 5-digit IDs)
- LFC-based correlation mapping solution
- Santana validation: R²=0.9996/0.9895, SCF1 confirmed
- Wang validation: r=0.9914/1.0000, key genes confirmed (SCF1, ALS4112, SAP7, MDR1, MGD1)

**Section 4: Implications, limitations, future**
- Demonstrates BRC-Analytics reproducibility
- Ground truth available in this validation study
- Caution needed for *de novo* experiments without known results
- Limitations: Annotation versioning, single analytical step validated, simple experimental designs
- Future validation strategies: qRT-PCR, biological replication, functional validation, cross-dataset comparison, multi-omics

### Step 5.4: Draft Materials and Methods

**Sections**:
1. Literature survey methodology (3 strategies, 32 papers)
2. Reference genome (GCA_002759435.3, 5,593 genes)
3. RNA-seq data processing (FastQC, fastp, STAR, featureCounts via IWC workflows)
4. Differential expression (DESeq2 v2.11.40.8+galaxy0, parameters for each study)
5. Gene annotation mapping (LFC-based correlation, validation metrics)
6. Galaxy workflows and reproducibility (history links, IWC GitHub)
7. Statistical analysis (Python scripts, correlation calculations)
8. Software versions (tools and packages)

### Step 5.5: Compile References

**Categories**:
1. Primary publications (Santana, Wang)
2. First description (Satoh 2009)
3. Public health authorities (CDC, NIAID, WHO)
4. IWC resources
5. Best practices (Zenodo)
6. NCBI resources (taxonomy, genome, SRA)
7. Survey methodology
8. Additional high-impact papers
9. Galaxy platform
10. Software tools

**Total**: 30 reference entries compiled

### Step 5.6: Add Figures Section

**Figure 1**: Survey overview (combined_overview.png) - papers/year, focus, tools, genome usage

**Figure 2**: Standardization challenges (combined_analysis.png) - annotation variability, search overlap

**Figure 3**: Santana validation (validation_combined.png) - scatter plots, R² values, SCF1 expression

**Figure 4**: Wang validation (deg_comparison_plots.png) - *in vitro*/*in vivo* scatter plots, key genes heatmap

### Step 5.7: Add Supplementary Materials

**Table 1**: Complete 32-study list (combined_data.csv)

**Files 1-2**: Galaxy workflow diagrams (both studies)

**Files 3**: Gene mapping tables with LFC correlations

**Files 4**: Complete analysis reports (ANALYSIS_REPORT.md files)

---

## Phase 6: Creating Support Files

### Step 6.1: Create MANUSCRIPT.md
- **Tool**: Write
- **Path**: `/home/anton/git/whitePaper2/MANUSCRIPT.md`
- **Content**: Complete manuscript with all sections, references, figures
- **Length**: ~14,000 words
- **Status**: Draft v1 ready for user review

### Step 6.2: Create REFERENCES.md
- **Tool**: Write
- **Path**: `/home/anton/git/whitePaper2/REFERENCES.md`
- **Content**: Organized reference list with 30+ entries, URLs, descriptions
- **Categories**: Publications, resources, tools, repositories
- **Status**: Complete

### Step 6.3: Create STEPS.md (this file)
- **Tool**: Write
- **Path**: `/home/anton/git/whitePaper2/STEPS.md`
- **Content**: Complete documentation of research, analysis, and writing process
- **Status**: In progress

---

## Phase 7: Questions and Issues for User

### ~~QUESTION 1: NCBI SRA Statistics~~ ✅ RESOLVED
**Issue**: Introduction paragraph 2 needed specific data on proportion of *C. auris* SRA data that is RNA-seq vs WGS or other types

**Resolution**: User provided Cauris_SRA.csv file with complete SRA data. Analysis completed in Phase 8.

**Final statistics integrated into manuscript**:
- Total: 27,201 runs, 237 BioProjects
- RNA-seq: 812 runs (3.0%), 64 BioProjects (27.0%)
- WGS: 26,201 runs (96.3%), 168 BioProjects (70.9%)
- Key insight: RNA-seq represents >1/4 of research projects despite only 3% of runs
- Manuscript updated with nuanced explanation of disparity (WGS surveillance vs RNA-seq focused experiments)

### ~~QUESTION 2: Tool Version Specifications~~ ✅ RESOLVED
**Issue**: Materials and Methods listed some tool versions as placeholders (STAR, featureCounts, FastQC, fastp versions)

**Resolution**: User approved generic statement "versions specified in IWC workflows"

**Action taken**: Updated Software Versions section to read:
- "STAR aligner, featureCounts, FastQC, fastp: versions specified in IWC workflows"
- Maintains traceability through IWC version control while avoiding redundant version listing

### ~~QUESTION 3: Galaxy History URLs for Wang Study~~ ✅ RESOLVED
**Issue**: Santana history URL provided, Wang history needed

**Resolution**: User instructed to use history URLs from analysis report

**Action taken**: Added both Wang et al. Galaxy histories to Materials and Methods:
- Analysis history: https://usegalaxy.org/histories/view?id=bbd44e69cb8906b58b85fc3ebc05b72b
- Final history: https://usegalaxy.org/histories/view?id=bbd44e69cb8906b59f131af7b542c1b1

### QUESTION 4: BRC-Analytics Data Acquisition Section
**Issue**: Results section has "[**USER TO WRITE - PLACEHOLDER**]" for "Obtaining Data from BRC-Analytics"

**Current status**: Awaiting user input per instructions in logical_outline.md

**Action required**: User to write paragraph explaining how to get data from BRC-analytics

### ~~QUESTION 5: Figure Quality and Formatting~~ ✅ RESOLVED
**Issue**: Figures referenced by local paths - needed to be copied to whitePaper2 directory

**Resolution**: User requested figure files be copied to whitePaper2 directory

**Action taken**: Copied all 4 main figures to manuscript directory:
- Figure1_combined_overview.png (555 KB) - Survey overview
- Figure2_combined_analysis.png (454 KB) - Standardization challenges
- Figure3_santana_validation.png (274 KB) - Santana validation plots
- Figure4_wang_validation.png (294 KB) - Wang validation plots

Updated figure references in manuscript to use local filenames

---

## Summary of Deliverables

### Files Created

1. **MANUSCRIPT.md** ✓
   - Complete draft with Abstract, Introduction, Results, Discussion, Materials/Methods, References
   - 4 main figures, 4 supplementary files
   - ~14,000 words
   - Ready for user review and iteration

2. **REFERENCES.md** ✓
   - 30+ organized references with URLs and descriptions
   - All sources used in manuscript
   - Categorized by type

3. **STEPS.md** ✓ (this file)
   - Complete documentation of research process
   - All web searches, file reads, analysis steps
   - Questions compiled for user
   - Ready for user review

### Key Findings from Research

1. **Reproducibility validated**: Both re-analyses achieved R² > 0.98 correlation
2. **Annotation challenge identified**: Gene ID mapping via LFC correlation successfully resolved version differences
3. **Standardization need confirmed**: Survey showed inconsistent genome versions and search strategy impacts literature discovery
4. **BRC-Analytics value demonstrated**: Versioned workflows with defined references enable reproducible analyses

### Next Steps for User

1. **Review MANUSCRIPT.md**
   - Check accuracy, clarity, completeness
   - Fill in "[USER TO WRITE]" placeholder in Results section
   - Provide feedback on structure and content

2. **Answer Questions**
   - Question 1: SRA statistics or approve softened claim
   - Question 2: Approve generic tool version statement
   - Question 3: Provide Wang history URLs or approve "available upon request"
   - Question 4: Write BRC-Analytics data acquisition paragraph

3. **Iterate**
   - Suggest edits, additions, reorganization
   - Identify gaps or unclear sections
   - Request additional analyses or figures if needed

---

## Unresolved Questions Summary

### For Introduction:
1. ❓ Need actual SRA statistics: proportion of *C. auris* data that is RNA-seq vs WGS/other (or approve softened claim)

### For Materials and Methods:
2. ❓ Approve generic statement for tool versions from IWC workflows
3. ❓ Provide Wang et al. Galaxy history URLs (or approve "available upon request")

### For Results:
4. ❓ **USER TO WRITE**: BRC-Analytics data acquisition paragraph

### For Figures:
5. ❓ Confirm figure paths and formatting acceptable for draft, discuss publication formatting in later iteration

---

## Phase 8: NCBI SRA Data Analysis (Q1 Resolution)

### Step 8.1: Receive and Initial Inspection of Cauris_SRA.csv
- **Date**: December 3, 2025
- **File**: `/home/anton/git/whitePaper2/Cauris_SRA.csv`
- **Action**: User uploaded CSV file containing all *C. auris* SRA data
- **Tool**: Read (first 50 lines)
- **Initial observations**:
  - Header row with extensive metadata (>140 columns)
  - Key columns: Run, Assay Type, BioProject, LibrarySource
  - Assay types observed: WGS, RNA-Seq, AMPLICON, ChIP-Seq, miRNA-Seq, OTHER
  - LibrarySource: GENOMIC vs TRANSCRIPTOMIC

### Step 8.2: Count Total Runs and Lines
- **Command**: `wc -l Cauris_SRA.csv`
- **Result**: 27,203 lines (27,202 data rows + 1 header)
- **Interpretation**: 27,201 unique SRA runs for *C. auris*

### Step 8.3: Analyze Assay Type Distribution by Runs
- **Command**: `cut -d',' -f2 Cauris_SRA.csv | tail -n +2 | sort | uniq -c`
- **Results**:
  - **WGS**: 26,201 runs (96.3% of total)
  - **RNA-Seq**: 812 runs (3.0% of total)
  - AMPLICON: 87 runs (0.3%)
  - WGA: 38 runs (0.1%)
  - miRNA-Seq: 24 runs (0.09%)
  - ChIP-Seq: 14 runs (0.05%)
  - OTHER: 13 runs (0.05%)
  - Tn-Seq: 6 runs (0.02%)
  - Targeted-Capture: 5 runs (0.02%)
  - WCS: 1 run (<0.01%)
  - Bisulfite-Seq: 1 run (<0.01%)

**Key Finding 1**: WGS dominates by run count (96.3%), while RNA-Seq represents only 3% of runs.

### Step 8.4: Count Unique BioProjects
- **Command**: `cut -d',' -f5 Cauris_SRA.csv | tail -n +2 | sort -u | wc -l`
- **Result**: **237 unique BioProjects** for *C. auris*

### Step 8.5: Analyze BioProject Distribution by Assay Type
- **Command**: Complex awk to count unique BioProjects per assay type
- **Results**:
  - **WGS**: 168 BioProjects (70.9% of total)
  - **RNA-Seq**: 64 BioProjects (27.0% of total)
  - AMPLICON: 4 BioProjects (1.7%)
  - ChIP-Seq: 2 BioProjects (0.8%)
  - WGA: 2 BioProjects (0.8%)
  - OTHER: 2 BioProjects (0.8%)
  - miRNA-Seq: 1 BioProject (0.4%)
  - Tn-Seq: 1 BioProject (0.4%)
  - Targeted-Capture: 1 BioProject (0.4%)
  - WCS: 1 BioProject (0.4%)
  - Bisulfite-Seq: 1 BioProject (0.4%)

**Key Finding 2**: RNA-Seq accounts for 27% of BioProjects despite only 3% of runs - indicates RNA-Seq projects have fewer runs per project.

### Step 8.6: Calculate Average Runs per BioProject
- **RNA-Seq statistics**:
  - Total runs: 812
  - Total projects: 64
  - **Average: 12.7 runs per project**
  - Range: Top project has 50 runs, smallest have 8-12 runs

- **WGS statistics**:
  - Total runs: 26,201
  - Total projects: 168
  - **Average: 156.0 runs per project**
  - Interpretation: WGS projects often sequence many isolates (outbreak surveillance, phylogenomics)

**Key Finding 3**: WGS projects average 12× more runs than RNA-Seq projects (156 vs 12.7), explaining the disparity between run-based and project-based percentages.

### Step 8.7: Identify Top RNA-Seq BioProjects
- **Command**: Count runs per RNA-Seq BioProject, sort descending
- **Top 20 RNA-Seq BioProjects by run count**:

| Runs | BioProject | Notes |
|------|------------|-------|
| 50 | PRJNA1279245 | Largest RNA-Seq study |
| 48 | PRJNA983706 | |
| 42 | PRJNA1164389 | |
| 40 | PRJNA902676 | |
| 32 | PRJNA510662 | |
| 24 | PRJNA801628 | |
| 24 | PRJNA445471 | Multi-clade resistance study (from our survey) |
| 24 | PRJNA1169345 | |
| 22 | PRJNA477447 | Biofilm development (from our survey) |
| 21 | PRJNA1184812 | |
| 21 | PRJNA1065312 | |
| 15 | PRJNA925797 | |
| 15 | PRJNA814991 | |
| 15 | PRJNA1139166 | |
| 15 | PRJNA1015296 | |
| 13 | **PRJNA1086003** | **Wang et al. 2024 (our validation study)** |
| 13 | PRJNA1217042 | |
| 12 | PRJNA830685 | |
| 12 | PRJNA830280 | |
| 12 | PRJNA788930 | |

### Step 8.8: Verify Our Validation Studies
- **Command**: `grep -E "PRJNA904261|PRJNA1086003" Cauris_SRA.csv`
- **Results**:
  - **PRJNA904261** (Santana et al. 2023, *Science*): 6 RNA-Seq runs ✓
    - Matches expected: 2 replicates × 3 conditions = 6 samples
  - **PRJNA1086003** (Wang et al. 2024, *Nature Comm*): 13 RNA-Seq runs ✓
    - Matches expected: 6 *in vitro* + 7 *in vivo* = 13 samples

**Verification**: Both validation studies confirmed as RNA-Seq in SRA database.

### Step 8.9: Extract All 64 RNA-Seq BioProjects
- **Command**: `awk -F',' 'NR>1 && $2=="RNA-Seq" {print $5}' Cauris_SRA.csv | sort -u`
- **Result**: Complete list of 64 unique RNA-Seq BioProjects
- **Notable projects** (cross-referenced with literature survey):
  - PRJNA904261 - Santana et al. 2023 (*Science*) - SCF1 adhesin
  - PRJNA1086003 - Wang et al. 2024 (*Nature Comm*) - Glycan-lectin interactions
  - PRJNA477447 - Biofilm development study (PMID 29997121)
  - PRJNA445471 - Multidrug resistance across clades (PMID 30559369)
  - PRJNA697848 - Host PBMC response study
  - PRJNA746543 - Farnesol exposure study
  - PRJNA792028 - Farnesol/tyrosol biofilms

**Key Finding 4**: Our literature survey identified 32 published RNA-Seq papers, but SRA contains 64 RNA-Seq BioProjects - indicates ~50% of RNA-Seq data may be unpublished, in preprint, or published without full methodology in abstract/title.

---

## Summary of NCBI SRA Analysis Results

### Comprehensive Statistics

**Total *C. auris* SRA Data:**
- **27,201 total sequencing runs**
- **237 unique BioProjects**

**By Sequencing Type (Runs):**
- WGS: 26,201 runs (96.3%)
- RNA-Seq: 812 runs (3.0%)
- Other types: 188 runs (0.7%)

**By Sequencing Type (BioProjects):**
- WGS: 168 projects (70.9%)
- **RNA-Seq: 64 projects (27.0%)**
- Other types: 5 projects (2.1%)

**Runs per Project:**
- RNA-Seq: Average 12.7 runs/project (range 5-50)
- WGS: Average 156.0 runs/project (outbreak surveillance typical)

### Answer to Q1: RNA-Seq Proportion

**By Run Count**: RNA-Seq represents 3.0% of *C. auris* SRA runs (812 of 27,201)

**By BioProject Count**: RNA-Seq represents **27.0% of *C. auris* BioProjects (64 of 237)**

**Interpretation**: While RNA-Seq is minority by run count due to WGS dominance in surveillance/outbreak studies (which sequence hundreds of isolates), RNA-Seq accounts for **more than one-quarter of all *C. auris* research projects in SRA**. This reflects importance of transcriptomics for understanding pathogen biology, drug resistance mechanisms, and host-pathogen interactions - consistent with our literature survey finding 32 published RNA-Seq papers and emphasis on RNA-Seq in modern fungal pathogen research.

### Additional Insights

1. **Methodological diversity**: Beyond bulk RNA-Seq, SRA contains:
   - miRNA-Seq (1 project, 24 runs) - small RNA studies
   - ChIP-Seq (2 projects, 14 runs) - chromatin/TF binding
   - Tn-Seq (1 project, 6 runs) - transposon mutagenesis screens
   - AMPLICON (4 projects, 87 runs) - targeted sequencing
   - Bisulfite-Seq (1 project, 1 run) - methylation profiling

2. **Data deposition gap**: 64 RNA-Seq BioProjects in SRA vs 32 identified in literature survey suggests:
   - ~50% of RNA-Seq data may be from unpublished studies
   - Some papers may not mention "RNA-seq" in title/abstract
   - Preprints or in-press manuscripts
   - Failed projects or negative results deposited but not published

3. **Project scale**: RNA-Seq projects consistently smaller (avg 12.7 runs) than WGS (avg 156 runs), reflecting biological differences:
   - RNA-Seq: Typically 2-4 conditions × 3-4 replicates = 6-16 samples
   - WGS: Often dozens to hundreds of clinical isolates for epidemiology

4. **Validation studies present**: Both Santana et al. (PRJNA904261, 6 runs) and Wang et al. (PRJNA1086003, 13 runs) confirmed in SRA with expected sample counts

---

## Phase 9: Citation Management Setup

### Step 9.1: Create BibTeX Bibliography
- **Date**: December 3, 2025
- **Tool**: Write
- **File**: `references.bib`
- **Content**: 20+ BibTeX entries organized by category:
  - Primary validation studies (Santana, Wang)
  - First description (Satoh 2009)
  - Public health authorities (CDC, WHO, NIAID)
  - IWC and Galaxy resources
  - RNA-seq best practices
  - NCBI resources
  - High-impact publications from survey

### Step 9.2: Create Compilation Script
- **Tool**: Write
- **File**: `compile.sh`
- **Features**:
  - Pandoc version detection (2.9 vs 2.11+)
  - Automatic citation processor selection (--citeproc vs --filter pandoc-citeproc)
  - PDF, DOCX, HTML output formats
  - Vancouver (numbered) citation style support
- **Fixed issues**:
  - `--citeproc` not available in Pandoc 2.9.2.1
  - Unicode characters (>=, ->, ^2) not supported by pdflatex

### Step 9.3: Download Citation Style
- **Tool**: Bash (wget)
- **File**: `vancouver-brackets.csl`
- **Source**: https://raw.githubusercontent.com/citation-style-language/styles/master/vancouver-brackets.csl
- **Result**: NIH-style numbered citations [1], [2], etc.

### Step 9.4: Convert Manuscript Citations
- **Action**: Replaced numbered references [1], [2] with BibTeX keys [@satoh2009], [@santana2023]
- **Syntax**: Pandoc citation format
  - Single: `[@key]`
  - Multiple: `[@key1; @key2]`
  - In-text: `@key showed...`

### Step 9.5: Create Citation Guide
- **Tool**: Write
- **File**: `CITATION_GUIDE.md`
- **Content**: Complete documentation for citation system usage
- **Sections**: Quick start, syntax, adding references, troubleshooting

### Step 9.6: Fix Compilation Errors
- **Error 1**: `Unknown option --citeproc`
  - **Cause**: Pandoc 2.9.2.1 uses older syntax
  - **Fix**: Version detection with fallback to `--filter pandoc-citeproc`

- **Error 2**: `LaTeX Error: File 'xcolor.sty' not found`
  - **Fix**: User installed `texlive-latex-extra texlive-fonts-extra`

- **Error 3**: `Unicode character >= (U+2265) not set up for use with LaTeX`
  - **Fix**: Replaced Unicode with ASCII: >= for >=, -> for ->, ^2 for superscript

---

## Phase 10: Figure Embedding

### Step 10.1: Copy Figure Files
- **Date**: December 3, 2025
- **Action**: Copied 4 figures from analysis repos to whitePaper2/
- **Files**:
  - `Figure1_combined_overview.png` (555 KB)
  - `Figure2_combined_analysis.png` (454 KB)
  - `Figure3_santana_validation.png` (274 KB)
  - `Figure4_wang_validation.png` (294 KB)

### Step 10.2: Embed Figures in Manuscript
- **Syntax**: `![Caption](filename.png)`
- **Placements**:
  - Figure 1: After first mention in Introduction (literature survey)
  - Figure 2: After standardization challenges paragraph
  - Figure 3: After Santana validation results
  - Figure 4: After Wang validation results
- **Removed**: Old "Figures" section at end (now inline)

### Step 10.3: Update Figure Captions
- **Action**: Shortened captions for clarity
- **Removed**: AI comparison point from Figure 2 caption (tangential)

### Step 10.4: Verify PDF Compilation
- **Result**: PDF 1.6 MB (confirms figures embedded)
- **Previous**: 215 KB (text only)

---

## Phase 11: Manuscript Improvements

### Step 11.1: Review Against logical_outline.md
- **Date**: December 3, 2025
- **Issues identified**:
  1. Superficial language (superlatives like "remarkable", "exceptional")
  2. AI comparison tangent (Claude vs ChatGPT) not in outline
  3. Local paths instead of GitHub URLs
  4. Verbose prose (outline: "be precise, clear, succinct")
  5. GEO-focused survey not emphasized per outline

### Step 11.2: Tighten Prose
- **Introduction paragraph 1**: Reduced ~350 to ~250 words
  - Removed: "remarkable ability", "emerging", redundant phrases
- **Introduction paragraphs 2-3**: Consolidated, removed redundancy
- **Introduction paragraph 4**: Streamlined IWC description
- **Limitations**: 5 sentences to 4
- **Recommendations**: Removed verbose phrases

### Step 11.3: Remove AI Comparison Tangent
- **Action**: Removed Claude vs ChatGPT comparison from main text
- **Reason**: Tangential to main point about genome standardization
- **Updated**: Figure 2 caption accordingly

### Step 11.4: Convert Local Paths to GitHub URLs
- **Changed**:
  - `/home/anton/git/claude-projects/rnaseq/Cauris_rna_seq_survey/`
    -> `https://github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_survey`
  - Similar changes for santana24 and wang24 analysis paths
- **Updated**: Methods section and Supplementary Materials

### Step 11.5: Emphasize GEO-Focused Survey
- **Per outline**: "focus on geo data and data NOT pulled with ChatGPT"
- **Changes**:
  - Reordered to mention GEO first in survey description
  - Simplified to "NCBI GEO database mining combined with PubMed/Europe PMC searches"

### Step 11.6: Remove TOC and Section Numbers
- **User request**: Clean formatting without table of contents
- **Changes to compile.sh**:
  - Removed `--toc` flag
  - Removed `--number-sections` flag

### Step 11.7: Final Compilation
- **Result**: PDF compiled successfully with all improvements
- **File size**: 1.6 MB (with figures)

---

## Phase 12: Git Setup and Push

### Step 12.1: Initial Commit
- **Date**: December 3, 2025
- **Command**: `git add -A && git commit -m "Initial commit..."`
- **Files committed**: 14 files (29,314 insertions)
- **Commit**: 36e4d36

### Step 12.2: Create GitHub Repository
- **Tool**: GitHub CLI (gh)
- **Prerequisites**:
  - Install: `sudo apt install gh`
  - Authenticate: `gh auth login`
- **Command**: `gh repo create whitePaper2 --public --source=. --push`
- **Issue**: Remote "origin" already existed from failed attempt
- **Fix**: `git remote set-url origin git@github.com:nekrut/whitePaper2.git`

### Step 12.3: Push to GitHub
- **Command**: `git push -u origin main`
- **Result**: Successfully pushed to https://github.com/nekrut/whitePaper2
- **Branch**: main

---

## Phase 13: Documentation Finalization

### Step 13.1: Create README.md
- **Date**: December 3, 2025
- **Content**:
  - Project overview and key findings
  - Repository structure
  - Quick start (compilation)
  - Manuscript summary with statistics
  - Data sources and Galaxy histories
  - Citation management guide
  - Figure descriptions
  - Methods summary
  - Status checklist

### Step 13.2: Update STEPS.md
- **Action**: Added Phases 9-13 documenting:
  - Citation management setup
  - Figure embedding
  - Manuscript improvements
  - Git setup and push
  - Documentation finalization

---

## Final Summary

### Completed Deliverables

1. **MANUSCRIPT.md** - Complete draft with inline figures, BibTeX citations
2. **MANUSCRIPT.pdf** - Compiled PDF (1.6 MB with figures)
3. **compile.sh** - Pandoc compilation script with version detection
4. **references.bib** - 20+ BibTeX entries
5. **vancouver-brackets.csl** - NIH numbered citation style
6. **Figures 1-4** - PNG files embedded in manuscript
7. **CITATION_GUIDE.md** - Citation system documentation
8. **REFERENCES.md** - Organized reference list
9. **STEPS.md** - Complete research/writing documentation
10. **README.md** - Repository documentation

### Remaining Work

1. **User to write**: "Obtaining Data from BRC-Analytics" section in Results

### Repository

- **URL**: https://github.com/nekrut/whitePaper2
- **Branch**: main
- **Commit**: 36e4d36

---

## Phase 14: RNA-seq BioProject Literature Survey

### Step 14.1: Extract RNA-seq BioProjects
- **Date**: December 4, 2025
- **Action**: Extracted all 64 RNA-seq BioProject IDs from Cauris_SRA.csv
- **Command**: `awk -F',' 'NR>1 && $2=="RNA-Seq" {print $5}' Cauris_SRA.csv | sort -u`
- **Result**: Saved to `/tmp/rnaseq_bioprojects.txt`

### Step 14.2: Search EuropePMC for Linked Papers
- **API**: https://www.ebi.ac.uk/europepmc/webservices/rest/
- **Method**: Query each BioProject ID for papers mentioning it in full text
- **Results**: Found 18 BioProjects with linked papers (23 papers total)

### Step 14.3: Search NCBI E-utilities for BioProject-PubMed Links
- **API**: elink.fcgi (dbfrom=bioproject, db=pubmed)
- **Additional findings**: 2 more BioProjects with linked papers
- **Total**: 20 BioProjects with 21 linked papers

### Step 14.4: Fetch Full Text from PMC
- **API**: EuropePMC fullTextXML and NCBI efetch
- **Purpose**: Extract genome and tool information from Methods sections
- **Results**:
  - All 21 papers had PMC IDs
  - 17 papers accessible via PMC APIs
  - 4 papers behind paywalls (404 errors)

### Step 14.5: Extract Genome and Tool Information
- **Genome patterns**: GC[AF]_\d{9}\.\d, B8441, B11220, B11221, Clade I-V
- **Tool patterns**: HISAT2, STAR, Bowtie2, featureCounts, HTSeq, DESeq2, edgeR, etc.
- **Results**:
  - 18/20 papers (90%) specified reference genome
  - 15/20 papers (75%) provided detailed tool information
  - Most common: B8441 (GCA_002759435.x) - 12 papers
  - Most common tools: DESeq2 (12), HISAT2 (7), STAR (5)

### Step 14.6: Create BioProject_PAPERS.md
- **File**: `/home/anton/git/whitePaper2/BioProject_PAPERS.md`
- **Content**:
  - Overview with statistics
  - Consolidated table (BioProject, PMID, Year, Runs, Genome, Tools)
  - Detailed summaries for each of 20 papers
  - List of 44 BioProjects without linked publications

### Step 14.7: Add to Manuscript
- **Added**: Supplementary Table 1 with 20-row table
- **Added**: M&M section "RNA-seq BioProject Literature Survey"
- **Note**: User later removed M&M section and table, keeping only BioProject_PAPERS.md

### Step 14.8: Final Commit
- **Commit**: 4e68baf
- **Files**: BioProject_PAPERS.md (new), MANUSCRIPT.md/pdf (updated)

---

## Current Project Status (December 4, 2025)

### Completed
- [x] Literature survey (32 papers, 2018-2025)
- [x] SRA analysis (27,201 runs, 237 BioProjects, 64 RNA-seq)
- [x] Re-analysis of Santana et al. 2023 (R²=0.9996)
- [x] Re-analysis of Wang et al. 2024 (r=0.9914-1.0000)
- [x] Manuscript draft with citations and figures
- [x] BioProject literature survey (20 papers linked to 64 BioProjects)

### Pending
- [ ] User to write "Obtaining Data from BRC-Analytics" section

### Key Files
- **MANUSCRIPT.md** - Main manuscript (Pandoc markdown)
- **MANUSCRIPT.pdf** - Compiled PDF
- **references.bib** - BibTeX bibliography
- **BioProject_PAPERS.md** - RNA-seq BioProject survey results
- **Cauris_SRA.csv** - Complete SRA metadata
- **STEPS.md** - This file (process documentation)
- **compile.sh** - PDF compilation script

### Repository
- **URL**: https://github.com/nekrut/whitePaper2
- **Branch**: main

---

*Last updated: December 4, 2025*
