## http://www.r-bloggers.com/computing-and-visualizing-pca-in-r/


### load libraries
library(reshape2)
library(ggplot2)
library(directlabels)
require(graphics)

### read the data 
d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno',sep='\t', header=TRUE,quote = "\"'",fill = TRUE)

summary(d$sum)
summary(d$score)
dim(subset(d,score>10))

pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/sum",'.pdf'), height=20, width=20)
dim(d)
hist(d[,72])
dev.off()

d1 <- subset(d,sum_norm<10000 & cdsSeq_len > 300 & nr_anno != 'NoHit' & score>3)
dim(d1)
head(d1)
d2 <- d1[,78:147]

### EPS- as baseline
# d2_277 <- d2[,c(4:6,10:12,21:23)]
# d2_311 <- d2[,c(27:29,33:35,44:46)]
# d2_G <- d2[,c(50:52,56:58,68:70)]


d2_277 <- d2[,c(4:6,10:12,21:23)]/(d2[,7]+d2[,8]+d2[,9])/3
d2_311 <- d2[,c(27:29,33:35,44:46)]/(d2[,30]+d2[,31]+d2[,32])/3
d2_G <- d2[,c(50:52,56:58,68:70)]/(d2[,53]+d2[,54]+d2[,55])/3

# d2_277 <- d2[,c(4:6,10:12,21:23)]/(d2[,4]+d2[,5]+d2[,6]+d2[,10]+d2[,11]+d2[,12]+d2[,21]+d2[,22]+d2[,23])/9
# d2_311 <- d2[,c(27:29,33:35,44:46)]/(d2[,27]+d2[,28]+d2[,29]+d2[,33]+d2[,34]+d2[,35]+d2[,44]+d2[,45]+d2[,46])/9
# d2_G <- d2[,c(50:52,56:58,68:70)]/(d2[,50]+d2[,51]+d2[,52]+d2[,56]+d2[,57]+d2[,58]+d2[,68]+d2[,69]+d2[,70])/9


data <- data.frame(d2_277, d2_311, d2_G)
head(data)

pca <- prcomp(data, scale=T)
#pca <- princomp(data)

##  Show the loadings to two decimal places
#summary (pca, loadings=TRUE, digits=2)



samples <- gsub("_norm", "", colnames(data))
sample_symbols <- c(rep('277_72',3),
                    rep('277_72',3),
                    rep('277_72',3),
                    rep('311_72',3),
                    rep('311_72',3),
                    rep('311_72',3),
                    rep('G_72',3),
                    rep('G_72',3),
                    rep('G_72',3))
sample_colors <- c(rep('exoU',3),
                   rep('exoYF',3),
                   rep('R7A',3),
                   rep('exoU',3),
                   rep('exoYF',3),
                   rep('R7A',3),
                   rep('exoU',3),
                   rep('exoYF',3),
                   rep('R7A',3))

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
sample.groups <- colnames(data)
scores <- data.frame(sample.groups, pca$rotation[,1:9])

#p <- ggplot(scores, aes(x=PC2, y=PC3, label=samples, col=samples)) + geom_text(size=3) + theme_bw() + geom_point(aes(colour=samples, shape=sample_symbols))

p <- ggplot(scores, aes(x=PC1, y=PC2, label=samples)) +geom_text(size=5,vjust=1.5)+ theme_bw() + geom_point(aes(colour=sample_colors,shape=sample_symbols),cex=5)+ scale_shape_manual(values=c(15,16,17))

p
# z<-as.character(colnames(data))
# q<-qplot(scores$PC2,scores$PC3,label=colnames(data),colours=colnames(data))+geom_point(aes(colour=z))+geom_text(size=3)
# direct.label(q, first.qp)

dev.off()

### hierarchial clustering
pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/PCA",'.pdf'), height=20, width=20)
d <- dist(t(as.matrix(data))) 
hc <- hclust(d) 
plot(hc) 
dev.off()


library(limma)
pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/MDS",'.pdf'), height=20, width=20)
plotMDS(data, top=10000, cex=1.0, dim.plot=c(1,2))
dev.off()

