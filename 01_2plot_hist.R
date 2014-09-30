### script to make hist plot

file="Desktop/09_GABox/02_ReplaceWithLongerCDS/2014-03-14_1718.LongerCDS.txt"
mydata = read.table(file, header=FALSE, sep = '\t' )  # read text file
head(mydata[], n =100)
### save the plot
#png(paste(Sys.time(),"hist.png",sep='_'))
png(paste(file,"hist.png",sep='_'))
### make hist plot
#hist(log10(mydata[,1]), breaks=200,main=" ORF length", xlab="log10 N's",col="green")
hist((mydata[,6]), breaks=10,main=" ORF length", xlab="Identities",col="green")
dev.off()

mydata_100 <- subset(mydata, mydata[,1]<100)

hist(mydata_100[,1])

delta_cds <- mydata[,6]
delta_exon <- mydata[,7]
plot(delta_cds, delta_exon, col="steelblue2", type="p", lwd = 2, cex=0.5, main="CDS difference vs Exon difference")

h <- hist(delta_cds, breaks=100, main="CDS size increment", xlab="size increase in bp", col="green")
x <- delta_cds
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="red", lwd=2)
