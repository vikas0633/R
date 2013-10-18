acc <- read.table(file="/u/pm/data/2013_09_11_lotus_snps/all_marker_het_table.txt",header=TRUE)
head(acc)

### save the figure
jpeg("/u/pm/data/2013_09_11_lotus_snps/all_marker_GQ.jpg", width=480, 
     height=400, quality=90, units="px")

burttii <- acc[, 3:5]
#head(burttii)
## for quality
xlab=c(10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200)
burttii$bin <- cut(burttii$Burtii_20130605_GQ, breaks = xlab)
head(burttii$bin)

library(plyr)
burttii_count <- count(burttii, c("Burtii_20130605_GC","bin"))
# burttii_count

bin_sums <-aggregate( freq ~ bin, data = burttii_count, sum)
bin_sums

#hom ref
hom_ref_frac<-cbind(burttii_count[which(burttii_count$Burtii_20130605_GC=="0/0"),3],bin_sums)
names(hom_ref_frac)=c("count","bin","sum")
#hom_ref_frac
plot(hom_ref_frac$bin,hom_ref_frac$count/hom_ref_frac$sum,ylim=c(0,1),type="l", lwd=2, xlab=c(xlab))

#het
het_frac<-cbind(burttii_count[which(burttii_count$Burtii_20130605_GC=="0/1"),3],bin_sums)
names(het_frac)=c("count","bin","sum")
het_frac
lines(het_frac$bin,het_frac$count/het_frac$sum, col="red", lwd=4)


#hom alt
hom_alt_frac<-cbind(burttii_count[which(burttii_count$Burtii_20130605_GC=="1/1"),3],bin_sums)
names(hom_alt_frac)=c("count","bin","sum")
#hom_alt_frac
lines(hom_alt_frac$bin,hom_alt_frac$count/hom_alt_frac$sum,ylim=c(0,1),col="green", lwd=2)

dev.off()

