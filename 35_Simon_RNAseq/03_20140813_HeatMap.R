#d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno',sep='\t', header=TRUE,quote = "\"'",fill = TRUE)

d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno.heat',sep='\t', header=TRUE,quote = "\"'",fill = TRUE,row.names=NULL)

## filtering

d <- d[!duplicated(d), ]
rownames(d) <- d[,1]
head(rownames(d))

d1 <- subset(d,sum_norm<10000 & cdsSeq_len > 300 & nr_anno != 'NoHit' & score>5)

dim(d1)



#head(d)
#names(d)
#plot(d$Mean_WT_control1, d$Std_WT_control1)
#plot(d_all$Mean_WT_control1, d_all$Std_WT_control1, col='red')
#length(which(d_all$Std_WT_control1/d_all$Mean_WT_control1 >0.2))


d2 <- as.matrix(d1[,79:148])


d2_277 <- d2[,c(4:6,10:12,21:23)]
d2_311 <- d2[,c(27:29,33:35,44:46)]
d2_G <- d2[,c(50:52,56:58,68:70)]
data <- as.matrix(data.frame(d2_277, d2_311, d2_G))

colnames(data)



# exoU - lightblue
# exoYF - yellow
# H2O - green
# R7A - violet
# nodC - red

# colors <- c(rep('lightblue',3),rep('lightblue',3),
#                    rep('yellow',3),rep('yellow',3),
#                    rep('green',2),rep('red',3),
#                    rep('violet',3),rep('violet',3),
#                    rep('lightblue',3),rep('lightblue',3),
#                    rep('yellow',3),rep('yellow',3),
#                    rep('green',2),rep('red',3),
#                    rep('violet',3),rep('violet',3),
#                    rep('lightblue',3),rep('lightblue',3),
#                    rep('yellow',3),rep('yellow',3),
#                    rep('green',3),rep('red',3),
#                    rep('violet',3),rep('violet',3))


colors <- c(rep('lightblue',3),
                   rep('yellow',3),
                   rep('violet',3),
                   rep('lightblue',3),
                   rep('yellow',3),
                   rep('violet',3),
                   rep('lightblue',3),
                   rep('yellow',3),
                   rep('violet',3))

pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/heat",'.pdf'), height=20, width=30)
par(mfcol=c(1,1), mar=c(2.5,2.5,2.5,2.5), oma=c(25,1,1,80))

heatmap(data, labRow = rownames(data), labCol = c(colnames(data)), col=topo.colors(100), keep.dendro = FALSE, Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1,cexRow=0.5, cexCol=1.5, ColSideColors=colors)
dev.off()

