setwd('~/Desktop/03_Lotus_annotation/2013_week50/')
infile="20131219_500kb_LD.geno.ld.chr1-6.31.w100.s100"
pdf(paste0(infile,'.1.pdf'),height=10,width=20)
d<-read.table(infile)
names(d)<-c("chr","pos","R2")

infile2='20131219_500kb_LD.geno.ld.chr1-6.31.1000000'
d2<-read.table(infile2)
names(d2)<-c("chr","pos","R2")


library(ggplot2)
require(mgcv)
d2 <- d2[1:200000,]

ggplot(d2, aes(x=pos, y=R2, col=chr)) + geom_point(data=d2, aes(x=pos, y=R2, col=chr),size=1) +theme_classic() + xlim(0,200000) + scale_colour_manual(values=c("gray60")) +ylim(0,1)

dev.off()
pdf(paste0(infile,'.2.pdf'),height=10,width=20)

ggplot(d2, aes(x=pos, y=R2, col=chr)) + stat_smooth(method = "loess", formula = y ~ x, colour="#CC0000", size = 3,  span = 0.02, se = FALSE) +theme_classic() + xlim(0,200000) +ylim(0,1)
#ggplot(d2, aes(x=pos, y=R2, col=chr)) +theme_classic() + xlim(0,200000) +ylim(0,1) + geom_hex(alpha=1,bins = 100) + stat_smooth(method = "loess", formula = y ~ x, colour="#CC0000", size = 3,  span = 0.02, se = FALSE) 
#+ geom_point(data=d2, aes(x=pos, y=R2, col=chr),size=0.5)

#smoothScatter(d2$pos, d2$R2)

#plot(d2$pos, d2$R2)

dev.off()