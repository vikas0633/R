jpeg("~/Desktop/temp/comb.jpg", width=3600, height=2000, units="px")
chr=c(1,2,3,4,5,6)
par(mfcol=c(9,2), mar=c(2,2,0.5,0.5), oma=c(1,2,1,1))
tmp <- read.table('~/Desktop/temp/gph5_6_r_out_chr2_vikas.txt',header=T, sep="\t")

head(tmp)
names(tmp)

for(i in 1:length(chr)) {
tmp_chr <- tmp[which(chr[i]==tmp$chr),]
plot(tmp_chr$position,tmp_chr$percentage_parentA_pool1, type="p", main="this", col="blue", las=1, ann="FALSE", cex=0.3, cex.axis=0.6) 
plot(tmp_chr$position,tmp_chr$percentage_parentA_pool2, type="p", main="this", col="red", las=1, ann="FALSE", cex=0.3, cex.axis=0.6) 
plot(tmp_chr$position,tmp_chr$percentage_parentA_pool1, type="p", main="this", col="blue", las=1, ann="FALSE", cex=0.3, cex.axis=0.6) 
points(tmp_chr$position,tmp_chr$percentage_parentA_pool2, col="red") 
#points(tmp_chr$position,tmp_chr$difference_percentage_parentA_pool1.pool2,col="forestgreen") 
#points(tmp_chr$position,tmp_chr$p_value_Fisher_s_exact_test,col="black")
}
dev.off()