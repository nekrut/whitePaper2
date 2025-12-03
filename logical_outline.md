# Problem and Goal


The purpose of this file is to create overall logic for a while paper demonstrating the utility of https://brc-analytics.org in analysis of RNA-seq for fungal pathogens. 

As an example species we selected *Candidozyma auris* (NCBI:txid498019) --- an emerging human fungal pathogen. In was first described in https://pubmed.ncbi.nlm.nih.gov/19161556/.  

The paper should consist of the following sections:

- **Introduction** - states the problem, proposes a solution, and briefly describes what was done.
- **Results and discussion** - explains in details what was done, states implications, describes limitations, and outline the future work.
- **Materials and methods** - provides a detailed explanation of what was done. Lists exact version and source for every dataset, tool, or workflow used. Provides explanation and links to any scripts used and explanation on how the entire analysis can be replicated.
- **References** - a list of all manuscripts, github repositories and any other resources used or mentioned in the manuscript.  '

Below are instructions on how to perform research and write each section of the paper. You should "think hard" about research and writing of each section. Keep track of all references in a separate REFERENCES.md file. Do not use superficial language. Be precise, clear, and as succinct as possible.  

## Introduction

Each bullet point in this section corresponds to a paragraph. If you identify gaps or issues during you research phase while gathering data to write the paragraph - create a question which I will answer as we iterate through writing this manuscript. 

- **This paragraph should state why "C. auris is an important pathogen and growing public health issue worldwide and in the US specifically**. Read the paper describing the first human case involving C. auris = https://pubmed.ncbi.nlm.nih.gov/19161556/. Consult CDC and NIAID websites for information about C. auris and why it is considered a high priority pathogen. Summarize in a first paragraph. This paragraph should inform readers why C. auris is an important subject of research. 
- **This paragraph should state that majority of publicly available C. auris data is RNAseq data**. Survey the content of NCBI SRA for NCBI:txid498019. The goals is this analysis is to demonstrate that the bulk of sequencing data generated for C. auris is RNAseq data. Write a paragraph providing high level description (and one figure) of the SRA data for C. auris. The paragraph should state the since RNAseq data accounts for majority (check if this is actually true and if not, let me know) of the C. auris data this is important methodology and this is why this paper is focusing on it.
- **This paragraph should state that RNAseq analysis of C. auris data is complicated by lack of standardization and that it is often unclear what reference genomes and tools are used**. Consult analysis done in https://github.com/nekrut/claude-projects/tree/main/rnaseq/Cauris_rna_seq_surve (Use local clone of this repo if available). Focus on geo data and data that was NOT pulled with ChatGPT. You should provide a summary of what genome versions and tools were used in the papers referenced in this repo and create a single figure. Write a transition stating that because of these issues with reference genomes and tools standardizing C. auris genome analyses (and fungal genome analyses in general) wiull benefit the entire field. This is what brc-analytics.org was designed for.
- **This paragraph should state that BRC-analytics can be used for launching best-practice workflows on C. auris data using precise versions of reference genomes and tools**.  Explain that we wanted to demonstrate utility of BRC-analytics by (1) selecting latest papers utilizing RNAseq data and (2) starting analyses in BRC-analytics using defined reference genome and analyzing it using an IWC (https://iwc.galaxyproject.org) workflows. Take you time examining IWC and include a couple of sentences describing it. Again, this paragraph should emphasize that we re-analyze the data from two papers and demonstrate that our results are essentially identical. Briefly describe the papers and how they use RNAseq. The first paper is in https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261 and the second is in https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003. Use local clones of these repos if available.  

## Results and discussion

Similarly to above each bullet point in this section corresponds to a paragraph with the Results and discussion section. If you identify gaps or issues during you research phase while gathering data to write the paragraph - create a question which I will answer as we iterate through writing this manuscript. 

- **This paragraph should explain how you get data from BRC-analytics** - I will write it myself. So just put this as a placeholder.
- **This paragraph should explain how you mapped contents of the two papers to SRA metadata to identify differential expressions contrasts** - take your time to read and understand /analysis folders in https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261 and https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003. Describe how to inferred which SRA accessions correspond to which samples and how you re-organized Galaxy's collections to prepare differential expression run with DeSeq2. The paragraph can be divided into two pragraphs: one corresponding to santana24_PRJNA904261  and the other to wang24_PRJNA108600.
- **This  paragrath should explain analysis and interpretation of our DeSeq2 analysis of the data from two papers**. Take your time to read and understand /analysis folders in https://github.com/nekrut/claude-projects/tree/main/rnaseq/santana24_PRJNA904261 and https://github.com/nekrut/claude-projects/tree/main/rnaseq/wang24_PRJNA1086003. Describe that you found differentially expressed genes, but they did no match genes descriebd in the paper. Explain how you figured out how to match gene ids to previous genome annotation used in the papers. 
- **This paragraph should discuss the findings, highlight limitations, and propose future steps**. Explain that in this case the use of AI and LLMs can be directly validated against results already presented in the papers. Essentially in this case we already know what the truth is. If you are doing new RNAseq you do not know a priory what the result will be so you have to be careful trusting AI interpretation. Consult https://zenodo.org/records/3985047 and do additional research to propose strategies for validating an interpreting RNAseq data.

## Materials and methods

Document all steps of the research, analysis, and writing here.


