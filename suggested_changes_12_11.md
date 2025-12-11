# Logical Flow Analysis and Suggested Changes

## Current Structure

```
Introduction
  - C. auris threat
  - SRA data overview (Table 1)
  - RNA-seq methodology survey (Table 2)
  - Problem: inconsistent genomes/tools
  - Solution: BRC-Analytics intro

Results
  - ### BRC-Analytics
  - ### Two representative studies
  - ### Configuring analysis ← PROBLEM: references "workflow invoked in previous section" but no such section exists
  - ### Organizing data
  - ### Expression analysis and interpretation
  - ### Comparison with Santana et al. (Figure 1)
  - ### Comparison with Wang et al. (Figure 2)
  - ### Maintaining provenance

Discussion
  - ### Toward standardization
  - ### Importance of LLMs
  - ### Why BRC-Analytics/Galaxy
  - ### Future goals

Materials and Methods
  - ...
  - ### Counting Workflow (Figure 3) ← Workflow diagram is here, but workflow execution is never described in Results
```

---

## Issues Identified

### 1. Missing workflow execution section (CRITICAL)
**Line 92**: "The workflow invoked in the previous section created read counts..."
- There is NO previous section describing workflow execution
- "### Two representative studies" only describes study selection, not running any workflow
- Reader is confused about when/how counts were generated

**Fix**: Add "### Generating counts" section between "Two representative studies" and "Configuring analysis"

### 2. Section title mismatch
**"### Configuring analysis"** (line 90) is misleading
- Section actually describes AI agent setup, not analysis configuration
- The "configuring" of data happens in "### Organizing data"

**Fix**: Rename to "### AI agent setup" or "### Using Claude Code Agent"

### 3. Figure 3 disconnection
- Figure 3 (workflow diagram) is in M&M (line 199-200)
- Results never references Figure 3
- Workflow description exists in M&M but execution description missing from Results

**Fix**: Reference Figure 3 in new "Generating counts" section

### 4. BRC-Analytics described twice
- Introduction (line 77): brief mention
- Results ### BRC-Analytics (line 81-83): full description

**Status**: Acceptable - Intro previews, Results elaborates

### 5. Provenance section placement
- "### Maintaining provenance" (line 146) comes after validation results
- Could arguably go in Discussion since it's more conceptual

**Status**: Current placement OK - shows provenance in context of actual work done

---

## Suggested Changes

### Change 1: Add "### Generating counts" section
Insert after "### Two representative studies" (after line 88):

```markdown
### Generating counts

Our analysis begins with selecting *C. auris* assembly GCA_002759435.3 in BRC-Analytics, then importing raw reads for both studies from NCBI SRA. We launched the IWC paired-end RNA-seq workflow (Figure 3) which performs quality filtering with `fastp`, alignment with `STAR`, and gene-level quantification. The workflow produced read count matrices for all samples in each study, which serve as input for differential expression analysis. Detailed workflow parameters are described in Materials and Methods.
```

### Change 2: Rename "### Configuring analysis"
Line 90: Change to "### AI agent setup" or "### Claude Code Agent"

### Change 3: Fix orphan reference
Line 92: Change "The workflow invoked in the previous section" to "The workflow described above"

---

## Proposed New Results Structure

```
Results
  - ### BRC-Analytics (platform description)
  - ### Two representative studies (study selection)
  - ### Generating counts (NEW - workflow execution, refs Figure 3)
  - ### AI agent setup (renamed from "Configuring analysis")
  - ### Organizing data (using CCA)
  - ### Expression analysis and interpretation
  - ### Comparison with Santana et al.
  - ### Comparison with Wang et al.
  - ### Maintaining provenance
```

---

## Files to Modify
`/home/anton/git/whitePaper2/MANUSCRIPT.md`
- Insert new section after line 88
- Rename section at line 90
- Fix reference at line 92
