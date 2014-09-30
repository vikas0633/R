
#R version 2.15.3 (2013-03-01)
library(seqinr)
library(graphics)
library(base)
args <- commandArgs(trailingOnly = TRUE)
file=args[1]
data=read.fasta(file)
l=getLength(data)


library(aplpack)
png(paste0(file,".png"))
hist(l, xlim=c(min(l),max(l)),n=100,main="Sequence length distribution")
a=paste0('Mean sequence ',as.integer(mean(l)))
b=paste0('Longest sequence ',max(l))
c=paste0('Smallest sequence ',min(l))
legend("topright",c(a,b,c),text.col = c(3, 4, 6), xjust = 1, yjust = 1,adj = c(0.1, 0.6))

sessionInfo()

dev.off()