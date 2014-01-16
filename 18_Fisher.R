### read the table

dat <- read.table('/Users/vgupta/Desktop/03_Lotus_annotation/2013_week45/20131119_lotus_medicago_ns_cols.txt', header=T, sep = '\t')
dim(dat)

head(dat)

run.fisher <- function(row) {
  row2 <- c(as.numeric(row[c(2:5)]))
  d.matrix <- matrix(c(row2), nrow=2, ncol=2)
  return(c(row,format(fisher.test(d.matrix)$p.value,digits=5)))
}

# dat <- dat[complete.cases(dat),] 
# dat <- dat[is.na(dat)==0,] 
# dat <- dat[which(dat != 'NULL'),]
# dat[dat=="NULL"] <- 0
# dat[dat==NULL] <- 0
# head(dat)

dout <- apply(dat, 1, run.fisher)

d2 <- t(dout)
dim(d2)

colnames(d2) <- c("Lj30_ID","NS","S","NS_fix","S_fix","Fisher_P-value")

write.table(d2, "/Users/vgupta/Desktop/03_Lotus_annotation/2013_week45/20131119_lotus_medicago_ns_cols_fisher.txt", sep = "\t", quote = F, row.names = F)

head(d2)
#brk <- seq(0,1,length=20)
# hist(as.numeric(d2[,6]),col=heat.colors(length(brk)), breaks=brk, 
#     xlim=c(0,1), xlab="P-value", main="Fisher P-value Distribution", 
#     las=1, cex.axis=0.8)


fisher.test(matrix(c(2,3,4,5),nrow=2,ncol=2))