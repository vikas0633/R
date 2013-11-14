d <- read.table('~/Dropbox/Blueberry/DiffExpAnalysis/Results/berry_RPM.tsv.noAnno.OnlyMeans', header = T)
head(d)
min(d[,2])

d[d==0.0] <- 0.01

d2 <- data.frame((d[,1]),log10(d[,2]/d[,2]),log10(d[,3]/d[,2]),log10(d[,4]/d[,2]),log10(d[,5]/d[,2]),log10(d[,6]/d[,2]))
names(d2) <- c("TranscriptID", "Pad", "Cup", "Green", "Pink", "Ripe")
head(d2)
write.table(d2,file="~/Dropbox/Blueberry/DiffExpAnalysis/Results/berry_RPM.tsv.noAnno.OnlyMeans.relative", row.names = F,quote = F, sep = '\t')
