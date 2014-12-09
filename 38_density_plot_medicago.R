
### Example
library(ggplot2)

### make expression ratio density map
file='/Volumes/nfdfs/03_Lotus_annotation/38_All_Species_protein_sequences/03_Medicago//03_all_shoots//20141008_22_Medicago_expression.txt'
d <- read.table(file,header=FALSE, sep = '\t')
colnames(d) <- c("Gene_ID", "Species","Exp_value") 
d$Exp_value <- as.numeric(as.character(d$Exp_value))


d_at <- subset(d, Species=="Root_Shoot_all" | Species=="Root_Shoot_r")  
pdf(paste0(file,'.root_shoot.pdf'), height=10, width=15)
ggplot(d_at, aes(Exp_value, fill = Species)) + 
    geom_density(alpha = 0.2)
dev.off()

d_at <- subset(d, Species=="Nod_all" | Species=="Nod_r")  
pdf(paste0(file,'.nod.pdf'), height=10, width=15)
ggplot(d_at, aes(Exp_value, fill = Species)) + 
  geom_density(alpha = 0.2)
dev.off()

