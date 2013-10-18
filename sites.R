```{r}
d <- read.table('~/Desktop/07_degradome/20130826_merged.bam.annot', header=F)
head(d)

string <- paste(c(mean(d$V3),median(d$V3),mean(d$V4),median(d$V4)),sep='\t')
print(string, quote = FALSE)


d1 <- d[which(d$V5 > 0.7),]
string <- paste(c(mean(d1$V3),median(d1$V3),mean(d1$V4),median(d1$V4)),sep='\t')
print(string, quote = FALSE)


dr <- d[which(d$V7 =="rRNA"),]
### total coverage
string <- paste(c(mean(dr$V3),median(dr$V3),mean(dr$V4),median(dr$V4)),sep='\t')
print(string, quote = FALSE)

drs <- d[which(d$V5 > 0.7 & d$V7=="rRNA"),]
string <- paste(c(mean(drs$V3),median(drs$V3),mean(drs$V4),median(drs$V4)),sep='\t')
print(string, quote = FALSE)

```