
setwd('~/Desktop/100_Thesis/100_datafile/')
#download.file('ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/eukaryotes.txt','eukaryotes.txt')
infile='eukaryotes_release.txt'
d <- read.table(infile, header=TRUE, sep='\t', fill=TRUE)
head(d)

d$year <- as.numeric(sapply(strsplit(as.character(d$Release.Date), "/"), "[", 1))

pdf(paste0(infile,'.pdf'),height=5,width=7.5)

length(d$year)

library('ggplot2')
library(plyr)

d1 <- (d[,c(2,4)])

d2 <- d1[complete.cases(d1),]

d3 <- count(d2)

d2$Group <- factor(d2$Group, levels = c("Animals","Plants","Fungi","Protists","Other"))

hist_cut <- ggplot(d2, aes(x=year, fill=Group, order=Group))+theme_bw()
hist_cut + geom_bar(binwidth=1,width=10)  # defaults to stacking


dev.off()

