
f=read.table('~/Desktop/03_Lotus_annotation/burtti_nonsym_ratio')
library(HyperbolicDist)

h <- hist(f$V2)
density(f$V2,col = "orange",lwd=10, main="NonSynonymous - Synonymous (difference)", xlab="differences")

#title(main = list("snp affected transcript counts", font = 4))

h <- hist(f$V2)
x<-c(h$counts)
barplot(x,names.arg=c(-16, -14, -12, -10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20), pch=20,ylab="transcript couts", col="blue",xlab="delta non_synonymous - synonymous", main="Transcript count frequencies Vs non_syn - syn  differeces")
plot(h$breaks[-1],log10(h$counts),col="red",type="h", lwd = 15, ylab="log of transcript couts", xlab="delta non_synonymous - synonymous", main="Transcript count frequencies Vs non_syn - syn  differeces")