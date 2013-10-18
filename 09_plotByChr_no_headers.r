jpeg("~/Desktop/comb_fredii.jpg", width=3600, height=2000, units="px")
chr=c(1,2,3,4,5,6)
max_chr_length=67000000
par(mfcol=c(9,2), mar=c(2,2,0.5,0.5), oma=c(1,2,1,1))
tmp <- read.table('/Users/sua/Documents/Stig_aarhus/Lab_lists/Journal_files/2011_08_20_qtl/Lotus_markers/gph5_6_r_out.txt',header=F, sep="\t")

head(tmp)
names(tmp)

for(i in 1:length(chr)) {
tmp_chr <- tmp[which(chr[i]==tmp$V1),]
pool1 <- cbind(tmp_chr$V2,tmp_chr$V11)
pool1_smooth <- loess.smooth(tmp_chr$V2,tmp_chr$V11,span=1/10)
plot(tmp_chr$V2,tmp_chr$V11, type="p", main="this", xlim=c(0,max_chr_length),col="blue", las=1, ann="FALSE", cex=0.3, cex.axis=0.6)
abline(h=0, lwd=2)
lines(pool1_smooth, lwd=10, col="blue")
pool2_smooth <- loess.smooth(tmp_chr$V2,tmp_chr$V12,span=1/10)
plot(tmp_chr$V2,tmp_chr$V12, type="p", main="this", xlim=c(0,max_chr_length), col="red", las=1, ann="FALSE", cex=0.3, cex.axis=0.6) 
abline(h=0, lwd=2)
lines(pool2_smooth, lwd=10, col=" red")
plot(tmp_chr$V2,tmp_chr$V11, type="p", main="this", xlim=c(0,max_chr_length), col="blue", las=1, ann="FALSE", cex=0.3, cex.axis=0.6) 
abline(h=0, lwd=2)
points(tmp_chr$V2,tmp_chr$V12, col="red", cex=0.3, cex.axis=0.6) 
lines(pool1_smooth, lwd=10, col="blue")
lines(pool2_smooth, lwd=10, col=" red")
#points(tmp_chr$position,tmp_chr$difference_percentage_parentA_pool1.pool2,col="forestgreen") 
#points(tmp_chr$position,tmp_chr$p_value_Fisher_s_exact_test,col="black")
}
dev.off()