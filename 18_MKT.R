### read the table

dat <- read.table('~/Desktop/03_Lotus_annotation/2013_week45/20131001_lotus_medicago_ns.txt', header=T)
dim(dat)

run.fisher <- function(row) {
  row2 <- c(as.numeric(row[2:5]))
  d.matrix <- matrix(c(row2), nrow=2, ncol=2)
  return(c(row,fisher.test(d.matrix)$p.value))
}


dout <- apply(dat, 1, run.fisher)

d2 <- t(dout)
dim(d2)

colnames(d2) <- c("Lj30_ID", "NS","S","NS_fix", "S-fix","Fisher_P-value")

write.table(d2, "~/Desktop/03_Lotus_annotation/2013_week45/20131001_lotus_medicago_ns_fisher.txt", sep = "\t", quote = F, row.names = F)
