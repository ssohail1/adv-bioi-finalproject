#Adapted from http://drive5.com/usearch/manual/ex_miseq.html

#!/bin/bash
#Merge files
./usearch -fastq_mergepairs *1_primer*.fastq -reverse *2_primer*.fastq -fastqout allmerged.fastq #change "primer.fastq" to format of fastq file

# Quality filter
./usearch -fastq_filter allmerged.fastq -fastq_maxee 1.0 \
	          -fastaout filtered.fa -relabel Filt

# Find unique read sequences and abundances
./usearch -fastx_uniques filtered.fa -sizeout -relabel Uniq -fastaout uniques.fa

# Make 97% OTUs and filter chimeras
./usearch -cluster_otus uniques.fa -otus otus.fa -relabel Otu

# Denoise: predict biological sequences and filter chimeras
./usearch -unoise3 uniques.fa -zotus zotus.fa

##################################################
# Downstream analysis of OTU sequences & OTU table
# Can do this for both OTUs and ZOTUs, here do
# just OTUs to keep it simple.
##################################################

# Make OTU table
./usearch -otutab allmerged.fastq -otus otus.fa -otutabout otutab_raw.txt

# Normalize to 5k reads / sample
#./usearch -otutab_norm otutab_raw.txt -sample_size 5000 -output otutab.txt

./usearch -otutab allmerged.fastq -otus otus.fa  -otutabout otutab.txt -sample_delim . -sizeout


# Alpha diversity
./usearch -alpha_div otutab.txt -output alpha.txt

# Make OTU tree
#./usearch -cluster_aggd otus.fa -treeout otus.tree

# Beta diversity
#mkdir beta/
#./usearch -beta_div otutab.txt -tree otus.tree -filename_prefix beta/

# Rarefaction
#./usearch -alpha_div_rare otutab.txt -output rare.txt

# Predict taxonomy; change "rdp_16s_v16.fa" to reference file
./usearch -sintax otus.fa -db rdp_16s_v16.fa -strand both \
	          -tabbedout sintax.txt -sintax_cutoff 0.8

# Taxonomy summary reports
./usearch -sintax_summary sintax.txt -otutabin otutab.txt -rank g -output genus_summary.txt
./usearch -sintax_summary sintax.txt -otutabin otutab.txt -rank p -output phylum_summary.txt

#Calculate distance matrix
./usearch -calc_distmx otus.fa -tabbedout mx.txt -maxdist 0.2 -termdist 0.3

#Octave plots
./usearch -otutab_octave otutab.txt -distmxin mx.txt -noxtalk   -htmlout octave.html -svgout octave.svg

