# Launching C. auris RNA-seq Analysis via BRC-Analytics

This guide describes how to launch a transcriptomics workflow for *Candidozyma auris* using BRC-Analytics and Galaxy.

## Overview

BRC-Analytics (https://brc-analytics.org) provides a streamlined interface for selecting organism-specific sequencing data from NCBI SRA and launching analysis workflows directly in Galaxy.

## Steps

### 1. Navigate to BRC-Analytics

Go to https://brc-analytics.org and click **Organisms**.

![Step 1: Click Organisms](wf-images/step1.png)

### 2. Select Organism

Search for "candida" in the filter field and select **Candidozyma (Candida) auris**.

![Step 2: Search and select organism](wf-images/step2.png)

### 3. Access Analysis Options

Click on **Candidozyma auris**, then click **Analyze**.

![Step 3: Click Analyze](wf-images/step3.png)

### 4. Choose Analysis Type

Select **Transcriptomics**.

![Step 4: Select Transcriptomics](wf-images/step4.jpg)

### 5. Configure Workflow Inputs

Click **Configure Inputs**, then **Continue**.

![Step 5: Configure Inputs](wf-images/step5.jpg)

### 6. Browse Available Sequences

Click **Browse Sequences** to access available SRA data.

![Step 6: Browse sequences](wf-images/step6.png)

### 7. Filter by Study Accession

Use **Study Accession** filter to find specific BioProjects. Select desired runs using checkboxes.

![Step 7: Filter and select runs](wf-images/step7.png)

### 8. Add Sequencing Runs

Click **Add N Sequencing Runs** to add selected data.

![Step 8: Add sequencing runs](wf-images/step8.jpg)

### 9. Launch in Galaxy

Click **Launch In Galaxy** to open Galaxy with pre-configured workflow.

![Step 9: Launch in Galaxy](wf-images/step9.jpg)

### 10. Access Workflow

Click the workflow icon to view workflow details.

![Step 10: Workflow icon](wf-images/step10.jpg)

### 11. Execute Workflow

Click **Run Workflow** to start the analysis.

![Step 11: Run Workflow](wf-images/step11.jpg)

## Result

After completion, Galaxy history contains:

- Quality-controlled reads (fastp)
- Aligned reads (STAR)
- Gene counts (featureCounts)
- Ready for differential expression analysis (DESeq2)

## Source

[Original Scribe tutorial](https://scribehow.com/shared/Analyze_Candida_Auris_Transcriptomics_Data_in_Galaxy__D4ag4Ad2SLulHK_mvPCidw) by Anton Nekrutenko
