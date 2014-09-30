setwd('~/Desktop/03_Lotus_annotation/2013_week50/')
infile="20131219_500kb_LD.geno.ld.chr1-6.31.w100.s100"
pdf(paste0(infile,'.pdf'),height=10,width=20)
d<-read.table(infile)
names(d)<-c("chr","pos","R2")

infile2='20131219_500kb_LD.geno.ld.chr1-6.31.1000000'
d2<-read.table(infile2)
names(d2)<-c("chr","pos","R2")


library(ggplot2)
require(mgcv)
d2 <- d2[1:200000,]
ggplot(d, aes(x=pos, y=R2, col=chr)) + geom_point(data=d2, col='gray60',size=1) +theme_classic() + xlim(0,200000)+ stat_smooth(method = "loess", formula = y ~ x, colour="#CC0000", size = 3,  span = 0.001, se = FALSE)

#d2 <- d2[1:200000,]

#ggplot(d2, aes(x=pos, y=R2, col=chr)) +theme_classic() + xlim(0,200000) +ylim(0,1)+ geom_point(data=d2, aes(x=pos, y=R2, col=gray),size=1.0) + stat_smooth(method = "loess", formula = y ~ x, colour="#CC0000", size = 3,  span = 0.02, se = FALSE) 

#smoothScatter(d2$pos, d2$R2)

#plot(d2$pos, d2$R2)

dev.off()
