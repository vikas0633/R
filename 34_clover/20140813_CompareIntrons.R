### script for comparing the intron sizes

### load libraries
library(reshape2)
library(ggplot2)
library(directlabels)
require(graphics)
require(plotrix)
require(reshape2)

### read the data 
d1 <- read.table('~/Desktop/11_clover/04_Comparisions/Occi.Cuff.introns',sep='\t', header=F,quote = "\"'",fill = TRUE)
colnames(d1) <- "Occidentale"
d2 <- read.table('~/Desktop/11_clover/04_Comparisions/Palle.Cuff.introns',sep='\t', header=TRUE,quote = "\"'",fill = TRUE)
colnames(d2) <- "Pallenscens"
summary(d1)
summary(d2)
l <- list (d1[,1],d2[,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)


d1_f <- subset(d1, Occidentale <1000)
d2_f <- subset(d2, Pallenscens <1000)
l <- list (d1_f[,1],d2_f[,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)


d1_f <- subset(d1, Occidentale >= 1000)
d2_f <- subset(d2, Pallenscens >= 1000)
l <- list (d1_f[,1],d2_f[,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)

library(sm)
sm.density.compare(d1[,1],d2[,1])
# Add a legend (the color numbers start from 2 and go up)
legend("topright", levels(d1[,1]), fill=2+(0:nlevels(d1[,1])))

### using qplot
d <- read.table('~/Desktop/11_clover/04_Comparisions/all.introns',sep='\t', header=F,quote = "\"'",fill = TRUE)
colnames(d) <- c("Occi","Palle")
d$id <- row.names(d)
d.long = melt(id.var='id', data=data.frame(d))
qplot(value, fill=variable, data=d.long, geom='density',xlim=c(1000,5000))+ theme_bw()

########################################################
############## Compare including intron pos ############
########################################################
infile="~/Desktop/11_clover/04_Comparisions/20140918_first.intron_10000"
d_occi <- read.table('~/Desktop/11_clover/04_Comparisions/clover.gff3.firstintron',sep='\t', header=F,quote = "\"'",fill = TRUE)
head(d_occi)
d_palle <- read.table('~/Desktop/11_clover/04_Comparisions/pallescens.gff3.firstintron',sep='\t', header=F,quote = "\"'",fill = TRUE)
head(d_palle)

#hist(d_occi[,2], main="Occidentale",xlab="Intron Size", ylab="Frequency", xlim=c(0,5000), breaks=1000, col = "red")
summary(d_occi[,1])
summary(d_palle[,1])

pdf(paste0(infile,'.All.pdf'),height=10,width=20)
l <- list (d_occi[d_occi$V1<10000,1],d_palle[d_palle$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="First introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
dev.off()

pdf(paste0(infile,'larger1000.All.pdf'),height=10,width=20)
l <- list (d_occi[d_occi$V1>1000,1],d_palle[d_palle$V1>1000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="First introns > 1000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
dev.off()

d_occi_plus <- subset(d_occi, V2==1)
d_palle_plus <- subset(d_palle, V2==1)
summary(d_occi_plus[,1])
summary(d_palle_plus[,1])

pdf(paste0(infile,'.plus.pdf'),height=10,width=20)
l <- list (d_occi_plus[d_occi_plus$V1<10000,1],d_palle_plus[d_palle_plus$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="First introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
dev.off()

d_occi_minus <- subset(d_occi, V2<0)
d_palle_minus <- subset(d_palle, V2<0)
pdf(paste0(infile,'.minus.pdf'),height=10,width=20)
l <- list (d_occi_minus[d_occi_minus$V1<10000,1],d_palle_minus[d_palle_minus$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="First introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
dev.off()

summary(d_occi_minus[,1])
summary(d_palle_minus[,1])

infile="~/Desktop/11_clover/04_Comparisions/20140918_rest.introns_10000"
d_occi <- read.table('~/Desktop/11_clover/04_Comparisions/clover.gff3.OtherThanFirstIntron',sep='\t', header=F,quote = "\"'",fill = TRUE)
head(d_occi)
d_palle <- read.table('~/Desktop/11_clover/04_Comparisions/pallescens.gff3.OtherThanFirstIntron',sep='\t', header=F,quote = "\"'",fill = TRUE)
head(d_palle)

#hist(d_occi[,2], main="Occidentale",xlab="Intron Size", ylab="Frequency", xlim=c(0,5000), breaks=1000, col = "red")
summary(d_occi[,1])
summary(d_palle[,1])

pdf(paste0(infile,'.All.pdf'),height=10,width=20)
l <- list (d_occi[d_occi$V1<10000,1],d_palle[d_palle$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="Rest introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
dev.off()

d_occi_plus <- subset(d_occi, V2>0)
d_palle_plus <- subset(d_palle, V2>0)
summary(d_occi_plus[,1])
summary(d_palle_plus[,1])

pdf(paste0(infile,'.plus.pdf'),height=10,width=20)
l <- list (d_occi_plus[d_occi_plus$V1<10000,1],d_palle_plus[d_palle_plus$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="Rest introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
summary(d_occi_plus[,2])
dev.off()

d_occi_minus <- subset(d_occi, V2<0)
d_palle_minus <- subset(d_palle, V2<0 )
summary(d_occi_minus[,1])
summary(d_palle_minus[,1])

pdf(paste0(infile,'.minus.pdf'),height=10,width=20)
l <- list (d_occi_minus[d_occi_minus$V1<10000,1],d_palle_minus[d_palle_minus$V1<10000,1])
multhist(l,beside=TRUE,freq=NULL,plot.it=TRUE,xlab="Intron Size", ylab="Frequency", main="Rest introns < 10000", cex.axis=1, col=c("Red", "Blue"))
legend.text<-c("Occidentale","Pallenscens")
legend("topright",legend=legend.text, col=c("Red", "Blue"), pch=15, bty="n", cex=0.8)
summary(d_occi_minus[,2])
dev.off()



### Lotus
infile="~/Desktop/03_Lotus_annotation/lj30/20140314_Lj30.gff3.introns"
d_lotus <- read.table('~/Desktop/03_Lotus_annotation/lj30/20140314_Lj30.gff3.introns',sep='\t', header=F,quote = "\"'",fill = TRUE)
summary(d_lotus[,1])
d_lotus_plus <- subset(d_lotus, V2>0)
summary(d_lotus_plus[,1])
d_lotus_minus <- subset(d_lotus, V2<0)
summary(d_lotus_minus[,1])

### Arabidopsis
infile="~/Desktop/03_Lotus_annotation/TAIR10_GFF3_genes.gff.introns"
d_lotus <- read.table(infile,sep='\t', header=F,quote = "\"'",fill = TRUE)
summary(d_lotus[,1])
d_lotus_plus <- subset(d_lotus, V2>0)
summary(d_lotus_plus[,1])
d_lotus_minus <- subset(d_lotus, V2<0)
summary(d_lotus_minus[,1])

### Soybean
infile="~/Desktop/03_Lotus_annotation/Gmax_109_gene.gff3.introns"
d_lotus <- read.table(infile,sep='\t', header=F,quote = "\"'",fill = TRUE)
summary(d_lotus[,1])
d_lotus_plus <- subset(d_lotus, V2>0)
summary(d_lotus_plus[,1])
d_lotus_minus <- subset(d_lotus, V2<0)
summary(d_lotus_minus[,1])


