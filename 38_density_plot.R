
### Example
library(ggplot2)
m <- ggplot(movies, aes(x=rating))
m + geom_histogram()
diamonds_small <- diamonds[sample(nrow(diamonds), 1000), ]
ggplot(diamonds_small, aes(depth, fill = cut)) +
    geom_density(alpha = 0.2) + xlim(55, 70)
####

### make expression ratio density map
file='~/Downloads/20140924_r_gene_expression_plot_hist.txt'
d <- read.table(file,header=FALSE, sep = '\t')
colnames(d) <- c("Gene_ID", "Species","Exp_value") 
d$Exp_value <- as.numeric(as.character(d$Exp_value))

pdf(paste0(file,'.pdf'), height=10, width=15)
ggplot(d[1:100,], aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_at <- subset(d, Species=="Arabidopsis_all_genes" | Species=="Arabidopsis_R_genes")  
pdf(paste0(file,'At.pdf'), height=10, width=15)
ggplot(d_at, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_Lj <- subset(d, Species=="Lotus_all_gene" | Species=="Lotus_R_gene")
pdf(paste0(file,'Lj.pdf'), height=10, width=15)
ggplot(d_Lj, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_gm <- subset(d, Species=="Soybean_all_genes" | Species=="Soybean_R_genes")
pdf(paste0(file,'Gm.pdf'), height=10, width=15)
ggplot(d_gm, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_mt <- subset(d, Species=="Medicago_all_genes" | Species=="Medicago_R_genes")
pdf(paste0(file,'Mt.pdf'), height=10, width=15)
ggplot(d_mt, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_os <- subset(d, Species=="Rice_all_genes" | Species=="Rice_R_genes")
pdf(paste0(file,'Os.pdf'), height=10, width=15)
ggplot(d_os, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2) 
dev.off()

d_zm <- subset(d, Species=="Maize_all_genes" | Species=="Maize_R_genes")
pdf(paste0(file,'Zm.pdf'), height=10, width=15)
ggplot(d_zm, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2) 
dev.off()

d_la <- subset(d, Species=="Lupin_all_genes" | Species=="Lupin_R_genes")
pdf(paste0(file,'.La.pdf'), height=10, width=15)
ggplot(d_la, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2) 
dev.off()

d_la <- subset(d, Species=="Lupin_all_genes")
pdf(paste0(file,'.La1..pdf'), height=10, width=15)
ggplot(d_la, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2) 
dev.off()

d_br <- subset(d, Species=="Brassica_all_genes" | Species=="Brassica_R_genes")
pdf(paste0(file,'.Br.pdf'), height=10, width=15)
ggplot(d_br, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2) 
dev.off()

d_br$Exp_value <- d_br$Exp_value[!is.na(d_br$Exp_value)]

d_br_all <- subset(d_br, Species=="Brassica_all_genes")
d_br_r <- subset(d_br, Species=="Brassica_R_genes")

sum(abs(d_br_all$Exp_value))
sum(abs(d_br_r$Exp_value))

sum(d_br_r[(d_br_r$Exp_value < 0.6772557),3])

d_br_r_value <- d_br_r$Exp_value - mean(d_br_all$Exp_value)

sum(d_br_r_value[d_br_value<0])
sum(d_br_r_value[d_br_value>0])

max()
