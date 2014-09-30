### script to make hist plot

file="Desktop/11_clover/20140320_transcriptCount.txt"
mydata = read.table(file, header=FALSE )  # read text file
head(mydata[], n =100)

d <- data.frame(mydata[,2],mydata[,1])
colnames(d) <- c('scaffold','transcript count')

summary(d)

d$Scaffold_num <- sapply(strsplit(as.character(d$scaffold), "_"),'[',2)
library(doBy)
head(d)
d_sort <-d[order(as.numeric(d[,3])),]
head(d_sort)

plot(d_sort[,3],d_sort[,2], xlim=c(1,8000),ylim=c(1,150),col="steelblue2", type="p", lwd = 2, cex=0.5, xlab='scaffold', ylab='transcript count', main='Transcript distrbution across scaffolds')

sum(d_sort[,2])

library(pastecs)
stat.desc(d_sort[,2]) 

### save the plot
#png(paste(Sys.time(),"hist.png",sep='_'))
png(paste(file,"hist.png",sep='_'))
### make hist plot
#hist(log10(mydata[,1]), breaks=200,main=" ORF length", xlab="log10 N's",col="green")
hist((d[,2]), breaks=100,main="Transcript counts", xlab="Transcipt counts",col="green")
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
