### script to make hist plot

file="/Volumes/vgupta/12_LotusArrayData/100_data/01_allreps/A-AFFY-90_download/lotus_with_seq_descr.fa.blastout.idens"
mydata = read.table(file, header=FALSE, sep = '\t' )  # read text file
head(mydata, n =100)
### save the plot
#png(paste(Sys.time(),"hist.png",sep='_'))
png(paste(file,"hist.png",sep='_'))
### make hist plot
#hist(log10(mydata[,1]), breaks=200,main=" ORF length", xlab="log10 N's",col="green")
hist((mydata[,1]), breaks=10,main=" ORF length", xlab="Identities",col="green", xlim=c(95,100))
dev.off()

mydata_100 <- subset(mydata, mydata[,1]<100)

hist(mydata_100[,1])


file='~/Downloads/20140924_r_gene_expression.txt'
mydata = read.table(file, header=FALSE, sep = '\t' )  # read text file
head(mydata, n =10)
colnames(mydata) <- c("ID","Value")
png(paste(file,"_hist.png",sep='_'))
### make hist plot
#hist(log10(mydata[,1]), breaks=200,main=" ORF length", xlab="log10 N's",col="green")
mydata <- subset(mydata, )
hist(as.numeric(as.character(mydata[,2])), breaks=100,main="LOG(Root/Shoot)", xlab="ratio",col="green")
dev.off()


