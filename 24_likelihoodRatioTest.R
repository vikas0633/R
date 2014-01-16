d <- read.table('/Volumes/vgupta/01_genome_annotation/32_prank/02_AllGeneCandidates/08_PS_compare/20140106_lnL.txt', sep = ',')
diff_df = 1
colnames(d) <- c("LjID", "Control_lnL","Test_lnL")

d$diff.2 <- 2*abs(d$Test_lnL - d$Control_lnL)
d$p_value <- 1 - pchisq( d$diff.2 , df =  diff_df)

write.table(d, file='/Volumes/vgupta/01_genome_annotation/32_prank/02_AllGeneCandidates/08_PS_compare/20140106_lnL.p_value', sep="\t", row.names =F, quote = F)