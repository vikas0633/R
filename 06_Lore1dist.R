d <- read.table('~/Desktop//temp/Lore1_20130523.dist', header=TRUE)
hist(d[which(d[,7]<500),7],breaks=100)

length(d[,8])
hist(d[,8],breaks=100)

hist(d[,7]/d[,8],breaks=100, col=c("green"))