# RNA-seq BioProject Literature Survey

## Overview

Comprehensive survey of *Candidozyma auris* RNA-seq BioProjects from NCBI SRA with linked publications from PubMed/EuropePMC.

**Total RNA-seq BioProjects**: 64  
**BioProjects with linked papers**: 20 (21 papers total)  
**BioProjects without papers found**: 44  

## Summary Statistics

| Metric | Count |
|--------|-------|
| Papers with genome specified | 18/20 |
| Papers with detailed tools | 15/20 |
| Most common reference | B8441 (GCA_002759435.x) - 12 papers |
| Most common aligner | HISAT2 (7), STAR (5) |
| Most common DE tool | DESeq2 (12), edgeR (4) |

## Consolidated Table

| BioProject | PMID | Year | Reference Genome | RNA-seq Tools |
|------------|------|------|------------------|---------------|
| PRJEB57846 | 39297640 | 2024 | NS | WGS, RNA-seq |
| PRJNA1012821 | 40468551 | 2025 | B8441, B11220 (CGD) | FastQC, fastp, Bowtie2, HTSeq, DESeq2 |
| PRJNA1015296 | 38493178 | 2024 | B8441 (GCA_002759435.2) | HiSat2, StringTie, DESeq2, BWA |
| PRJNA1036037 | 39480072 | 2024 | Clade IV | RNA-seq |
| PRJNA1086003 | 39455573 | 2024 | B8441 (Clade I) | HISAT2, STAR, DESeq2 |
| PRJNA1139166 | 40099908 | 2025 | B8441 (GCA_002759435.2) | FastQC, fastp, cutadapt, STAR, featureCounts |
| PRJNA1208975 | 40530673 | 2025 | Clade I | RNA-seq |
| PRJNA1232830 | 40066990 | 2025 | Clade I | RNA-seq |
| PRJNA1291775 | 40863525 | 2025 | GCA_003014415.1, GCA_034640365.1, GCA_003013715... | FastQC, Trimmomatic, STAR, featureCounts, DESeq2 |
| PRJNA445471 | 30559369 | 2018 | B8441, B11220, B11243 (GCA_002775015.1, GCA_002... | Bowtie2, TopHat2, RSEM, Trinity, edgeR |
| PRJNA477447 | 29997121 | 2018 | B8441 (de novo ~11.5 Mb) | Trinity, HISAT2, Kallisto, DESeq2 |
| PRJNA682185 | 34630944 | 2021 | B8441 (GCA_002759435.2) | DESeq2, edgeR |
| PRJNA682422 | 34180774 | 2021 | B8441 (GCA_002759435.2) | FastQC, Trimmomatic, fastp, STAR, featureCounts, DESeq2 |
| PRJNA735406 | 34354695 | 2021 | B11221 (Clades I-V) | Trimmomatic, HISAT2, Cufflinks, HTSeq, DESeq2 |
| PRJNA788930 | 35652307 | 2022 | NS | RNA-seq |
| PRJNA792028 | 36913408 | 2023 | GCA_002759435.2, GCF_002775015.1 | HiSat2, StringTie, DESeq2, BWA |
| PRJNA801628 | 35473297 | 2022 | B8441, B11221, B11243 (Clades I, III, IV) | HISAT2, featureCounts, edgeR |
| PRJNA830685 | 36445083 | 2022 | B8441, CBS10913 (Clade II) | FastQC, fastp, BWA, Bowtie2, HTSeq, DESeq2 |
| PRJNA902676 | 38722168 | 2024 | B11220, B11221 (Clades II, III) | Kallisto, DESeq2 |
| PRJNA904261 | 37769084 | 2023 | B8441 (Clade I) | RNA-seq |

*NS = Not specified in available text*

## Detailed Paper Summaries

### PRJEB57846

**PMID**: [39297640](https://pubmed.ncbi.nlm.nih.gov/39297640/)  
**Year**: 2024  
**Title**: What makes Candida auris pan-drug resistant? Integrative insights from genomic, transcriptomic, and phenomic analysis  
**Reference Genome**: NS  
**RNA-seq Pipeline**: WGS, RNA-seq

**Summary**: Investigates pan-drug resistant (PDR) C. auris strains showing resistance to all four major antifungal classes. Among 1,570 genetic variants, 299 were unique to PDR strains. Genomic, transcriptomic, and phenomic analysis identified perturbations in genes associated with nucleotide biosynthesis, mRNA processing, and nuclear export.

---

### PRJNA1012821

**PMID**: [40468551](https://pubmed.ncbi.nlm.nih.gov/40468551/)  
**Year**: 2025  
**Title**: Multi-Omics Analysis of Experimentally Evolved Candida auris Isolates Reveals Modulation of Sterols, Sphingolipids, and Oxidative Stress in Acquired Amphotericin B Resistance  
**Reference Genome**: B8441, B11220 (CGD)  
**RNA-seq Pipeline**: FastQC, fastp, Bowtie2, HTSeq, DESeq2

**Summary**: Experimentally evolved two drug-susceptible Clade II isolates to develop AmB resistance (4-8 fold MIC increase). Multi-omics analysis identified AOX2 upregulation as key resistance mechanism; aox2Δ mutant reversed resistance phenotype.

---

### PRJNA1015296

**PMID**: [38493178](https://pubmed.ncbi.nlm.nih.gov/38493178/)  
**Year**: 2024  
**Title**: Rapid evolution of an adaptive multicellular morphology of Candida auris during systemic infection  
**Reference Genome**: B8441 (GCA_002759435.2)  
**RNA-seq Pipeline**: HiSat2, StringTie, DESeq2, BWA

**Summary**: Reports rapid evolution of aggregative multicellular morphology during murine systemic infection. De novo point mutations in cell division/budding genes underlie this phenotype. Aggregative cells accumulate in brain and show advantages during infection.

---

### PRJNA1036037

**PMID**: [39480072](https://pubmed.ncbi.nlm.nih.gov/39480072/)  
**Year**: 2024  
**Title**: Exploration of novel mechanisms of azole resistance in Candida auris / Ume6-dependent pathways of morphogenesis  
**Reference Genome**: Clade IV  
**RNA-seq Pipeline**: RNA-seq

**Summary**: Two studies using same BioProject: (1) Explored novel azole resistance mechanisms using in vitro evolution of TAC1A/TAC1B/MRR1 triple-deletion strain. (2) Demonstrated role of Ume6 transcription factor in filamentation, aggregation, and biofilm formation.

---

### PRJNA1086003

**PMID**: [39455573](https://pubmed.ncbi.nlm.nih.gov/39455573/)  
**Year**: 2024  
**Title**: Functional redundancy in Candida auris cell surface adhesins crucial for cell-cell interaction and aggregation  
**Reference Genome**: B8441 (Clade I)  
**RNA-seq Pipeline**: HISAT2, STAR, DESeq2

**Summary**: Identified key cell surface adhesins Als4112 and Scf1 upregulated in aggregative phenotype during in vitro and in vivo biofilms. Null mutants demonstrated crucial roles for these adhesins in cell-cell adherence, coaggregation, and biofilm formation.

---

### PRJNA1139166

**PMID**: [40099908](https://pubmed.ncbi.nlm.nih.gov/40099908/)  
**Year**: 2025  
**Title**: Rapid in vitro evolution of flucytosine resistance in Candida auris  
**Reference Genome**: B8441 (GCA_002759435.2)  
**RNA-seq Pipeline**: FastQC, fastp, cutadapt, STAR, featureCounts

**Summary**: Demonstrates rapid acquisition of 5-fluorocytosine resistance after 1-2 passages under drug selection. Used novel bioinformatics workflow to identify genetic polymorphisms from RNA-seq data, finding mutations in FUR1 gene encoding 5-fluorouracil convertase.

---

### PRJNA1208975

**PMID**: [40530673](https://pubmed.ncbi.nlm.nih.gov/40530673/)  
**Year**: 2025  
**Title**: In vitro and in vivo activity of sodium houttuyfonate and sodium new houttuyfonate against Candida auris infection  
**Reference Genome**: Clade I  
**RNA-seq Pipeline**: RNA-seq

**Summary**: Evaluates SH and SNH (derivatives from Houttuynia cordata) as antifungal agents. Shows significant inhibitory activity against fluconazole-resistant strains, affecting adhesion, aggregation, and biofilm formation abilities.

---

### PRJNA1232830

**PMID**: [40066990](https://pubmed.ncbi.nlm.nih.gov/40066990/)  
**Year**: 2025  
**Title**: The Gcn5 lysine acetyltransferase mediates cell wall remodeling, antifungal drug resistance, and virulence  
**Reference Genome**: Clade I  
**RNA-seq Pipeline**: RNA-seq

**Summary**: Shows C. auris GCN5 lysine acetyltransferase is essential for cell wall remodeling, antifungal drug resistance, and virulence. Comparative transcriptional analysis with C. albicans identifies conserved and divergent Gcn5-dependent networks.

---

### PRJNA1291775

**PMID**: [40863525](https://pubmed.ncbi.nlm.nih.gov/40863525/)  
**Year**: 2025  
**Title**: The GPI-Anchored Aspartyl Proteases Encoded by YPS1 and YPS7 Genes of Candidozyma auris  
**Reference Genome**: GCA_003014415.1, GCA_034640365.1, GCA_003013715.2 (Clades III, IV)  
**RNA-seq Pipeline**: FastQC, Trimmomatic, STAR, featureCounts, DESeq2

**Summary**: Identified seven putative yapsin genes in C. auris CJ97 and 20-1498 (Clades III, IV). YPS1 is orthologous to C. albicans SAP9; YPS7 orthologous to S. cerevisiae YPS7. In silico analysis suggested pepstatin interaction with Yps1/Yps7 catalytic domains.

---

### PRJNA445471

**PMID**: [30559369](https://pubmed.ncbi.nlm.nih.gov/30559369/)  
**Year**: 2018  
**Title**: Genomic insights into multidrug-resistance, mating and virulence in Candida auris and related emerging species  
**Reference Genome**: B8441, B11220, B11243 (GCA_002775015.1, GCA_002926055.1, GCA_003014415.1)  
**RNA-seq Pipeline**: Bowtie2, TopHat2, RSEM, Trinity, edgeR

**Summary**: Analyzed near-complete genome assemblies for four C. auris clades and three related species. Mapped intra/inter-species rearrangements across seven chromosomes. Found mating/meiosis genes conserved; identified genes linked to drug resistance and virulence including expanded transporter families.

---

### PRJNA477447

**PMID**: [29997121](https://pubmed.ncbi.nlm.nih.gov/29997121/)  
**Year**: 2018  
**Title**: Transcriptome Assembly and Profiling of Candida auris Reveals Novel Insights into Biofilm-Mediated Resistance  
**Reference Genome**: B8441 (de novo ~11.5 Mb)  
**RNA-seq Pipeline**: Trinity, HISAT2, Kallisto, DESeq2

**Summary**: First transcriptomic analysis of temporally developing C. auris biofilms. De novo transcriptome assembly (~11.5 Mb). Biofilms exhibited phase- and antifungal class-dependent resistance profiles.

---

### PRJNA682185

**PMID**: [34630944](https://pubmed.ncbi.nlm.nih.gov/34630944/)  
**Year**: 2021  
**Title**: Transcriptional and translational landscape of Candida auris in response to caspofungin  
**Reference Genome**: B8441 (GCA_002759435.2)  
**RNA-seq Pipeline**: DESeq2, edgeR

**Summary**: Treated two distinct C. auris strains with caspofungin for 24h and evaluated cellular responses at morphological, transcriptional, and translational levels.

---

### PRJNA682422

**PMID**: [34180774](https://pubmed.ncbi.nlm.nih.gov/34180774/)  
**Year**: 2021  
**Title**: Adaptation of the emerging pathogenic yeast Candida auris to high caspofungin concentrations correlates with cell wall changes  
**Reference Genome**: B8441 (GCA_002759435.2)  
**RNA-seq Pipeline**: FastQC, Trimmomatic, fastp, STAR, featureCounts, DESeq2

**Summary**: Characterized cellular changes associated with caspofungin adaptation. All isolates showed paradoxical growth (PG) to caspofungin. Identified two FKS genes encoding β-1,3-glucan synthase target.

---

### PRJNA735406

**PMID**: [34354695](https://pubmed.ncbi.nlm.nih.gov/34354695/)  
**Year**: 2021  
**Title**: A Comparative Transcriptome Between Anti-drug Sensitive and Resistant Candida auris in China  
**Reference Genome**: B11221 (Clades I-V)  
**RNA-seq Pipeline**: Trimmomatic, HISAT2, Cufflinks, HTSeq, DESeq2

**Summary**: Transcriptomic comparison between drug-sensitive CX1 and resistant CX2 isolates. Found 541 upregulated and 453 downregulated genes in resistant strain, highlighting potential DEGs involved in drug resistance.

---

### PRJNA788930

**PMID**: [35652307](https://pubmed.ncbi.nlm.nih.gov/35652307/)  
**Year**: 2022  
**Title**: Comparative Transcriptomics Reveal Possible Mechanisms of Amphotericin B Resistance in Candida auris  
**Reference Genome**: NS  
**RNA-seq Pipeline**: RNA-seq

**Summary**: RNA-seq of AmB-resistant and sensitive isolates suggests membrane lipid alterations and chromatin modifications are critical processes contributing to adaptive AmB resistance.

---

### PRJNA792028

**PMID**: [36913408](https://pubmed.ncbi.nlm.nih.gov/36913408/)  
**Year**: 2023  
**Title**: Clinical isolates of Candida auris with enhanced adherence and biofilm formation due to genomic amplification of ALS4  
**Reference Genome**: GCA_002759435.2, GCF_002775015.1  
**RNA-seq Pipeline**: HiSat2, StringTie, DESeq2, BWA

**Summary**: Reports new aggregating form with enhanced biofilm capacity due to increased adherence. Unlike previous aggregating morphology, this form becomes unicellular after proteinase K/trypsin treatment. ALS4 amplification drives enhanced adherence.

---

### PRJNA801628

**PMID**: [35473297](https://pubmed.ncbi.nlm.nih.gov/35473297/)  
**Year**: 2022  
**Title**: Transcriptional Response of Candida auris to the Mrr1 Inducers Methylglyoxal and Benomyl  
**Reference Genome**: B8441, B11221, B11243 (Clades I, III, IV)  
**RNA-seq Pipeline**: HISAT2, featureCounts, edgeR

**Summary**: Shows MRR1a contributes to methylglyoxal resistance. Main Mrr1a targets are MG reductase and MDR1. Diseases increasing C. auris infection risk (diabetes, kidney failure) are associated with elevated MG levels.

---

### PRJNA830685

**PMID**: [36445083](https://pubmed.ncbi.nlm.nih.gov/36445083/)  
**Year**: 2022  
**Title**: Directed Evolution Detects Supernumerary Centric Chromosomes Conferring Resistance to Azoles in Candida auris  
**Reference Genome**: B8441, CBS10913 (Clade II)  
**RNA-seq Pipeline**: FastQC, fastp, BWA, Bowtie2, HTSeq, DESeq2

**Summary**: Experimentally evolved drug-susceptible Clade II isolate with fluconazole. NGS and electrophoretic karyotyping confirmed segmental aneuploidy as supernumerary chromosomes from centromere-inclusive duplication events (638-kb and 675-kb regions).

---

### PRJNA902676

**PMID**: [38722168](https://pubmed.ncbi.nlm.nih.gov/38722168/)  
**Year**: 2024  
**Title**: A correlative study of the genomic underpinning of virulence traits and drug tolerance of Candida auris  
**Reference Genome**: B11220, B11221 (Clades II, III)  
**RNA-seq Pipeline**: Kallisto, DESeq2

**Summary**: Compared drug-sensitive B11220 (Clade II) and drug-resistant B11221 (Clade III) isolates. Analyzed genetics and gene expression patterns of carbon metabolism, drug resistance, and macrophage interaction.

---

### PRJNA904261

**PMID**: [37769084](https://pubmed.ncbi.nlm.nih.gov/37769084/)  
**Year**: 2023  
**Title**: A Candida auris-specific adhesin, Scf1, governs surface association, colonization, and virulence  
**Reference Genome**: B8441 (Clade I)  
**RNA-seq Pipeline**: RNA-seq

**Summary**: Characterized adhesin arsenal discovering SCF1 (Surface Colonization Factor) and Iff4109 essential for colonization. SCF1 is C. auris-specific; relies on exposed cationic residues (not hydrophobic interactions) for surface association. Required for biofilm formation, skin colonization, and virulence.

---

## BioProjects Without Linked Publications

The following 44 RNA-seq BioProjects did not have linked publications found in PubMed/EuropePMC. These may represent unpublished data, preprints, or internal datasets.

- [PRJEB65426](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB65426)
- [PRJNA1001264](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1001264)
- [PRJNA1021218](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1021218)
- [PRJNA1065312](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1065312)
- [PRJNA1079743](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1079743)
- [PRJNA1099273](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1099273)
- [PRJNA1109421](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1109421)
- [PRJNA1132143](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1132143)
- [PRJNA1149731](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1149731)
- [PRJNA1160268](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1160268)
- [PRJNA1164389](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1164389)
- [PRJNA1169344](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1169344)
- [PRJNA1169345](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1169345)
- [PRJNA1169348](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1169348)
- [PRJNA1184812](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1184812)
- [PRJNA1217042](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1217042)
- [PRJNA1245342](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1245342)
- [PRJNA1279245](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1279245)
- [PRJNA1290291](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1290291)
- [PRJNA1298539](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1298539)
- [PRJNA1330857](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1330857)
- [PRJNA1332928](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1332928)
- [PRJNA1368978](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1368978)
- [PRJNA510662](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA510662)
- [PRJNA563631](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA563631)
- [PRJNA623931](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA623931)
- [PRJNA625552](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA625552)
- [PRJNA627895](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA627895)
- [PRJNA659745](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA659745)
- [PRJNA678875](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA678875)
- [PRJNA697848](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA697848)
- [PRJNA718866](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA718866)
- [PRJNA746543](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA746543)
- [PRJNA814991](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA814991)
- [PRJNA830280](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA830280)
- [PRJNA902399](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA902399)
- [PRJNA909861](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA909861)
- [PRJNA911136](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA911136)
- [PRJNA911137](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA911137)
- [PRJNA925797](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA925797)
- [PRJNA929204](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA929204)
- [PRJNA976246](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA976246)
- [PRJNA983706](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA983706)
- [PRJNA988322](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA988322)

---

*Survey conducted December 2025 using EuropePMC and NCBI E-utilities APIs. Full text extraction from PMC where available.*
