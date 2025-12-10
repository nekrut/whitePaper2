---
header-includes:
  - \usepackage{caption}
  - \captionsetup{font=small}
---

# Standardizing RNA-seq Analysis of Fungal Pathogens Using BRC-Analytics and Agentic AI: A *Candidozyma auris* Case Study

Anton Nekrutenko^1^, Danielle Callan^2^, Marius Van Den Beek^1^, Dannon Baker^3^, David Rogers^4^, Aysam Guerler^3^, John Chilton^1^, Hiram Clawson^5^, Scott Cain^1^, Teresa O'Meara^6^, Kelsey Beavers^7^, Michael Schatz^3^, Maximilian Haeussler^5^, Bjorn Gruning^8^, and Sergei Kosakovsky Pond^2^

^1^ Dept. of Biochemistry and Molecular Biology, The Pennsylvania State University, University Park, PA, USA

^2^ Dept. of Biology, Temple University, Philadelphia, PA, USA

^3^ Dept. of Biology, Johns Hopkins University, Baltimore, MD, USA

^4^ Clever Canary, LLC, Santa Cruz, CA, USA

^5^ Baskin School of Engineering, University of California, Santa Cruz, USA

^6^ Dept. of Microbiology and Immunology, University of Michigan, Ann Arbor, MI, USA

^7^ Texas Advanced Computing Center, The University of Texas, Austin, TX, USA

^8^ Dept. of Bioinformatics, Albert-Ludwigs-University Freiburg, Freiburg, Baden-Württemberg, Germany

Correspondence should be addressed to AN and SKP: aun1@psu.edu, spond@temple.edu

\newpage

## Abstract

*Candidozyma auris* (*C. auris*) has emerged as a critical global health threat due to multidrug resistance and healthcare-associated transmission. While RNA sequencing (RNA-seq) has become the primary tool for studying *C. auris* pathogenesis, the lack of standardized analysis approaches---particularly inconsistent reference genomes and bioinformatics tools---complicates cross-study comparisons and reproducibility. We demonstrate utility of BRC-Analytics platform for launching reproducible, best-practice RNA-seq workflows on fungal pathogen data. By re-analyzing data from two recent publications using defined reference genome (GCA_002759435.3) and Intergalactic Workflow Commission (IWC) workflows, we achieved near-perfect correlation (R^2 > 0.98) with published results despite differences in genome annotation versions. This validates BRC-Analytics as robust platform for standardized fungal genomics and demonstrates that reproducible analyses are achievable when precise versions of references and tools are specified.

---

## Introduction

*Candidozyma auris* (formerly *Candida auris*; NCBI:txid498019) represents one of the most urgent antimicrobial resistance threats facing global health systems. First isolated from external ear canal of Japanese hospital patient in 2009 [@satoh2009], this fungal pathogen has since spread worldwide. CDC classifies *C. auris* as an urgent threat---the first fungal pathogen to receive this designation---due to multidrug resistance (often to all major antifungal classes), healthcare-associated transmission, and 30-60% mortality rates [@cdc2023threat; @cdc2025continuing]. *C. auris* persists on surfaces, colonizes skin, and forms biofilms on medical devices, enabling difficult-to-control nosocomial outbreaks [@cdc2025continuing]. WHO designates *C. auris* as critical-priority fungal pathogen [@who2024fungal], and NIAID has prioritized development of new therapeutics [@niaid2024cauris]. 

Compared to other key human pathogens (such as a SARS-CoV-2 or HIV, for example) the amount of publicly available sequence data for *C. auris* is modest (Table 1). Two categories of projects account for 98% of all data: whole genome sequencing efforts (WGS) and RNA-seq projects. The WGS data are mostly derived from outbreak surveillance efforts conducted by various state public health agencies (Supp. Table 1). The majority of RNA-seq data on the other hand are produced by academic research labs. This reflects the importance of transcriptomic analyses to understanding the fundamental biology of this pathogen. While whole-genome sequencing dominates by run count (26,201 WGS vs 812 RNA-seq runs; 96.3% vs 3.0%), 64 of 237 *C. auris* BioProjects (27%) are RNA-seq studies. This disparity reflects study design: WGS projects sequence many isolates for outbreak surveillance (average 156 runs/project), whereas RNA-seq examines specific biological conditions (average 13 runs/project). A consensus pipeline has emerged: `HISAT2` or `STAR` alignment, `featureCounts` or `HTSeq` quantification, and `DESeq2` differential expression. Given RNA-seq accounts for over one-quarter of *C. auris* research projects, standardizing analysis is a critical priority.  

**Table 1**: Summary of *C. auris* sequencing data in NCBI SRA (December 2025). BioProject is an NCBI database entry grouping related sequencing runs from a single study. Assay types: WGS = whole genome sequencing; RNA-Seq = transcriptome sequencing; AMPLICON = targeted amplicon sequencing; WGA = whole genome amplification; miRNA-Seq = microRNA sequencing; ChIP-Seq = chromatin immunoprecipitation sequencing; Tn-Seq = transposon insertion sequencing; Targeted-Capture = hybridization capture sequencing; WCS = whole chromosome sequencing; Bisulfite-Seq = DNA methylation sequencing.

| Assay Type | BioProjects | Total Runs | Total Bases | Avg Runs/Project |
|------------|-------------|------------|-------------|------------------|
| WGS | 168 | 26,201 | 45.6 Tb | 156.0 |
| RNA-Seq | 64 | 812 | 4.7 Tb | 12.7 |
| AMPLICON | 4 | 87 | 17.2 Gb | 21.8 |
| WGA | 2 | 38 | 34.3 Gb | 19.0 |
| miRNA-Seq | 1 | 24 | 4.7 Gb | 24.0 |
| ChIP-Seq | 2 | 14 | 112.5 Gb | 7.0 |
| OTHER | 2 | 13 | 40.0 Gb | 6.5 |
| Tn-Seq | 1 | 6 | 19.7 Gb | 6.0 |
| Targeted-Capture | 1 | 5 | 2.8 Gb | 5.0 |
| WCS | 1 | 1 | 2.1 Gb | 1.0 |
| Bisulfite-Seq | 1 | 1 | 383.6 Mb | 1.0 |
| **TOTAL** | **237** | **27,202** | **50.5 Tb** | |

To understand the analytical landscape of *C. auris* transcriptomic studies we surveyed all available RNA-seq data associated with that species. Specifically, for all 64 RNA-seq BioProjects listed in Table 1 we attempted to retrieve associated publications. Of 64 BioProjects, 20 (31%) had linked manuscripts (21 papers total, 2018-2025) while 44 remained unpublished or in pre-print stage. For papers with available full text (17/20), we extracted reference genome and bioinformatics tool information (Table 2; also see Supp. Table 2).

**Table 2**: RNA-seq methodology across 20 published *C. auris* studies with linked BioProjects

| Category | Finding |
|----------|---------|
| **Reference Genome** | B8441/GCA_002759435.x (12/20, 60%); multiple clades (5/20); not specified (2/20) |
| **Alignment Tool** | `HISAT2` (7), `STAR` (5), `Bowtie2` (4), `BWA` (3), `TopHat2` (1) |
| **Quantification** | `featureCounts` (5), `HTSeq` (4), `StringTie` (2), `Kallisto` (2), `RSEM` (1) |
| **DE Analysis** | `DESeq2` (12), `edgeR` (4), `Cufflinks` (1) |
| **Publication Years** | 2018 (2), 2021 (4), 2022 (4), 2023 (2), 2024 (5), 2025 (4) |

Despite tool convergence, reference genome usage remains inconsistent. While 60% of published studies use B8441 (GCA_002759435 family), annotation versions vary---some cite only "B8441" without version, others specify GCA_002759435.2 or GCA_002759435.3. This creates reproducibility challenges (e.g., gene identifiers differ between versions) and complicates interpretation of old data in context of new genomes and vice versa. Similarly, tool version reporting is frequently incomplete or absent---papers cite "HISAT2" or "DESeq2" without specifying version numbers, yet algorithm behavior and output can differ substantially between releases. Without precise version information, reproducing published results becomes guesswork, undermining scientific rigor. These findings underscore need for standardized platforms specifying precise genome versions, tool versions, and parameters.

Here, we demonstrate how a new environment for the analysis of pathogen, host, and vector data---BRC-Analytics (https://brc-analytics.org)---can be used for standardizing and simplifying RNA-seq analyses using two recent *C. auris* studies as an example. Our approach makes cutting edge tools and powerful computational infrastructure freely accessible to any biologist. Importantly, the combination of BRC-analytics, the Galaxy platform, and large language models (LLM) tools described here automatically keeps provenance and ensures analytical reproducibility: any analysis conducted within our system can be easily understood and replicated by others.  

## Results

### Two representative studies

The *Introduction* section above described a survey of all publicly available *C. auris* sequence data with a particular focus on RNA-seq studies and associated publications (Supp. Table 2). From these publications we selected two studies. The first, Santana et al. (2023), identified *SCF1* gene as *C. auris*-specific adhesin essential for biofilm formation and virulence (PRJNA904261) [@santana2023]. The second, Wang et al. (2024), showed that glycan-lectin interactions modulate colonization and fungemia (PRJNA1086003) [@wang2024]. These two studies are good representatives of *C. auris* RNA-seq methodology. Both use B8441 (Clade I) reference genome, which dominates the field (14/20 published studies). Wang employs `HISAT2`/`STAR` + `DESeq2`, the most common pipeline (`DESeq2` in 13/20, `HISAT2` in 6/20 studies). Sample sizes of 13 and 6 runs bracket the typical range (median ~13-15, with 5 studies having exactly 6 runs). As 2023-2024 publications, they reflect current practices unlike older studies using outdated tools (`TopHat2`, `Cufflinks`). Both study adhesion/biofilm phenotypes, the dominant research theme alongside drug resistance. 

### Generating counts

The first step in this re-analysis is obtaining read counts corresponding to genes annotated with the *C. auris* genome. https://brc-analytics.org provides access to reference data for a variety of human pathogens and vectors. At the time of writing it provided access to 5,060 genome assemblies from 1,920 organisms. Our analysis begins with selecting an appropriate *C. auris* assembly (GCA_002759435.3), selecting reads representing the two studies referenced below, and launching an RNA-seq analysis workflow that produces read counts for all genes annotated within this genome assembly. A detailed step-by-step description of this procedure is available in Video 1. 

### Configuring analysis 

The workflow invoked in the previous section created read counts for each gene annotated in *C. auris* assembly (GCA_002759435.3) for all samples described in each of the papers (Supp. File 1). In order to continue with the analysis of differential gene expression we now need to organize data in way that reflects the experimental design of the two manuscripts (To make this section more understandable for the reader this section focuses on the re-analysis of Santana et al. [@santana2023] data. Data from Wang et al. (2024) data [@wang2024]) was re-analyzed in the exactly the same way). This implies identifying which samples belong to which condition, identifying replicates and so on. While this can be done manually we can harness the power of large language models (LLMs) to simplify this step. Before proceeding to description of our computational set-up we note that any results produced by LLMs must always be verified. This is why for each analyses we always as an LLM agent to first produce a plan of action. We then review this plan and modify as necessary before allowing the agent to proceed.

For this analyses we used Claude Code Agent (CCA) produced by Anthropic. It was configured to interact with Galaxy platform via application programming interface (API) key that effectively allows CCA to take actions on behalf of the user. CCA was running on a local computer we used to prepare this manuscript and interacted with Galaxy via Internet. The precise record of our interaction with CCA and its interaction with Galaxy is given in Supp. File 2 (also see Video 2 and Materials and Methods for the description of our setup). 

### Organizing data

Authors of each paper have deposited sequencing data into NCBI SRA and were given a BioProject identifier---an entity grouping related sequencing runs from a single study. Before performing the differential expression analyses we need to understand how samples deposited to SRA correspond to experimental conditions described in each manuscript. To begin we deposited PDFs of each manuscript along with all available supplemental data into a separate folder on a local computer. We then provided the following instructions to the CCA:

*I need to split Galaxy dataset collection #244 into several collections corresponding to experimental conditions described in the manuscript (check pdfs and xlsx files in this directory). In order to do this you need to download metadata for sequencing runs for bioproject PRJNA904261 to obtain accessions and metadata. You should then figure out how SRA accessions correspond to experimental conditions described in the paper. You should then present these finding to me, so that I can tell you what to do next.*

In the above prompt we specifically mentioned "Collection #244"---a Galaxy artifact containing read counts for all samples described in this study (can be viewed at https://usegalaxy.org/u/cartman/h/prjna904261-perm). A plan generated in response to this prompt can be seen in Supp. File 2. One can see that CCA correctly identified the relationship between datasets and experimental conditions described in the manuscript.

After reviewing the plan we instructed CCA to enact it:

*Go ahead and execute the plan. Once you are done please add name tags to dataset collection containing data we need to used for DeSeq2 analysis. E.g., label collections with names tags such as AR0382_WT, AR0387_WT, and tnSWI1.*

This step generated three dataset collections in Galaxy history corresponding to the three conditions described in the paper: AR0382_WT, AR0387_WT, and tnSWI1.

We then repeated this procedure in a separate Galaxy history containing read count derived from Wang et al. 2024 [@wang2024].

**Table 3**: Breakdown of datasets for `DESeq2` analysis. For Santana et al. AR0382_WT/tnSWI1 and AR0382_WT/AR0387_WT comparisons were performed. For Wang et al. AR0382 in vitro/AR0387 in vitro and AR0382 in vivo/AR0387 in vivo comparisons were performed. 

| Study          | Condition       | SRR Accessions                                     |Description                  |
  |----------------|-----------------|----------------------------------------------------|------------------------------|
  | Santana et al. | AR0382_WT       | SRR22376031, SRR22376032                           | Wild-type reference    |
  |                | AR0387_WT       | SRR22376029, SRR22376030                           | Poorly adhesive strain |
  |                | tnSWI1          | SRR22376027, SRR22376028                           | SWI1 mutant            |
  | Wang et al.    | AR0382 in vitro | SRR28790270, SRR28790272, SRR28790274              | In vitro culture      |
  |                | AR0387 in vitro | SRR28790276, SRR28790278, SRR28790280              | In vitro culture     |
  |                | AR0382 in vivo  | SRR28791430, SRR28791431, SRR28791432              | In vivo infection      |
  |                | AR0387 in vivo  | SRR28791433, SRR28791434, SRR28791437, SRR28791438 | In vivo infection     |

### Expression analysis and interpretation

In the previous section we have configured our data so we can perform differential expression. We then re-ran differential expression with `DESeq2` on data from both manuscripts as described in Table 3 and performed a systematic comparison of log2 fold changes against published supplementary data.

A technical challenge arose from differences in genome annotation versions. Both published studies used an older *C. auris* annotation with 6-digit gene ID suffixes (e.g., B9J08_001458), while we relied on the latest assembly (GCA_002759435.3) that uses 5-digit suffixes (e.g., B9J08_03708). Our re-analyses identified comparable DEG counts to the published results. Yet because different genome versions were used we could not map gene names directly. We decided to perform log2 fold-change (LFC) correlation mapping: for each published differentially expressed gene (DEG) in the two papers, we matched genes in our data by finding the closest log2 fold-change value in our results, accepting matches within 0.1 LFC units. The method achieved >95% mapping success with mean differences of only 0.01-0.02. CCA performed this entire procedure using the following prompt (here, again, using Santana et al. as an example) :

 *Datasets #521 and #523 in https://usegalaxy.org/u/cartman/h/prjna904261-perm represent DeSeq2 results for AR0382_WT/tnSWI1 and AR0382_WT/AR0387_WT comparisons, respectively. Compare them with the results reported in Santana et al. using paper PDF and supplementary files. Resolve gene name mapping using log2 fold-change (LFC) correlation analysis*

### Comparison with Santana et al. (2023) results

The study compared three strains (Table 3): AR0382_WT, a wild-type highly adhesive Clade I isolate; AR0387_WT, a poorly adhesive clinical isolate; and tnSWI1, a transposon-insertion mutant of AR0382 with disrupted SWI1, a chromatin remodeling factor. Each strain was sequenced in duplicate. The first comparison (Fig 1D) examined the tnSWI1 mutant versus wild-type AR0382 to identify genes affected by SWI1 disruption. The second comparison (Fig S5A) contrasted AR0387 against AR0382 to characterize expression differences between adhesive and non-adhesive strains. Both comparisons yielded excellent validation metrics. For the first (tnSWI1/AR0382_WT) comparison, we successfully mapped 1,186 differentially expressed genes and obtained a Pearson correlation of r = 0.9971 (R² = 0.9953) with 99.7% direction agreement. The second comparison (AR0382_WT/AR0387_WT) mapped 1,557 genes with r = 0.9883 (R² = 0.9768) and perfect 100% direction agreement. SCF1, the central finding of the Santana study, was the most strongly downregulated gene in both comparisons. The published analysis reported SCF1 (B9J08_001458) with log2 fold changes of -6.68 (Fig 1D) and -7.25 (Fig S5A). Our reanalysis identified the corresponding gene (B9J08_03708) with log2 fold changes of -6.82 and -7.35, respectively, confirming the paper's key finding with minimal deviation.

![Santana Validation](validation_figures/santana_combined_sidebyside.png)
*Figure 1: Validation of Santana et al. `DESeq2` results. Left: tnSWI1 vs AR0382 comparison (Fig 1D). Right: AR0387 vs AR0382 comparison (Fig S5A). Red dashed line indicates perfect correlation (y=x).*

### Comparison with Wang et al. (2024) results

This study compared two strains with distinct aggregation phenotypes: AR0382 (B11109), a highly aggregative biofilm-forming strain, and AR0387 (B8441), a non-aggregative strain. RNA-seq was performed under two conditions: in vitro biofilm growth (3 replicates per strain) and in vivo colonization of mouse jugular vein catheters (3 replicates for AR0382, 4 for AR0387). The authors reported 76 differentially expressed genes (DEGs) in the in vitro comparison and 259 DEGs in the in vivo comparison, using thresholds of FDR < 0.01 and |LFC| >= 1.0. Our reanalysis achieved perfect correlation with the published results. For the in vitro condition, we identified 73 DEGs with Pearson r = 1.0000 and 100% direction agreement across 75 matched genes. The in vivo analysis reproduced all 259 DEGs with identical correlation metrics. The key adhesin genes highlighted in the paper showed excellent concordance. SCF1 exhibited LFC of 8.61 (paper) versus 8.67 (our analysis) in vitro, and 4.47 versus 4.53 in vivo. ALS4112 showed similarly close agreement: 5.07 versus 5.08 in vitro, and 2.56 versus 2.56 in vivo. Other adhesin family members (IFF4109), virulence-associated genes (SAP7), and drug resistance genes (MDR1) all matched within 0.01 LFC units.

![Wang Validation](validation_figures/wang_validation_scatter.png)
*Figure 2: Validation of Wang et al. `DESeq2` results. Left: In vitro biofilm comparison (n=75 genes). Right: In vivo mouse catheter model (n=259 genes). Red dashed line indicates perfect correlation (y=x). Key adhesin genes SCF1 and ALS4112 are labeled.*

## Discussion

### Toward standardization of fungal genomics

Both studies achieved excellent validation status, with Santana et al. showing R² > 0.97 across both comparisons and Wang et al. achieving perfect correlation (r = 1.00) in both conditions. These results demonstrate that Galaxy-based reanalysis using standard workflows produces results equivalent to published analyses, and that differential expression patterns are highly reproducible when using the same statistical methods and significance thresholds. From a technical perspective, this validation demonstrates that different genome annotation versions can be effectively mapped using LFC correlation, enabling retrospective validation of studies that used older reference genomes. Both studies employed consistent statistical thresholds (FDR < 0.01, LFC >= 1.0), facilitating direct comparison of results.

### Importance of LLMs and their responsible use

For reproducibility, LLM-assisted analyses should be conducted through agentic coding tools such as Claude Code or Gemini Code Assist rather than chat-based interfaces. These tools automatically track all generated artifacts---scripts, intermediate files, and analysis outputs---within version-controlled repositories (e.g., GitHub), creating a complete audit trail. While this workflow may currently seem complex for bench biologists unfamiliar with command-line interfaces and version control, it represents the future of computational biology. The interfaces will evolve: emerging tools like Claude Code Web promise to deliver agentic capabilities through browser-based environments, lowering the barrier to entry while maintaining full provenance tracking. As these tools mature, the combination of natural language interaction and automatic versioning will make reproducible AI-assisted analysis accessible to researchers regardless of their computational background.

Critically, all results produced with agentic AI tools require independent validation. In this study, we had the advantage of known expected outcomes---published results against which to benchmark our AI-assisted reanalysis. This "ground truth" allowed us to confirm that the AI-directed workflow produced biologically accurate results. However, for novel research where expected outcomes are unknown, researchers must exercise heightened scrutiny. AI agents can confidently produce plausible but incorrect interpretations, and without validation benchmarks, such errors may go undetected. We recommend orthogonal validation approaches: qRT-PCR confirmation of key findings, biological replication, functional studies, and cross-referencing with independent datasets. The provenance tracking enabled by agentic tools becomes especially valuable here---complete audit trails allow retrospective verification when questions arise about specific analytical decisions.

### Why BRC-Analytics/Galaxy for AI-assisted analysis

The choice of workflow platform significantly impacts the feasibility of AI agent integration. Galaxy's architecture offers distinct advantages over code-first systems like Nextflow for agentic AI workflows. Galaxy provides structured tool metadata through repositories like IUC (github.com/galaxyproject/tools-iuc), where each tool's parameters, input/output types, and documentation are defined in machine-readable XML. This allows AI agents to query available tools, understand valid parameter options, and make informed decisions---capabilities that require parsing documentation or source code in Nextflow. Galaxy's stateful API enables agents to inspect histories, monitor job status, and retrieve results through structured endpoints, whereas Nextflow requires log parsing and manual file path management. Perhaps most importantly, Galaxy's integration with ACCESS-CI provides free, zero-configuration access to high-performance computing, eliminating the infrastructure barriers (container configuration, HPC authentication, resource allocation) that Nextflow imposes on users.

These architectural differences have practical implications for democratizing AI-assisted genomics. Galaxy's web-based interface means users need only a browser, while AI agents handle the complexity of tool selection and parameter configuration through the API. Nextflow's code-generation paradigm, while flexible, requires users to review generated DSL2 scripts, configure execution environments, and debug failures---skills that remain barriers for bench biologists. As AI agents become integral to computational biology, platforms that provide structured metadata, stateful APIs, and accessible infrastructure will enable broader adoption than those requiring programming expertise to operate.

### Future goals

We envision tighter integration between BRC-Analytics, Galaxy, and agentic AI systems. Currently, our workflow requires manual coordination: launching analyses through BRC-Analytics, managing data in Galaxy histories, and directing AI agents via API calls. Future development will embed AI agents directly within the Galaxy interface, enabling researchers to describe analyses in natural language while the system automatically selects appropriate workflows, configures parameters, and interprets results. This integration will transform BRC-Analytics from a workflow launcher into an intelligent research assistant that guides users through complex multi-omics analyses, suggests appropriate statistical approaches, and flags potential issues---all while maintaining the rigorous provenance tracking that Galaxy provides.

---

## Materials and Methods

### Literature Survey and Data Source Identification

To quantify *C. auris* sequencing data, we analyzed complete NCBI SRA database for taxonomy ID 498019 (*Candidozyma auris*) accessed December 3, 2025. SRA metadata (Cauris_SRA.csv) contained 27,201 total runs across 237 BioProjects. RNA-seq represents 812 runs (3.0%) and 64 BioProjects (27.0%), with WGS dominating run counts (26,201 runs, 96.3%) but representing 168 BioProjects (70.9%). Average runs per project: RNA-seq 12.7, WGS 156.0.

To characterize methodology across published RNA-seq studies, we linked all 64 RNA-seq BioProjects to associated publications. For each BioProject, we queried EuropePMC REST API (https://www.ebi.ac.uk/europepmc/webservices/rest/) for papers mentioning BioProject accession in full text, and NCBI E-utilities (elink.fcgi) for direct BioProject-to-PubMed links. This identified 21 papers linked to 20 of 64 BioProjects (31%); 44 BioProjects had no linked publications (unpublished or preprint). For papers with PMC IDs (17/20), we retrieved full-text XML and extracted reference genome information by pattern matching (GenBank/RefSeq accessions, strain names, clade designations) and RNA-seq tools (aligners, quantification tools, DE packages). Results in Supplementary Table 2.

For re-analysis validation, we selected Santana et al. (2023) *Science* (PRJNA904261) [@santana2023] and Wang et al. (2024) *Nature Communications* (PRJNA1086003) [@wang2024].

### WGS Data Contributor Analysis

To characterize sources of *C. auris* WGS data, we analyzed the "Center Name" field from SRA metadata for all 26,201 WGS runs. Organization names were extracted and aggregated by run count and unique BioProjects. Abbreviated center names were expanded using geographic location metadata (geo_loc_name field) to disambiguate state-level public health laboratories (e.g., "MDH_CSL" mapped to Maryland via "USA:Mid-Atlantic" region; "NSPHL" mapped to Nevada via "USA:Nevada" location). Organizations were categorized into: US State/Local Public Health Laboratories, CDC, International Public Health agencies, Academic/Research institutions, and Other. Results presented in Supplementary Table 1.

### Reference Genome and Annotation

All analyses used *Candidozyma auris* B8441 reference genome GCA_002759435.3 obtained from NCBI Assembly database. GTF annotation file contained 5,593 genes. This represents most recent annotation version at time of analysis and corresponds to assemblies used in BRC-Analytics platform.

### RNA-seq Data Processing

Raw sequencing data (FASTQ files) for both BioProjects were obtained from NCBI SRA via BRC-Analytics platform. Standard pre-processing pipeline included: (1) Quality assessment using `FastQC`, (2) Adapter trimming and quality filtering using `fastp`, (3) Alignment to reference genome using `STAR` aligner, and (4) Gene-level quantification using `featureCounts`. All tools were executed through Galaxy platform (https://usegalaxy.org) using IWC workflows.

### Differential Expression Analysis

Gene count matrices from `featureCounts` were analyzed using `DESeq2` (v2.11.40.8+galaxy0) through Galaxy interface. For **Santana et al. dataset**: Samples organized into three collections (AR0382 n=2, AR0387 n=2, tnSWI1 n=2). Two pairwise comparisons performed: (1) AR0382 vs tnSWI1, (2) AR0382 vs AR0387. For **Wang et al. dataset**: Samples split into four collections by strain and condition (AR0382 *in vitro* n=3, AR0387 *in vitro* n=3, AR0382 *in vivo* n=3, AR0387 *in vivo* n=4). Two pairwise comparisons performed: AR0382 vs AR0387 in (1) *in vitro* and (2) *in vivo* conditions. `DESeq2` parameters: size factor normalization, Benjamini-Hochberg FDR correction, significance threshold FDR less than 0.01, fold change absolute value of log2FC greater than or equal to 1 for Wang dataset. Default parameters used for Santana dataset to match published analysis.

### Gene Annotation Mapping

Published papers used older B8441 annotation versions with 6-digit gene ID suffixes while our analysis used GCA_002759435.3 with 5-digit suffixes. To reconcile gene identities, we developed LFC-based correlation mapping: for each gene in published DEG list, we identified the gene in our analysis with most similar log2-fold-change value. Mapping quality assessed using Pearson and Spearman correlation coefficients, direction agreement percentage, and mean LFC difference. Mapping scripts available at https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261/analysis and https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003/analysis.

### Galaxy Workflows and Reproducibility

All analyses performed on Galaxy Main server (https://usegalaxy.org). Galaxy histories containing complete analysis workflows, intermediate files, and final results are publicly accessible:
- Santana et al.: https://usegalaxy.org/u/cartman/h/prjna904261-final
- Wang et al. (Analysis): https://usegalaxy.org/histories/view?id=bbd44e69cb8906b58b85fc3ebc05b72b
- Wang et al. (Final): https://usegalaxy.org/histories/view?id=bbd44e69cb8906b59f131af7b542c1b1

IWC workflows used are available at https://iwc.galaxyproject.org and are version-controlled in GitHub repository at https://github.com/galaxyproject/iwc. Workflow diagrams and analysis reports available in supplementary materials.

### Statistical Analysis and Visualization

Validation statistics (Pearson correlation, Spearman correlation, direction agreement) calculated using custom Python scripts. Literature survey statistics and visualizations generated using analyze_combined_data.py and visualize_combined.py scripts. All analysis code and intermediate files available in project repositories.

### Software Versions

- Galaxy platform: https://usegalaxy.org (accessed November-December 2024)
- DESeq2: 2.11.40.8+galaxy0
- STAR aligner, featureCounts, FastQC, fastp: versions specified in IWC workflows
- Python: 3.x (for validation scripts)
- Key Python packages: pandas, numpy, scipy, matplotlib, seaborn

---

## References

::: {#refs}
:::


## Supplementary Materials

**Supplementary Table 1**: *C. auris* WGS data contributors by organization category and top sequencing centers.

*Panel A: Summary by Organization Category*

| Category | Organizations | Runs | % of Total |
|----------|---------------|------|------------|
| US State/Local Public Health Labs | 26 | 20,552 | 78.4% |
| CDC | 2 | 2,626 | 10.0% |
| Academic/Research | 46 | 1,365 | 5.2% |
| Other | 41 | 1,345 | 5.1% |
| International Public Health | 5 | 313 | 1.2% |
| **TOTAL** | **120** | **26,201** | **100%** |

*Panel B: Top 15 Contributing Organizations*

| Organization | Full Name | Runs | % |
|--------------|-----------|------|---|
| UPHL_ID | Utah Public Health Laboratory | 4,447 | 17.0% |
| NVSPHL | Nevada State Public Health Laboratory | 4,363 | 16.7% |
| CDC-NCEZID-MDB | CDC Mycotic Diseases Branch | 2,406 | 9.2% |
| MDH_CSL | Maryland Dept of Health, Central Services Lab | 2,309 | 8.8% |
| TXDSHS | Texas Dept of State Health Services | 1,487 | 5.7% |
| MDHHS-GS | Michigan Dept of Health & Human Services | 1,289 | 4.9% |
| - | Wisconsin State Laboratory of Hygiene | 1,211 | 4.6% |
| RIPHL | Rhode Island Public Health Laboratory | 1,197 | 4.6% |
| NSPHL | Nevada State Public Health Laboratory | 1,031 | 3.9% |
| - | Wadsworth Center (New York) | 705 | 2.7% |
| - | Minnesota Dept of Health | 688 | 2.6% |
| OCPHL_CA | Orange County Public Health Lab (California) | 659 | 2.5% |
| - | Washington State Dept of Health | 583 | 2.2% |
| UNLV NPM | Univ of Nevada Las Vegas, Pathogen Monitoring | 443 | 1.7% |
| - | Fudan University | 264 | 1.0% |

*US public health laboratories (state/local + CDC) account for 88.4% of all C. auris WGS data, reflecting outbreak surveillance priorities. Nevada appears twice (NVSPHL + NSPHL = 5,394 runs, 20.6%), indicating major outbreak focus.*

**Supplementary Table 2**: RNA-seq methodology across 20 published *C. auris* BioProjects with linked publications (2018-2025).

| BioProject | PMID | Authors | Year | Runs | Reference Genome | RNA-seq Tools |
|------------|------|---------|------|------|------------------|---------------|
| PRJNA445471 | 30559369 | Muñoz JF et al. | 2018 | 24 | B8441, B11220, B11243 | Bowtie2, TopHat2, RSEM, Trinity, edgeR |
| PRJNA477447 | 29997121 | Kean R et al. | 2018 | 22 | B8441 (de novo) | Trinity, HISAT2, Kallisto, DESeq2 |
| PRJNA682185 | 34630944 | Zamith-Miranda D et al. | 2021 | 36 | B8441 (GCA_002759435.2) | DESeq2, edgeR |
| PRJNA682422 | 34180774 | Lara-Aguilar V et al. | 2021 | 6 | B8441 (GCA_002759435.2) | FastQC, Trimmomatic, fastp, STAR, featureCounts, DESeq2 |
| PRJNA735406 | 34354695 | Zhou W et al. | 2021 | 6 | B11221 (Clades I-V) | Trimmomatic, HISAT2, Cufflinks, HTSeq, DESeq2 |
| PRJNA801628 | 35473297 | Biermann AR et al. | 2022 | 24 | B8441, B11221, B11243 (Clades I, III, IV) | HISAT2, featureCounts, edgeR |
| PRJNA830685 | 36445083 | Narayanan A et al. | 2022 | 16 | B8441, CBS10913 (Clade II) | FastQC, fastp, BWA, Bowtie2, HTSeq, DESeq2 |
| PRJNA788930 | 35652307 | Shivarathri R et al. | 2022 | 12 | NS | RNA-seq |
| PRJNA792028 | 36913408 | Bing J et al. | 2023 | 15 | GCA_002759435.2, GCF_002775015.1 | HiSat2, StringTie, DESeq2, BWA |
| PRJNA904261 | 37769084 | Santana DJ et al. | 2023 | 6 | B8441 (Clade I) | RNA-seq |
| PRJNA1015296 | 38493178 | Bing J et al. | 2024 | 141 | B8441 (GCA_002759435.2) | HiSat2, StringTie, DESeq2, BWA |
| PRJNA902676 | 38722168 | Yang B et al. | 2024 | 40 | B11220, B11221 (Clades II, III) | Kallisto, DESeq2 |
| PRJNA1036037 | 39480072 | Li J et al. | 2024 | 22 | Clade IV | RNA-seq |
| PRJNA1086003 | 39455573 | Wang TW et al. | 2024 | 13 | B8441 (Clade I) | HISAT2, STAR, DESeq2 |
| PRJEB57846 | 39297640 | Rhodes J et al. | 2024 | 12 | NS | WGS, RNA-seq |
| PRJNA1012821 | 40468551 | Chauhan A et al. | 2025 | 16 | B8441, B11220 (CGD) | FastQC, fastp, Bowtie2, HTSeq, DESeq2 |
| PRJNA1139166 | 40099908 | Phan-Canh T et al. | 2025 | 15 | B8441 (GCA_002759435.2) | FastQC, fastp, cutadapt, STAR, featureCounts |
| PRJNA1208975 | 40530673 | Yang G et al. | 2025 | 9 | Clade I | RNA-seq |
| PRJNA1232830 | 40066990 | Chauhan M et al. | 2025 | 6 | Clade I | RNA-seq |
| PRJNA1291775 | 40863525 | Vidal-Montiel A et al. | 2025 | 6 | GCA_003014415.1, GCA_034640365.1 (Clades III, IV) | FastQC, Trimmomatic, STAR, featureCounts, DESeq2 |

*NS = Not specified in available text. Data extracted from PMC full text via EuropePMC and NCBI E-utilities APIs. 44 additional BioProjects had no linked publications.*

**Supplementary File 1**: Galaxy workflow diagrams for re-analyses.
*Source: https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261/analysis and https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003/analysis*

**Supplementary File 2**: Gene mapping tables with LFC correlation values.
*Source: Same repositories as above*

**Supplementary File 3**: Analysis reports with complete methodological details.
*Source: ANALYSIS_REPORT.md in each repository*

---

*Manuscript generated with Claude Code (Anthropic)*
*Draft version for iteration - December 3, 2025*
