# adv-bioi-finalproject
## Sidra Sohail 
## Benchmarking and testing three tools that analyze microbial data
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
