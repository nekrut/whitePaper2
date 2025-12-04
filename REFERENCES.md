# References for *C. auris* BRC-Analytics White Paper

## Primary Publications (Re-analyzed Studies)

### 1. Santana et al. (2023) - *Science*

**Citation**: Santana DJ et al. "A *Candida auris*-specific adhesin, Scf1, governs surface association, colonization, and virulence." *Science*. 2023;381(6665):1461-1467. PMID: 37769084. BioProject: PRJNA904261.

**Summary**: This landmark study identifies Surface Colonization Factor 1 (Scf1) as a previously uncharacterized adhesin specific to *Candida auris* that is critical for the pathogen's ability to colonize medical devices and host tissues. Unlike typical fungal adhesins that rely on hydrophobic interactions, Scf1 functions through exposed cationic residues for surface association. The study demonstrates that SCF1 is required for biofilm formation, skin colonization, systemic infection severity, and colonization of implanted medical devices like central venous catheters. Among clinical isolates from all five *C. auris* clades, SCF1 expression levels directly correlate with adhesion capacity, indicating this protein governs the pathogen's surface-binding variability and represents an evolutionary adaptation contributing to its emergence as a healthcare threat.

---

### 2. Wang et al. (2024) - *Nature Communications*

**Citation**: Wang Y et al. "Cell surface glycan-lectin interactions modulate *Candida auris* colonization and fungemia." *Nat Commun*. 2024;15:6490. DOI: 10.1038/s41467-024-50434-4. PMID: 38562758. BioProject: PRJNA1086003.

**Summary**: This study examines how *C. auris* employs surface proteins to facilitate cell-to-cell bonding and biofilm development, comparing aggregative (AR0382) and non-aggregative (AR0387) strains. Researchers identified two adhesin proteins---Als5 and Scf1---that are significantly elevated in aggregative strains during biofilm formation both in laboratory and animal infection models. The study revealed functional redundancy: when either adhesin was individually removed, cells failed to clump together, but when both were absent simultaneously, cells regained adhesion through complementary interactions. This demonstrates that multiple cell wall proteins work interchangeably, allowing the pathogen to maintain virulence and persistence despite environmental pressures. The RNA-seq data comparing *in vitro* and *in vivo* conditions provides insights into transcriptional programs driving colonization and fungemia.

---

## First Description of *C. auris*

### 3. Satoh et al. (2009) - First Isolation

**Citation**: Satoh K et al. "*Candida auris* sp. nov., a novel ascomycetous yeast isolated from the external ear canal of an inpatient in a Japanese hospital." *Microbiol Immunol*. 2009;53(1):41-44. PMID: 19161556.

**Summary**: This paper represents the foundational taxonomic description of *Candida auris* as a new species. A single strain was isolated from the external ear canal of a hospitalized patient in Japan, marking the first documented clinical isolation of this fungal pathogen. Molecular analyses of ribosomal DNA sequences revealed phylogenetic proximity to *Candida ruelliae* and *Candida haemulonii*, placing it in the Metschnikowiaceae family. The strain demonstrated temperature-dependent growth patterns, growing well at 40°C but showing slow and weak growth at 42°C. The researchers formally proposed the species name *Candida auris* (Latin "auris" = ear), with the type strain designated as JCM15448. This discovery preceded by nearly a decade the pathogen's emergence as a global healthcare threat.

---

## Public Health Authority Resources

### 4. CDC - *Candida auris* Resources

**Sources**: CDC Media Release (March 2023), Clinical Overview (PMC11946832), Fact Sheet.

**Summary**: The U.S. Centers for Disease Control and Prevention has designated *C. auris* as an "urgent" antimicrobial resistance threat---the first and only fungal pathogen to receive this highest-level designation. CDC surveillance data shows dramatic case increases: from 52 cases in 2016 to over 4,500 in 2023, more than doubling annually. The pathogen is now present in all but 12 U.S. states. Key clinical concerns include: multidrug resistance (often to all three major antifungal classes: azoles, echinocandins, and polyenes), rapid healthcare-associated transmission, environmental persistence on surfaces for weeks, and high mortality rates (30-60%). CDC recommends enhanced infection control measures including contact precautions, environmental disinfection with EPA-registered products, and laboratory notification protocols.

---

### 5. NIAID - Fungal Pathogen Priority

**Sources**: NIAID News (2024), BAA2025-1 Funding Announcement.

**Summary**: The National Institute of Allergy and Infectious Diseases has prioritized *C. auris* research through its antimicrobial resistance initiative. NIAID characterizes *C. auris* as a "mysterious and tenacious enemy" due to its rapid global emergence, unclear origins, and remarkable drug resistance. The 2025 funding priorities (HHS-NIH-NIAID-BAA2025-1) specifically solicit applications for: new therapeutics targeting resistant fungi including *C. auris*, rapid diagnostic technologies for clinical identification, and vaccine development strategies. Topic C of the announcement focuses on diagnostics for *C. auris*, *Cryptococcus*, *Aspergillus*, and *Mucorales*. This federal investment reflects recognition that current antifungal options are inadequate for addressing the *C. auris* threat.

---

### 6. WHO - Critical Priority Fungal Pathogen

**Citation**: WHO Fungal Priority Pathogens List systematic review. PMID: 38935900. PMC11210622.

**Summary**: The World Health Organization included *C. auris* in its first-ever Fungal Priority Pathogens List (FPPL), designating it as a critical-priority pathogen requiring urgent research and development investment. The systematic review supporting this designation evaluated *C. auris* against criteria including: mortality and morbidity burden, antifungal resistance trends, treatability with existing drugs, preventability, annual incidence, and diagnostic/surveillance challenges. WHO emphasizes that unlike other priority fungal pathogens that primarily affect immunocompromised individuals, *C. auris* causes outbreaks in healthcare settings affecting patients with various underlying conditions. The designation aims to guide global research priorities and public health preparedness for invasive fungal diseases.

---

## Intergalactic Workflow Commission (IWC)

### 7. IWC - Galaxy Workflows

**Sources**: https://iwc.galaxyproject.org/, GitHub: galaxyproject/iwc, WorkflowHub Project 33.

**Summary**: The Intergalactic Workflow Commission (IWC) maintains a collection of community-curated, tested, and versioned Galaxy workflows for reproducible bioinformatics analyses. All IWC workflows undergo rigorous review including automated testing, human code review, and validation with example datasets. Workflows are automatically installed on all usegalaxy.* servers (Galaxy Main, Galaxy Europe, Galaxy Australia) with each Galaxy release, ensuring global accessibility and version consistency. The RNA-seq workflows used in this study include modules for quality control (FastQC), read trimming (fastp), alignment (STAR), quantification (featureCounts), and differential expression (DESeq2). IWC workflows are version-controlled through GitHub, enabling precise reproducibility by specifying exact workflow versions and tool dependencies.

---

## RNA-seq Best Practices and Validation

### 8. Zenodo - RNA-seq Analysis Best Practices

**Citation**: DOI: 10.5281/zenodo.3985047 (2020).

**Summary**: This Zenodo resource provides community-established best practices for RNA-seq experimental design, analysis, and interpretation. Key recommendations include: minimum of 3 biological replicates per condition for statistical power, paired-end sequencing with adequate depth (>20M reads for differential expression), appropriate normalization methods (TMM, DESeq2 median-of-ratios), multiple testing correction (Benjamini-Hochberg FDR), and fold-change thresholds for biological significance. The guide emphasizes validation strategies: qRT-PCR confirmation of key differentially expressed genes, functional validation through genetic or pharmacological perturbation, and integration with orthogonal data types (proteomics, metabolomics). These practices informed our validation approach for the BRC-Analytics re-analyses.

---

### 9. PMC - Global Threat Review

**Citation**: "Act Now: The Global Threat of Candida Auris and the Urgent Need for Effective Countermeasures." PMC11221456 (2024).

**Summary**: This comprehensive review synthesizes the current state of *C. auris* research and clinical management, emphasizing the urgent need for new countermeasures. The review covers: epidemiology and global spread patterns across five phylogenetic clades, molecular mechanisms of antifungal resistance (ERG11 mutations, efflux pump overexpression, FKS1 mutations), virulence factors enabling colonization and infection, challenges in clinical diagnosis and species identification, and current treatment options with their limitations. The authors argue that the combination of multidrug resistance, healthcare transmission, environmental persistence, and limited therapeutic options creates a "perfect storm" requiring coordinated global action including enhanced surveillance, infection control, and accelerated drug development.

---

## NCBI Resources

### 10. NCBI Taxonomy Browser

**Source**: NCBI Taxonomy ID 498019 (*Candidozyma auris*).

**Summary**: The NCBI Taxonomy Browser entry for *C. auris* (txid498019) provides the authoritative taxonomic classification and nomenclature for this species. Notably, the species has undergone taxonomic revision: formerly classified as *Candida auris*, it is now officially *Candidozyma auris* following phylogenetic reclassification of the Metschnikowiaceae family. The taxonomy entry links to all associated sequence data in GenBank, SRA, and other NCBI databases, including 27,201 SRA runs across 237 BioProjects. The entry documents synonyms, type strain information, and the complete taxonomic lineage from Fungi kingdom through Saccharomycetes class to the species level.

---

### 11. Reference Genome - GCA_002759435.3

**Source**: NCBI Assembly GCA_002759435.3 (*Candidozyma auris* B8441 V3).

**Summary**: The B8441 reference genome assembly (GCA_002759435.3) represents the standard reference for *C. auris* genomic analyses. This third version assembly provides chromosome-level scaffolds with 5,593 annotated genes across approximately 12.4 Mb. The B8441 strain belongs to Clade I (South Asian) and was isolated from a patient in Pakistan. This assembly is used by BRC-Analytics and most recent *C. auris* studies, though annotation version differences (6-digit vs 5-digit gene ID suffixes) between assembly versions create challenges for cross-study comparisons. The assembly includes coding sequences, gene annotations in GTF/GFF format, and protein sequences essential for RNA-seq alignment and quantification.

---

### 12. NCBI SRA and BioProject

**Sources**: BioProject PRJNA904261 (Santana), PRJNA1086003 (Wang).

**Summary**: The NCBI Sequence Read Archive (SRA) and BioProject databases contain all raw sequencing data for the two studies re-analyzed in this work. PRJNA904261 (Santana et al.) contains 6 RNA-seq runs representing 3 conditions (AR0382 wild-type, AR0387 poor adhesion, tnSWI1 mutant) with 2 biological replicates each. PRJNA1086003 (Wang et al.) contains 13 RNA-seq runs: 6 *in vitro* samples (3 AR0382 + 3 AR0387) and 7 *in vivo* infection samples (3 AR0382 + 4 AR0387). Both BioProjects include sample metadata enabling experimental design reconstruction. SRA data is directly accessible through BRC-Analytics for streamlined workflow execution.

---

## Literature Survey Methodology

### 13. Comprehensive *C. auris* RNA-seq Survey

**Source**: https://github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_survey

**Summary**: This survey compiled 32 unique *C. auris* RNA-seq publications (2018-2025) using three independent search strategies: NCBI GEO database mining, Claude-assisted PubMed/Europe PMC searches, and ChatGPT-assisted searches. The survey revealed important patterns: 75% of studies use the B8441 reference genome (GCA_002759435 family) but with varying annotation versions; a consensus bioinformatics pipeline has emerged (HISAT2 62.5%, DESeq2 68.8%, HTSeq 37.5%); research focuses primarily on drug resistance (34.4%), stress responses (18.8%), and biofilm formation (12.5%). Peak publication year was 2021 with 11 papers. The survey also revealed that independent AI-assisted searches had 0% overlap despite querying identical databases on the same date, highlighting how search strategy impacts literature discovery.

---

### 14. Finding *C. auris* in Metagenomic Repositories

**Citation**: "Finding Candida auris in public metagenomic repositories." PMC10798454 (2024).

**Summary**: This collaborative study between CDC, NCBI, and GridRepublic developed MetaNISH (Metagenomic Needles In Sequence Hay), a pipeline for identifying *C. auris* in public metagenomic datasets. Scanning approximately 300,000 metagenomic samples from 2010-2022, researchers identified five datasets containing *C. auris* sequences: wastewater drains and urban river samples from Delhi, India; skin swabs from U.S. healthcare facility residents; human stool samples from Hong Kong (unexpected finding); and laboratory enrichment cultures. The pipeline uses SRPRISM alignment with optimized score thresholds to separate positive and negative samples. A prospective monitoring system now screens approximately 925 new SRA submissions daily. These findings support environmental reservoir hypotheses and suggest community transmission pathways beyond healthcare settings.

---

## Genome Sequencing and Phylogenomics

### 15. Benchmark Genome Dataset

**Citation**: "*Candida auris* Whole-Genome Sequence Benchmark Dataset for Phylogenomic Pipelines." PMID: 33809682 (2021).

**Summary**: Researchers from CDC's Mycotic Diseases Branch created a benchmark dataset of 23 *C. auris* whole genomes to standardize phylogenomic analyses across international surveillance networks. The dataset represents a polyclonal phylogeny with three distinct subclades, supported by genomic, phylogenetic, and epidemiological data. This benchmark enables laboratories worldwide to validate their genomic analysis methods and ensure consistent results across different analytical approaches. The standardized reference facilitates trustworthy communication between national and international surveillance partners tracking *C. auris* outbreaks, addressing a critical need for consistent genomic surveillance of this multidrug-resistant pathogen.

---

### 16. Complete Genome Assemblies

**Citation**: "Complete genome assembly of Candida auris representative strains of three geographical clades." *Microbiology Resource Announcements* (2023).

**Summary**: This resource announcement describes complete, chromosome-level genome assemblies for representative *C. auris* strains from three major geographical clades: B11103 (Clade I, South Asian), B11221 (Clade III, South African), and B11244 (Clade IV, South American). These high-quality assemblies used long-read sequencing technologies to resolve repetitive regions and provide complete chromosome structures. The assemblies serve as clade-specific references for comparative genomics, enabling researchers to study clade-specific genomic features, structural variations, and evolutionary relationships. Complete assemblies are essential for accurate variant calling and understanding the genomic basis of phenotypic differences between clades.

---

### 17. Fifth Clade Discovery

**Citation**: "Confirmation of fifth Candida auris clade by whole genome sequencing." PMID: 36154919. PMC9586689 (2022).

**Summary**: This study confirmed the existence of a fifth phylogenetic clade of *C. auris* through comprehensive whole-genome sequencing analysis. While four clades (I-IV) were previously established corresponding to South Asian, East Asian, South African, and South American origins, isolates from Iran showed distinct genomic signatures warranting designation as Clade V. The fifth clade demonstrates unique patterns of antifungal susceptibility and virulence factor expression. This discovery has implications for epidemiological surveillance, as clade identification helps track transmission patterns and predict resistance profiles. The study emphasizes that *C. auris* continues to diversify, potentially through independent emergence events from environmental reservoirs.

---

## Additional High-Impact Publications (from Survey)

### 18. Nature Microbiology - Host Immune Response (2020)

**Citation**: Host PBMC response study. PMID: 32839538. GEO: GSE154911.

**Summary**: This study employed QuantSeq 3' mRNA-seq to characterize the human peripheral blood mononuclear cell (PBMC) response to *C. auris* infection. Researchers compared transcriptional responses to *C. auris* versus other Candida species including *C. albicans* and *C. glabrata*. The analysis revealed both conserved antifungal responses and *C. auris*-specific immune evasion mechanisms. Key findings include altered cytokine profiles, modified inflammasome activation patterns, and differential recognition by pattern recognition receptors. The study provides insights into why *C. auris* infections may be particularly difficult to clear and identifies potential immunotherapeutic targets. The GEO dataset enables reanalysis of host-pathogen interactions at the transcriptional level.

---

### 19. Nature Microbiology - LncRNA DINOR (2021)

**Citation**: LncRNA DINOR virulence study. PMID: 34083769. GEO: GSE171261.

**Summary**: This pioneering study identified the first functional long non-coding RNA (lncRNA) in *C. auris*, designated DINOR (Drug-Induced NOn-coding RNA). DINOR expression is induced by antifungal drug exposure and contributes to drug tolerance and virulence. The study demonstrates that DINOR regulates genes involved in drug efflux, cell wall integrity, and stress responses. Deletion of DINOR increased susceptibility to azole antifungals and reduced virulence in animal infection models. This discovery expands understanding of *C. auris* gene regulatory networks beyond protein-coding genes and suggests lncRNAs as potential therapeutic targets. The work represents a methodological advance in applying lncRNA analysis to fungal pathogens.

---

### 20. Nature Communications - Multidrug Resistance (2018)

**Citation**: Muñoz JF et al. Multidrug resistance across clades. PMID: 30559369. BioProject: PRJNA445471.

**Summary**: This comprehensive genomic study examined *C. auris* across four clades and related species to understand multidrug resistance mechanisms. Key findings include: expanded families of drug transporters and lipase enzymes, mutations and copy number variations in ERG11 (azole resistance), and lineage-specific expansions in oligopeptide and siderophore iron transporters. Tandem duplications of eight transporter genes on chromosome 6 suggest mechanisms for nutrient acquisition and drug efflux. The study revealed that most mating and meiosis genes are conserved, indicating potential for sexual reproduction and genetic exchange. Notably, *C. auris* clusters phylogenetically with *C. haemulonii* clade species rather than *C. albicans* or *C. glabrata*, yet all demonstrate multidrug resistance, suggesting convergent evolution of resistance mechanisms.

---

### 21. PLOS Pathogens - Single-cell RNA-seq (2024)

**Citation**: First scRNA-seq in *C. auris*. PMID: 38745637.

**Summary**: This study represents the first application of single-cell RNA sequencing (scRNA-seq) to *C. auris*, revealing unprecedented cellular heterogeneity within fungal populations. The analysis identified distinct transcriptional states including drug-tolerant persister cells, biofilm-forming subpopulations, and cells with enhanced invasive potential. Key findings include characterization of IL-1R-mediated immune evasion mechanisms and identification of cell subpopulations that differentially evade host immune responses. The scRNA-seq approach revealed that bulk RNA-seq masks important biological variation, as rare cell populations with distinct phenotypes would be averaged out in conventional analyses. This methodological advance enables study of fungal population dynamics during infection.

---

### 22. Cell Reports - White-Brown Switching (2025)

**Citation**: Phenotypic switching study. PMID: 37925028.

**Summary**: This study investigates the white-brown phenotypic switching phenomenon in *C. auris*, analogous to white-opaque switching in *C. albicans*. Researchers identified transcriptional regulators controlling the switch between smooth (white) and aggregative (brown) colony morphologies. Brown-phase cells showed enhanced biofilm formation, drug tolerance, and skin colonization capacity. RNA-seq analysis revealed hundreds of differentially expressed genes between phases, including cell wall proteins, adhesins, and metabolic enzymes. The study demonstrates that phenotypic switching represents an adaptive strategy enabling *C. auris* to optimize fitness for different environmental niches---smooth cells for bloodstream dissemination, aggregative cells for surface colonization. Understanding switching mechanisms may reveal targets for preventing persistent colonization.

---

## Galaxy Platform

### 23. Galaxy Main

**Source**: https://usegalaxy.org

**Summary**: Galaxy Main (usegalaxy.org) is the primary public Galaxy server hosted by the Galaxy Project at Penn State and Johns Hopkins Universities. It provides free access to over 8,000 bioinformatics tools and workflows for researchers worldwide. Galaxy's web-based interface enables reproducible analyses without command-line expertise, while maintaining full provenance tracking through analysis histories. For this study, Galaxy histories containing complete analysis workflows are publicly accessible: Santana et al. analysis at https://usegalaxy.org/u/cartman/h/prjna904261-final. Galaxy histories capture all tool versions, parameters, and intermediate files, enabling exact reproduction of published analyses. The platform supports data import directly from NCBI SRA, facilitating seamless workflow execution on public datasets.

---

### 24. BRC-Analytics Platform

**Source**: https://brc-analytics.org

**Summary**: BRC-Analytics (Bacterial and Viral Bioinformatics Resource Center - Analytics) provides standardized bioinformatics workflows for pathogen genomics research. Built on the Galaxy platform, BRC-Analytics offers curated reference genomes with explicit version control, pre-configured analysis workflows from the Intergalactic Workflow Commission, and direct data import from public repositories. For fungal pathogens like *C. auris*, BRC-Analytics provides the B8441 reference genome (GCA_002759435.3) and RNA-seq workflows enabling differential expression analysis with defined tool versions. The platform addresses reproducibility challenges in pathogen genomics by specifying exact references, tools, and parameters, enabling researchers to compare results across studies with confidence in methodological consistency.

---

## Software and Tools

### 25. DESeq2

**Version**: 2.11.40.8+galaxy0

**Summary**: DESeq2 is the predominant differential expression analysis tool for RNA-seq count data, used in 68.8% of surveyed *C. auris* studies. The method uses a negative binomial generalized linear model with shrinkage estimation for dispersions and fold changes. Key features include: size factor normalization to account for sequencing depth differences, independent filtering to increase detection power, and Benjamini-Hochberg FDR correction for multiple testing. DESeq2's approach of sharing information across genes through empirical Bayes shrinkage is particularly valuable for experiments with few replicates, common in pathogen studies. The Galaxy-wrapped version provides identical results to command-line R execution while enabling GUI-based analysis with full reproducibility.

---

### 26. STAR Aligner

**Summary**: STAR (Spliced Transcripts Alignment to a Reference) is a splice-aware aligner used in 25-31% of *C. auris* RNA-seq studies. STAR uses a two-pass mapping approach: the first pass identifies novel splice junctions, which are then used in the second pass for more accurate alignment. Key advantages include exceptional speed (often 10-100x faster than alternatives), high sensitivity for detecting novel transcripts, and accurate handling of reads spanning multiple exons. For fungal genomes with fewer introns than mammalian genomes, STAR's splice-awareness remains valuable for accurate gene-level quantification. STAR generates alignment files (BAM) compatible with downstream quantification tools like featureCounts.

---

### 27. HISAT2

**Summary**: HISAT2 (Hierarchical Indexing for Spliced Alignment of Transcripts 2) is the dominant aligner for *C. auris* RNA-seq, used in 62.5% of surveyed studies. HISAT2 uses a hierarchical indexing scheme combining a global FM index with many local indexes, enabling efficient alignment with low memory requirements. The algorithm excels at aligning reads across splice junctions while maintaining computational efficiency. Compared to STAR, HISAT2 typically requires less RAM, making it accessible on standard workstations. The tool is maintained as part of the Johns Hopkins computational biology suite and integrates well with downstream analysis pipelines including StringTie for transcript assembly and featureCounts/HTSeq for quantification.

---

### 28. HTSeq / featureCounts

**Summary**: HTSeq-count and featureCounts are gene-level quantification tools that count aligned reads overlapping genomic features. HTSeq-count, used in 37.5% of surveyed studies, provides strict handling of ambiguously mapped reads with multiple counting modes (union, intersection-strict, intersection-nonempty). featureCounts, used in 12.5% of studies, offers faster performance through multithreading and built-in support for paired-end reads. Both tools require gene annotation files (GTF/GFF) matching the reference genome version used for alignment. Output count matrices serve as input for differential expression analysis with DESeq2 or edgeR. Consistent use of quantification tools and annotation versions is critical for reproducible results across studies.

---

### 29. FastQC

**Summary**: FastQC provides comprehensive quality assessment of high-throughput sequencing data, used in 73% of surveyed *C. auris* studies for quality control. The tool evaluates multiple quality metrics: per-base sequence quality scores, GC content distribution, sequence duplication levels, adapter contamination, and overrepresented sequences. FastQC reports enable identification of problematic samples before downstream analysis, preventing propagation of quality issues through the pipeline. Common issues detected include adapter sequences requiring trimming, quality score drops at read ends, and GC content anomalies indicating contamination. FastQC runs quickly on large datasets and produces HTML reports for easy interpretation.

---

## Analysis Scripts and Repositories

### 30. Local Analysis Repositories

**Source**: https://github.com/nekrut/claude-projects/tree/main/rnaseq/

**Summary**: The analysis repositories contain all code, intermediate files, and documentation for the *C. auris* literature survey and validation re-analyses. The Cauris_rna_seq_survey directory includes Python scripts for data combination (analyze_combined_data.py), visualization (visualize_combined.py), and the complete literature survey with 32 papers. The santana24_PRJNA904261 and wang24_PRJNA1086003 directories contain analysis reports (ANALYSIS_REPORT.md), gene mapping tables reconciling annotation versions, validation plots comparing published and re-analyzed results, and Galaxy workflow diagrams. All repositories use version control enabling exact reproduction of analyses. The LFC-based correlation mapping scripts demonstrate the approach used to reconcile gene identifiers between annotation versions, achieving R² > 0.98 correlation with published results.

---

## Summary Statistics from Literature Survey

- **Total unique papers**: 32
- **Date range**: 2018-2025
- **Peak year**: 2021 (11 papers, 34.4%)
- **B8441 genome usage**: 75% of studies
- **Tool consensus**: HISAT2 (62.5%), DESeq2 (68.8%), HTSeq (37.5%)
- **Research focus**: Drug resistance (34.4%), Stress response (18.8%), Biofilm (12.5%)

---

*Last updated: December 4, 2025*
