library("stats")

#d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno',sep='\t', header=TRUE,quote = "\"'",fill = TRUE)

d <- read.table('~/Desktop/35_simon_RNAseq/20140807_AllSamples_FeatureCount.txt.values.norm.anno.heat',sep='\t', header=TRUE,quote = "\"'",fill = TRUE,row.names=NULL)

## filtering

d <- d[!duplicated(d), ]
rownames(d) <- d[,1]
head(rownames(d))

d1 <- subset(d, cdsSeq_len > 300 & nr_anno != 'NoHit')

dim(d1)



#head(d)
#names(d)
#plot(d$Mean_WT_control1, d$Std_WT_control1)
#plot(d_all$Mean_WT_control1, d_all$Std_WT_control1, col='red')
#length(which(d_all$Std_WT_control1/d_all$Mean_WT_control1 >0.2))


d2 <- as.matrix(d1[,79:148])

d2_H2O <- d2[,c(59:61,13:14,36:37)]
d2_H2O_avg <- data.frame((d2_H2O[,1]+d2_H2O[,2])/2 , (d2_H2O[,3]+d2_H2O[,4])/2, (d2_H2O[,5]+d2_H2O[,6]+d2_H2O[,7])/3) 
colnames(d2_H2O_avg) <- c("AVG_H2O_G","AVG_H2O_277", "AVG_H2O_311")

d2_nodC <- d2[,c(62:64,15:17,38:40)]
d2_nodC_avg <- data.frame((d2_nodC[,1]+d2_nodC[,2]+d2_nodC[,3])/3, (d2_nodC[,4]+d2_nodC[,5]+d2_nodC[,6])/3,(d2_nodC[,7]+d2_nodC[,8]+d2_nodC[,9])/3)
colnames(d2_nodC_avg) <- c("AVG_nodC_G", "AVG_nodC_277", "AVG_nodC_311")

d2_exoU_24 <- d2[,c(47:49, 1:3,24:26)] #exoU_24
d2_exoU_24_avg <- data.frame((d2_exoU_24[,1]+d2_exoU_24[,2]+d2_exoU_24[,3])/3,(d2_exoU_24[,4]+d2_exoU_24[,5]+d2_exoU_24[,6])/3,(d2_exoU_24[,7]+d2_exoU_24[,8]+d2_exoU_24[,9])/3)
colnames(d2_exoU_24_avg) <- c("AVG_exoU_24_G", "AVG_exoU_24_277", "AVG_exoU_24_311")

d2_exoU_72 <- d2[,c(50:52, 4:6,27:29)] #exoU_72
d2_exoU_72_avg <- data.frame((d2_exoU_72[,1]+d2_exoU_72[,2]+d2_exoU_72[,3])/3,(d2_exoU_72[,4]+d2_exoU_72[,5]+d2_exoU_72[,6])/3,(d2_exoU_72[,7]+d2_exoU_72[,8]+d2_exoU_72[,9])/3)
colnames(d2_exoU_72_avg) <- c("AVG_exoU_72_G", "AVG_exoU_72_277", "AVG_exoU_72_311")


d2_exoYF_24 <- d2[,c(53:55, 7:9,30:32)] #exoYF_24
d2_exoYF_24_avg <- data.frame((d2_exoYF_24[,1]+d2_exoYF_24[,2]+d2_exoYF_24[,3])/3,(d2_exoYF_24[,4]+d2_exoYF_24[,5]+d2_exoYF_24[,6])/3,(d2_exoYF_24[,7]+d2_exoYF_24[,8]+d2_exoYF_24[,9])/3)
colnames(d2_exoYF_24_avg) <- c( "AVG_exoYF_24_G", "AVG_exoYF_24_277", "AVG_exoYF_24_311")

d2_exoYF_72 <- d2[,c(56:58, 10:12,33:35)] #exoYF_72
d2_exoYF_72_avg <- data.frame((d2_exoYF_72[,1]+d2_exoYF_72[,2]+d2_exoYF_72[,3])/3,(d2_exoYF_72[,4]+d2_exoYF_72[,5]+d2_exoYF_72[,6])/3,(d2_exoYF_72[,7]+d2_exoYF_72[,8]+d2_exoYF_72[,9])/3)
colnames(d2_exoYF_72_avg) <- c("AVG_exoYF_72_G", "AVG_exoYF_72_277", "AVG_exoYF_72_311")

d2_R7A_24 <- d2[,c(65:67, 18:20,41:43)] #R7A_24
d2_R7A_24_avg <- data.frame((d2_R7A_24[,1]+d2_R7A_24[,2]+d2_R7A_24[,3])/3,(d2_R7A_24[,4]+d2_R7A_24[,5]+d2_R7A_24[,6])/3,(d2_R7A_24[,7]+d2_R7A_24[,8]+d2_R7A_24[,9])/3)
colnames(d2_R7A_24_avg) <- c("AVG_R7A_24_G", "AVG_R7A_24_277", "AVG_R7A_24_311")

d2_R7A_72 <- d2[,c(68:70, 21:23,44:46)] #R7A_72
d2_R7A_72_avg <- data.frame((d2_R7A_72[,1]+d2_R7A_72[,2]+d2_R7A_72[,3])/3,(d2_R7A_72[,4]+d2_R7A_72[,5]+d2_R7A_72[,6])/3,(d2_R7A_72[,7]+d2_R7A_72[,8]+d2_R7A_72[,9])/3)
colnames(d2_R7A_72_avg) <- c("AVG_R7A_72_G", "AVG_R7A_72_277", "AVG_R7A_72_311")

# data <- data.frame(d2_H2O_avg, d2_nodC_avg, d2_exoU_24_avg, d2_exoU_72_avg, d2_exoYF_24_avg, d2_exoYF_72_avg, d2_R7A_24_avg, d2_R7A_72_avg)

data <- data.frame(d2_H2O_avg, d2_R7A_72_avg , d2_exoYF_72_avg, d2_exoU_72_avg, d2_nodC_avg, d2_exoU_24_avg, d2_exoYF_24_avg, d2_R7A_24_avg)

colnames(data)



data$score <- apply(data, 1, function(row) sd(row)/sqrt(mean(row)) )

# exoU - lightblue
# exoYF - yellow
# H2O - green
# R7A - violet
# nodC - red

# colors <- c(rep('lightblue',1),rep('lightblue',1),
#                    rep('yellow',1),rep('yellow',1),
#                    rep('green',1),rep('red',1),
#                    rep('violet',1),rep('violet',1),
#                    rep('lightblue',1),rep('lightblue',1),
#                    rep('yellow',1),rep('yellow',1),
#                    rep('green',1),rep('red',1),
#                    rep('violet',1),rep('violet',1),
#                    rep('lightblue',1),rep('lightblue',1),
#                    rep('yellow',1),rep('yellow',1),
#                    rep('green',1),rep('red',1),
#                    rep('violet',1),rep('violet',1))

colors <- c(rep('gray',3),
            rep('Black',3),
            rep('lightblue',3),
            rep('blue',3),
            rep('orange',3),
            rep('red',3),
            rep('lightgreen',3),
            rep('green',3))


# colors <- c(rep('lightblue',3),
#             rep('yellow',3),
#             rep('violet',3),
#             rep('lightblue',3),
#             rep('yellow',3),
#             rep('violet',3),
#             rep('lightblue',3),
#             rep('yellow',3),
#             rep('violet',3))

data_sub <- subset(data, score > 2)
data_sub <- subset(data, (AVG_R7A_72_311+AVG_H2O_G)/2 > 2*(AVG_exoU_72_311+AVG_exoU_72_G+AVG_exoYF_72_311+AVG_exoYF_72_G)/4)
data_sub <- subset(data, (AVG_R7A_72_311+AVG_H2O_G)/2 < 0.5*(AVG_exoU_72_311+AVG_exoU_72_G+AVG_exoYF_72_311+AVG_exoYF_72_G)/4)
data_sub <- data_sub[,1:24]

pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/heat",'.pdf'), height=20, width=30)

par(mfcol=c(1,1), mar=c(2.5,2.5,2.5,2.5), oma=c(25,1,1,80))

heatmap(as.matrix(data_sub), labRow = rownames(data_sub), labCol = c(colnames(data_sub)), col=topo.colors(100), keep.dendro = FALSE, Colv = NA , cex.axis=0.1,  pch=10, cex.lab=1.1,cexRow=0.4, cexCol=1.5, ColSideColors=colors)

dev.off()


