d <- read.table('~/Desktop/07_degradome/2013/20130826_merged.bam.annot.sRNAmap_allSite_allmiRNA_9-12_f100.sign', header = F)
head(d)

d_sites <- d[,c(1,8:ncol(d))]
d_sites_means <- colMeans(d_sites[,c(2:ncol(d_sites))])

names(d_sites_means) <- c(-100:100) 
b <- barplot(d_sites_means, col = 'lightblue', main = "All sites RNAs 9-12 ", xlab="flanking region", ylab="Fraction of read abundance")



mp <- barplot(d_sites_means, axes = FALSE, axisnames = FALSE)

axis(2)
axis(1, at = mp, labels = seq(-100,100,1), cex.axis = 0.6)


barplot(d_sites_means)

barplot(d_sites_means, names.arg = names(d_sites_means))

write.table(d_sites_means,'~/Desktop/07_degradome/2013/20130826_merged.bam.annot.sRNAmap_allSite_allmiRNA_9-12_f100.sign.txt')
