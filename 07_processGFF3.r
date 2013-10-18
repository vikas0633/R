### load the data
d <- read.table('~/Desktop/03_Lotus_annotation/lj30/20130802_Lj30.gff3', sep='\t')
head(d)

### get the genes
d_gene <- d[which(d$V3=="gene" & d$V2=="protein_coding"),]
dim(d_gene)

### calculate average length
mean(d_gene$V5-d_gene$V4)
log10(mean(d_gene$V5-d_gene$V4))

### get the genome size
#perl ~/Desktop/script/perl/CountFasta.pl lj_r30.fa
log10(447.516816)