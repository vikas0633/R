d <- read.table('~/Desktop/07_degradome/20130826_merged.bam.annot.sRNAmap_allSite_allsRNA_10-11_1000', header = F)
head(d)

d_sites <- d[,c(1,8:ncol(d))]
d_sites_means <- colMeans(d_sites[,c(2:ncol(d_sites))])

names(d_sites_means) <- c(-100:100) 
barplot(d_sites_means, col = 'lightblue', main = "All sites RNAs 10-10 ", xlab="flanking region", ylab="Fraction of read abundance")




d <- read.table('~/Desktop/07_degradome/20130826_merged.bam.annot.sRNAmap_allSite_allmiRNA_9-12_f5000.sign', header = F)