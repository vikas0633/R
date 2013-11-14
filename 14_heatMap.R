pdf("/Users/vgupta/Desktop/03_Lotus_annotation/2013_week44/131111_ps_seeds.pdf", height=10, width = 20)
d <- read.table('/Users/vgupta/Desktop/03_Lotus_annotation/2013_week44/131111_ps_seeds.txt', header=T)
#length(which(d_all$Std_WT_control1/d_all$Mean_WT_control1 >0.2))
#par(mfcol=c(1,1), mar=c(2.5,2.5,2.5,2.5), oma=c(25,1,1,80))
d2 <- as.matrix(d[,])
# seed - lightblue
# pod - blue
# flower - yellow
# shoot - green
# petiole - pink
# leaf - violet
# stem - white
# root_unino - gray
# root_inco - purple
# nodules - red
# nodules+root - orange

colors <- c(rep("lightblue",length = 5), 
            rep("blue",length = 1), 
            rep("yellow",length = 1), 
            rep("green",length = 29), 
            rep("pink",length = 1), 
            rep("violet",length = 2), 
            rep("white",length = 2), 
            rep("gray",length = 15),
            rep("purple",length = 12),
            rep("red",length = 5), 
            rep("orange",length = 1))
d2[d2==0] <- NA

bluered <- colorRampPalette(c("blue","white","red"))(256)
cm <- cm.colors(256)
BGYOR <- rev(rainbow(n = 256, start = 0, end = 4/6))
greenred <- colorRampPalette(c("green","black","red"))(256)
grayscale <- gray((255:0)/255)

#heatmap(d2,labRow = rownames(d), labCol = c(colnames(d)), keep.dendro = FALSE, Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1, cexRow=0.7, cexCol=0.5, ColSideColors=colors, col = grayscale)

pheatmap(d, col = grayscale, cluster_rows = T, cluster_cols = F)

#heatmap(d2, col=redgreen(75),labRow = rownames(d), labCol = c(colnames(d)), keep.dendro = FALSE, Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1,cexRow=0.07, cexCol=0.5, ColSideColors=colors)

#heatmap.2(d2, labRow = rownames(d), labCol = c(colnames(d)), Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1,cexRow=0.07, cexCol=0.5, ColSideColors=colors)
dev.off()