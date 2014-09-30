
d_rec <- read.table('~/Desktop/11_clover/04_Comparisions/01_reciprocal_expression/20140901_occi_palle.reciprocal.txt',sep='\t', header=FALSE,quote = "\"'",fill = TRUE,row.names=NULL)
colnames(d_rec) <- c("Gene_Occi","Gene_Palle")

## replace the word clover
# awk '{gsub(/clover/,"occidentale"); print $0}' 20140905_UniqCounts_occi.txt > 20140905_UniqCounts_occi.rep.txt 
# awk '{gsub(/clover/,"occidentale"); print $0}' 20140905_AllCounts_occi.txt > 20140905_AllCounts_occi.rep.txt 

d_occi <- read.table('~/Desktop/11_clover/04_Comparisions/01_reciprocal_expression/20140905_UniqCounts_occi.rep.txt',sep='\t', header=TRUE,quote = "\"'",fill = TRUE,row.names=NULL)
d_occi_uniq <- d_occi[,c(1,2,4,6,8)]
colnames(d_occi_uniq) <- c("Gene_Occi","Gene_Occi_all","Gene_Occi_floral","Gene_Occi_root","Gene_Occi_stolon")

d_palle <- read.table('~/Desktop/11_clover/04_Comparisions/01_reciprocal_expression/20140905_UniqCounts_palle.txt',sep='\t', header=TRUE,quote = "\"'",fill = TRUE,row.names=NULL)
d_palle_uniq <- d_palle[,c(1,2,4,6,8)]
colnames(d_palle_uniq) <- c("Gene_Palle","Gene_Palle_all","Gene_Palle_floral","Gene_Palle_root","Gene_Palle_stolon")

#sample_rec <- d_rec[1:10,]
#sample_d_occi_uniq <- d_occi_uniq[1:100,]

dim(d_rec)

rec_occi <- merge(x = d_rec, y = d_occi_uniq, by="Gene_Occi",all.x=TRUE)

rec_occi_palle <- merge(x = rec_occi, y = d_palle_uniq, by="Gene_Palle",all.x=TRUE)
rec_occi_palle$Merge_geneID <- paste(rec_occi_palle[,1], rec_occi_palle[,2], sep="_")

rec_occi_palle_sample <- rec_occi_palle[1:1000,]
data_sub <- rec_occi_palle_sample[,c(3,7,4,8,5,9,6,10)]
rownames(data_sub) <- rec_occi_palle_sample[,11]

colors <- c(rep('gray',1),
            rep('Black',1),
            rep('lightblue',1),
            rep('blue',1),
            rep('orange',1),
            rep('red',1),
            rep('lightgreen',1),
            rep('green',1))

pdf(paste0("~/Desktop/11_clover/04_Comparisions/01_reciprocal_expression/20140901_occi_palle.reciprocal",'.pdf'), height=20, width=30)

par(mfcol=c(1,1), mar=c(2.5,2.5,2.5,2.5), oma=c(25,1,1,80))

heatmap(as.matrix(data_sub), labRow = rownames(data_sub), labCol = c(colnames(data_sub)), col=topo.colors(100), keep.dendro = FALSE, Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1,cexRow=0.4, cexCol=1.5, ColSideColors=colors)

dev.off()

