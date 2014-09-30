## http://www.r-bloggers.com/computing-and-visualizing-pca-in-r/


### load libraries
library(reshape2)
library(ggplot2)
library(directlabels)
require(graphics)

### read the data 
d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno',sep='\t', header=TRUE,quote = "\"'",fill = TRUE)

summary(d$sum)
pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/sum",'.pdf'), height=20, width=20)
dim(d)
hist(d[,72])
dev.off()

d1 <- subset(d,sum_norm<10000 & cdsSeq_len > 300 & nr_anno != 'NoHit' & score > 3)
dim(d1)
head(d1)
d2 <- d1[,78:147]

d2_277 <- d2[,1:23]/(d2[,13]+d2[,14]+d2[,15]+d2[,16]+d2[,17])/5
d2_311 <- d2[,24:46]/(d2[,36]+d2[,37]+d2[,38]+d2[,39]+d2[,40])/5
d2_G <- d2[,47:70]/(d2[,59]+d2[,60]+d2[,61]+d2[,62]+d2[,63]+d2[,64])/6

data <- data.frame(d2_277, d2_311, d2_G)
head(data)

pca <- prcomp(data, scale=T)
#pca <- princomp(data)

##  Show the loadings to two decimal places
#summary (pca, loadings=TRUE, digits=2)



samples <- gsub("_norm", "", colnames(data))
sample_symbols <- c(rep('277_24',3),rep('277_72',3),
                    rep('277_24',3),rep('277_72',3),
                    rep('277_24',2),rep('277_24',3),
                    rep('277_24',3),rep('277_24',3),
                    rep('311_24',3),rep('311_72',3),
                    rep('311_24',3),rep('311_72',3),
                    rep('311_24',2),rep('311_72',3),
                    rep('311_24',3),rep('311_72',3),
                    rep('G_24',3),rep('G_72',3),
                    rep('G_24',3),rep('G_72',3),
                    rep('G_24',3),rep('G_24',3),
                    rep('G_24',3),rep('G_72',3))
sample_colors <- c(rep('exoU',3),rep('exoU',3),
                   rep('exoYF',3),rep('exoYF',3),
                   rep('H2O',2),rep('nodC',3),
                   rep('R7A',3),rep('R7A',3),
                   rep('exoU',3),rep('exoU',3),
                   rep('exoYF',3),rep('exoYF',3),
                   rep('H2O',2),rep('nodC',3),
                   rep('R7A',3),rep('R7A',3),
                   rep('exoU',3),rep('R7A',3),
                   rep('exoYF',3),rep('exoYF',3),
                   rep('H2O',3),rep('nodC',3),
                   rep('R7A',3),rep('R7A',3))

# melted <- cbind(variable.group, melt(pca$rotation[,1:9]))
# 
# pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/PCA_bar",'.pdf'), height=20, width=20)
# 
# barplot <- ggplot(data=melted) +
#     geom_bar(aes(x=Var1, y=value, fill=variable.group), stat="identity") +
#     facet_wrap(~Var2)
# barplot
# 
# dev.off()



pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/PCA",'.pdf'), height=20, width=20)
sample.groups <- colnames(d2)
scores <- data.frame(sample.groups, pca$rotation[,1:3])

#p <- ggplot(scores, aes(x=PC2, y=PC3, label=samples, col=samples)) + geom_text(size=3) + theme_bw() + geom_point(aes(colour=samples, shape=sample_symbols))

p <- ggplot(scores, aes(x=PC2, y=PC3)) + theme_bw() + geom_point(aes(colour=sample_colors,shape=sample_symbols),cex=5)+ scale_shape_manual(values=c(0,15,1,16,2,17))

p
# z<-as.character(colnames(data))
# q<-qplot(scores$PC2,scores$PC3,label=colnames(data),colours=colnames(data))+geom_point(aes(colour=z))+geom_text(size=3)
# direct.label(q, first.qp)

dev.off()

library(limma)
pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/MDS",'.pdf'), height=20, width=20)
plotMDS(data, top=10000, cex=1.0, dim.plot=c(1,2))
dev.off()

### hierarchial clustering
pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/hc",'.pdf'), height=20, width=20)
d <- dist(t(as.matrix(data))) 
hc <- hclust(d) 
plot(hc) 
dev.off()
