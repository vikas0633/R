setwd('~/Desktop/03_Lotus_annotation/2013_week50/')

###getcommandlinearguments
args<-commandArgs(trailingOnly=TRUE)

###setworkingdirectory,infileandnumberofrowsarguments

#infile=args[1]
infile="~/Desktop/03_Lotus_annotation/2013_week50/20130802_Lj30.gff3.lore1.genes.mod.paste"


pdf(paste0(infile,'.corr.pdf'),height=10,width=10)

#Lj_chr=c("chloro")
d<-read.table(infile,header=F)
head(d)

d1 <- d[,c(1,2,3,7)]
names(d1) <- c("chro","pos","Lore1","Gene")
head(d1)

plot(d1$Lore1, d1$Gene, type="p", 
     col="red", las=1 , cex=0.5, 
     cex.axis=0.8)
d2 <- d1[,c(3,4)]
spr_corr <- round(cor(d1[,3],d1[,4], method='spearman'),4)
pea_corr <- round(cor(d1[,3],d1[,4], method='pearson'),4)
title(main=paste('Spearman/Pearson Correlation Cofficient',spr_corr,'/',pea_corr), cex.lab=2.5)

dev.off()

pdf(paste0(infile,'.corr_all.pdf'),height=20,width=10)
Lj_chr=c("chr0","chr1","chr2","chr3","chr4","chr5","chr6")
par(mfrow=c(4,2), mar=c(5.5,7.5,3.5,3.5), oma=c(1,2,1,1))
for(i in 1:length(Lj_chr)) {
    tmp_chr <- d1[which(Lj_chr[i]==d1$chro),]
    plot(tmp_chr$Lore1, tmp_chr$Gene, type="p", 
         col="red", las=1 , cex=0.5, 
         cex.axis=0.8, xlim=c(0,4000), ylim=c(0,4000))
    title(main=Lj_chr[i], cex.lab=2.5)
}

dev.off()
    