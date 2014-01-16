### script to make hist plot

mydata = read.table("~/Desktop/03_Lotus_annotation/2013_week50/length.txt", header=FALSE, sep = ' ' )  # read text file

### save the plot
#png(paste(Sys.time(),"hist.png",sep='_'))
png(paste('Ns_between_Genes',"hist.png",sep='_'))
### make hist plot
hist(log10(mydata[,1]), breaks=200,main=" ORF length", xlab="log10 N's",col="green")

dev.off()
