mat <- matrix(c(4,1,2,6), nrow=2, ncol=2)
fisher.test(mat)

mat <- matrix(c(3,2,1,4), nrow=2, ncol=2)
fisher.test(mat,alternative="greater")

pchisq(c(140/290,100/290,50/290),2)