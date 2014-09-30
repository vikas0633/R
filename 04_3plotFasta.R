#source("http://bioconductor.org/biocLite.R")
#biocLite("Biostrings")
library(Biostrings)
args <- commandArgs(trailingOnly = TRUE)
file=args[1]

x <- readDNAStringSet(file)

png(paste0(file,".png"))
l <- width(x)
hist(l, xlim=c(min(l),max(l)),n=100,main="Sequence length distribution", col='red')
a=paste0('Mean sequence ',as.integer(mean(l)))
b=paste0('Longest sequence ',max(l))
c=paste0('Smallest sequence ',min(l))
legend("topright",c(a,b,c),text.col = c(3, 4, 6), xjust = 1, yjust = 1,adj = c(0.1, 0.6))

dev.off()