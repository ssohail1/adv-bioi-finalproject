# adv-bioi-finalproject
## Sidra Sohail 
## DADA2, mothur, and USEARCH: Benchmarking and testing three tools that analyze microbial data
### Background
The microbiome is a collection of bacteria that reside in tissues where in cancer it has been implicated in a variety of tissues, and specifically distinct microbial communities have been linked to different types of cancers [[Hieken et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4971513/)] . The association of microbial communities to human health has prompted researchers to investigate the microbial ecology of various tissues leading to a surplus of microbial data. This in turn has led to the development of various software and tools that can analyze microbial data and disentangle the biological variation from amplicon sequencing errors [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)]. However, with a plethora of tools available, it is important to test and benchmark the performance of the most widely used software. Some of the most widely used
tools for analyzing microbial data include DADA2 [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)], mothur [[Schloss et al.](https://aem.asm.org/content/75/23/7537)], QIIME [[Caporaso et al.](https://www.nature.com/articles/nmeth.f.303)], and USEARCH [[Edgar](https://academic.oup.com/bioinformatics/article/26/19/2460/230188)]. Here I test and benchmark the performance of DADA2 [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)], mothur [[Schloss et al.](https://aem.asm.org/content/75/23/7537)], and USEARCH [[Edgar](https://academic.oup.com/bioinformatics/article/26/19/2460/230188)], and I show that DADA2 [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)] is the most straightforward tool to use and can efficiently graph various plots. I found that DADA2 [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)] is the most well-documented and graphs can be made easily in R through the phyloseq pipeline and ggplot2 package, and there is no need for an external program to plot data. DADA2 [[Callahan et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4927377/)] is a widely used tool and I anticipate that it will be more commonly used in future microbial analyses. The test data is from the [_Microbial Dysbiosis Is Associated with Human Breast Cancer_ paper by Xuan et al.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0083744#s5) and can be downloaded from the SRA using this accession number PRJEB4755.
### Packages and software to install before running
Bash: [mothur version 1.45.3](https://github.com/mothur/mothur/releases/tag/v1.45.3), [usearch 32-bit version 11](https://www.drive5.com/usearch/download.html)  
R: Bioconductor, dada2, phyloseq, Biostrings, ggplot2

### Files in repo
- dada2 folder:
  - Xuan_subdata-Rcode.R: Rscript for running [DADA2 pipeline](https://benjjneb.github.io/dada2/tutorial_1_8.html)
- mothur folder:
  - Xuandata-mothurscript_1.sh: bash script for running [mothur MiSeq SOP](https://mothur.org/wiki/miseq_sop/) upto seq.error command
  - Xuandata-mothurscript_2.sh: bash script for running [mothur MiSeq SOP](https://mothur.org/wiki/miseq_sop/) starting from dist.seqs upto classify.otu command
- usearch folder:
  - Xuandata-usearchscript.sh: bash script for running [USEARCH MiSeq 2x250 16S V4 pipeline](https://drive5.com/usearch/manual/ex_miseq.html)

### How to use
Clone repository into personal directory using this command,  
`git clone https://github.com/ssohail1/adv-bioi-finalproject.git`

To move into adv-bioi-finalproject directory use `cd`,  
`cd adv-bioi-finalproject`

Running the scripts: `--verbose time` provides memory and time usage by the tool  
Run dada2 Rscript: `/usr/bin/time --verbose time nohup Rscript Xuan_subdata-Rcode.R` nohup creates an out file with output of each command  
Run mothur script: `/usr/bin/time --verbose ./Xuandata-mothurscript_1.sh` and then `/usr/bin/time --verbose ./Xuandata-mothurscript_2.sh` set permissions by `chmod 755 mothurscript.sh`  
Run usearch script: `/usr/bin/time --verbose ./Xuandata-usearchscript.sh`  

Generating visual outputs:  
Visual outputs available in the output folder of each tool directory  
dada2: in R through phyloseq and ggplot2  
mothur: through [MicrobiomeAnalyst](https://www.microbiomeanalyst.ca/MicrobiomeAnalyst/upload/OtuUploadView.xhtml) by inputting otu table, taxonomy file, and metadata file under mothur output section  
usearch: through otutab_octave in form of html or svg formats
