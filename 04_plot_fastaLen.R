
fname=''
d <- read.table(fname,sep='\t',header=F)
tdens=density(log10(d$bp))
xlab = "Log10 Length (bp)"
ylab = "Density"
main = "Length distribution"
plot(tdens, lwd = 5, col = "red", ylab = ylab, xlab = xlab, main = main, cex.main = 2, 
     cex.lab = 2, cex.axis = 2, mar = c(0.5, 0.5, 0.5, 0.5))