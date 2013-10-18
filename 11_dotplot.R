jpeg("~/Desktop/03_Lotus_annotation/2013_week41_aligntest/AlignLjMt.jpg", width=3000, 
     height=2000, quality=100, units="px", pointsize = 12)
Lj_chr=c("chr1","chr2","chr3","chr4","chr5","chr6")
Mt_chr=c("Mt1","Mt2","Mt3","Mt4","Mt5","Mt6","Mt7","Mt8")
max_chr_length=67000000
par(mfrow=c(6,8), mar=c(5.5,7.5,3.5,3.5), oma=c(1,2,1,1))
tmp <- read.table(
  '~/Desktop/03_Lotus_annotation/2013_week41_aligntest/Lj_MtAll.bed.strandCorrected.align',
  header=F, sep="\t", ,comment.char = "#")
for(i in 1:length(Lj_chr)) {
  for (j in 1:length(Mt_chr)) { 
  tmp_chr <- tmp[which(Lj_chr[i]==tmp$V1 & Mt_chr[j]==tmp$V4) ,]
  plot(tmp_chr$V5,tmp_chr$V2, type="p", 
       col="red", las=1, ann="FALSE", cex=0.5, 
       cex.axis=0.8)
  title(ylab=Lj_chr[i], xlab=Mt_chr[j], cex.lab=2.5)
}
dev.off()