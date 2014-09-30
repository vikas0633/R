
setwd('~/Desktop/100_Thesis/100_datafile/')
infile='eukaryotes.gene.txt'
d <- read.table(infile, header=TRUE, sep='\t', fill=TRUE)
head(d)


pdf(paste0(infile,'.pdf'),height=5,width=7.5)

library('ggplot2')

d <- d[complete.cases(d),]


d$Group <- factor(d$Group, levels = c("Animals","Plants","Fungi","Protists","Other"))

library(ggplot2)
# producing some data
# initiating a plot

p <- ggplot(d, aes(x=Size.in.Mb,y=Genes))
# making the size dynamic
p + geom_point(aes(col=Group))+theme_bw()+ geom_smooth(aes(group=Group,col=Group), method="lm", fullrange=FALSE, se = FALSE, lwd=1)+xlab("Genome Size (in Mb)") + ylab("Gene Count")

dev.off()

