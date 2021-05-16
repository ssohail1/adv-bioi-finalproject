#!/bin/bash
mothur "#make.contigs(file=stability.files, processors=2);summary.seqs(fasta=stability.trim.contigs.fasta);screen.seqs(fasta=stability.trim.contigs.fasta, group=stability.contigs.groups, summary=stability.trim.contigs.summary, maxambig=0, maxlength=275);get.current();summary.seqs(fasta=stability.trim.contigs.good.fasta);unique.seqs(fasta=stability.trim.contigs.good.fasta);count.seqs(name=stability.trim.contigs.good.names, group=stability.contigs.good.groups);summary.seqs(count=stability.trim.contigs.good.count_table);align.seqs(fasta=stability.trim.contigs.good.unique.fasta, reference=silva.nr_v138_1.align);summary.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table);screen.seqs(fasta=stability.trim.contigs.good.unique.align, count=stability.trim.contigs.good.count_table, summary=stability.trim.contigs.good.unique.summary, start=13862, end=23444);summary.seqs(fasta=current, count=current);filter.seqs(fasta=stability.trim.contigs.good.unique.good.align, vertical=T, trump=.);unique.seqs(fasta=stability.trim.contigs.good.unique.good.filter.fasta, count=stability.trim.contigs.good.good.count_table);pre.cluster(fasta=stability.trim.contigs.good.unique.good.filter.unique.fasta, count=stability.trim.contigs.good.unique.good.filter.count_table, diffs=2);chimera.vsearch(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.count_table, dereplicate=t);remove.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.fasta, accnos=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.accnos);summary.seqs(fasta=current, count=current);classify.seqs(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, reference=trainset18_062020.pds.fasta, taxonomy=trainset18_062020.pds.tax, cutoff=80);remove.lineage(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.count_table, taxonomy=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota);summary.tax(taxonomy=current, count=current);seq.error(fasta=stability.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.fasta, count=stability.trim.contigs.good.unique.good.filter.unique.precluster.denovo.vsearch.pick.pick.count_table, reference=silva.nr_v138_1.align, aligned=F)
