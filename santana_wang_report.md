# Validation of *Candida auris* RNA-seq Studies Using Galaxy-Based Reanalysis

## Approach and General Logic

To assess the reproducibility of published RNA-seq analyses, we reanalyzed raw sequencing data from two recent *Candida auris* studies using Galaxy's standardized RNA-seq workflow. Our validation targeted Santana et al. (2023), which identified the novel *C. auris*-specific adhesin SCF1 as a key factor in surface colonization, and Wang et al. (2024), which characterized the functional redundancy between adhesins Als4112 and Scf1 in mediating cell aggregation.

The validation strategy consisted of four steps: retrieval of raw FASTQ files from the Sequence Read Archive, processing through a standard Galaxy RNA-seq pipeline (fastp for quality control, STAR for alignment, and featureCounts for quantification), differential expression analysis using DESeq2 with identical comparison groups to those published, and systematic comparison of log2 fold changes against published supplementary data.

A notable technical challenge arose from differences in genome annotation versions. Both published studies used an older *C. auris* annotation with 6-digit gene ID suffixes (e.g., B9J08_001458), while the current Galaxy reference genome (GCA_002759435.3) uses 5-digit suffixes (e.g., B9J08_03708). We resolved this through LFC-based correlation mapping, leveraging the observation that genes produce nearly identical fold changes across annotation versions, enabling unambiguous mapping by matching LFC values between datasets. Validation success was assessed using Pearson correlation coefficients, direction agreement (percentage of genes showing the same regulatory direction), and mean absolute LFC differences.

## Santana et al. (2023) Analysis

Santana et al. published "A *Candida auris*-specific adhesin, Scf1, governs surface association, colonization, and virulence" in *Science* (BioProject [PRJNA904261](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA904261)). The study compared three strains: AR0382, a wild-type highly adhesive Clade I isolate; AR0387, a poorly adhesive clinical isolate; and AR0382_tnSWI1, a transposon mutant with disrupted SWI1, a chromatin remodeling factor. Each strain was sequenced in duplicate.

We replicated two DESeq2 comparisons from the original publication. The first comparison (Fig 1D) examined the tnSWI1 mutant versus wild-type AR0382 to identify genes affected by SWI1 disruption. The second comparison (Fig S5A) contrasted AR0387 against AR0382 to characterize expression differences between adhesive and non-adhesive strains.

Both comparisons yielded excellent validation metrics. For the tnSWI1 comparison, we successfully mapped 1,186 differentially expressed genes and obtained a Pearson correlation of r = 0.9971 (R² = 0.9953) with 99.7% direction agreement. The AR0387 comparison mapped 1,557 genes with r = 0.9883 (R² = 0.9768) and perfect 100% direction agreement.

SCF1, the central finding of the Santana study, emerged as the most strongly downregulated gene in both comparisons. The published analysis reported SCF1 (B9J08_001458) with log2 fold changes of -6.68 (Fig 1D) and -7.25 (Fig S5A). Our reanalysis identified the corresponding gene (B9J08_03708) with log2 fold changes of -6.82 and -7.35, respectively, confirming the paper's key finding with minimal deviation.

![Santana Validation](validation_figures/santana_combined_sidebyside.png)
*Figure S1: Validation of Santana et al. DESeq2 results. Left: tnSWI1 vs AR0382 comparison (Fig 1D). Right: AR0387 vs AR0382 comparison (Fig S5A). Red dashed line indicates perfect correlation (y=x).*

## Wang et al. (2024) Analysis

Wang et al. published "Functional redundancy in *Candida auris* cell surface adhesins crucial for cell-cell interaction and aggregation" in *Nature Communications* (BioProject [PRJNA1086003](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1086003)). This study compared two strains with distinct aggregation phenotypes: AR0382 (B11109), a highly aggregative biofilm-forming strain, and AR0387 (B8441), a non-aggregative strain. RNA-seq was performed under two conditions: in vitro biofilm growth (3 replicates per strain) and in vivo colonization of mouse jugular vein catheters (3 replicates for AR0382, 4 for AR0387).

The published analysis reported 76 differentially expressed genes (DEGs) in the in vitro comparison and 259 DEGs in the in vivo comparison, using thresholds of FDR < 0.01 and |log2FC| >= 1.0. Our reanalysis achieved perfect correlation with the published results. For the in vitro condition, we identified 73 DEGs with Pearson r = 1.0000 and 100% direction agreement across 75 matched genes. The in vivo analysis reproduced all 259 DEGs with identical correlation metrics.

The key adhesin genes highlighted in the paper showed excellent concordance. SCF1 exhibited log2 fold changes of 8.61 (paper) versus 8.67 (our analysis) in vitro, and 4.47 versus 4.53 in vivo. ALS4112 showed similarly close agreement: 5.07 versus 5.08 in vitro, and 2.56 versus 2.56 in vivo. Other adhesin family members (IFF4109), virulence-associated genes (SAP7), and drug resistance genes (MDR1) all matched within 0.01 log2 fold change units.

![Wang Validation](validation_figures/wang_validation_scatter.png)
*Figure S2: Validation of Wang et al. DESeq2 results. Left: In vitro biofilm comparison (n=75 genes). Right: In vivo mouse catheter model (n=259 genes). Red dashed line indicates perfect correlation (y=x). Key adhesin genes SCF1 and ALS4112 are labeled.*

## Summary and Biological Convergence

Both studies achieved excellent validation status, with Santana et al. showing R² > 0.97 across both comparisons and Wang et al. achieving perfect correlation (r = 1.00) in both conditions. These results demonstrate that Galaxy-based reanalysis using standard workflows produces results equivalent to published analyses, and that differential expression patterns are highly reproducible when using the same statistical methods and significance thresholds.

The biological convergence between studies strengthens confidence in the key findings. Santana et al. demonstrated that SCF1 is essential for surface colonization, with its disruption causing greater than 6-fold reduction in expression. Wang et al. independently showed that SCF1 is highly upregulated (greater than 8-fold in vitro) in aggregative strains compared to non-aggregative strains. This convergence across independent studies, different experimental designs, and complementary biological questions establishes SCF1 as a validated virulence factor and potential therapeutic target for *C. auris* infections.

From a technical perspective, this validation demonstrates that different genome annotation versions can be effectively mapped using LFC correlation, enabling retrospective validation of studies that used older reference genomes. Both studies employed consistent statistical thresholds (FDR < 0.01, |log2FC| >= 1.0), facilitating direct comparison of results.

---

*Galaxy histories: [PRJNA904261_Perm](https://usegalaxy.org/u/cartman/h/prjna904261-perm), [PRJNA1086003_Perm](https://usegalaxy.org/u/cartman/h/prjna1086003-perm)*
