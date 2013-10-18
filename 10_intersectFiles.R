library(utils)
#file1 <- read.table('~/Desktop/03_Lotus_annotation/2013_week35/snp.90.vcf',comment.char = "#")
file1 <- read.table(pipe("cut -f1,2 ~/Desktop/03_Lotus_annotation/2013_week35/20130905.snp.vcf.markers.snps.inbreed.ref| grep -v '^#' "),sep='\t')
dim(file1)
#file2 <- read.table('~/Desktop/03_Lotus_annotation/2013_week35/20130704_filtered_snps.txt',comment.char = "#")
file2 <- read.table(pipe("cut -f1,2 ~/Desktop/03_Lotus_annotation/2013_week35/20130704_filtered_snps.txt | grep -v '^#'"),sep='\t')
dim(file2)

### R 3.0.1
require(sqldf)

file1NotInfile2 <- sqldf('SELECT * FROM file1 EXCEPT SELECT * FROM file2')
dim(file1NotInfile2)

file2NotInfile1 <- sqldf('SELECT * FROM file2 EXCEPT SELECT * FROM file1')
dim(file2NotInfile1)

file1Infile2 <- sqldf('SELECT * FROM file1 INTERSECT SELECT * FROM file2')
dim(file1Infile2)

## make ven diagram
require(venneuler)
vd <- venneuler(c("GATK\n 1354323"=1354323, "Stig's SNP\n 1396838"=1396838, "GATK\n 1354323&Stig's SNP\n 1396838"=1012250))
plot(vd)


### R 2.15.3
library(VennDiagram)
# venn.plot <- venn.diagram(list("GATK\n 5521448"=1:5521448, "Stig's SNP\n 1396838" = 4164211:5561048), "SNPoverlap.tiff",col = "transparent",fill = c("cornflowerblue", "green"),height = 5000, width = 5000, resolution = 500,units = "px");

venn.plot <- venn.diagram(list("GATK\n 1,354,323"=1:1354323, "Cologne's SNP\n 1,396,838" = 342073:1738911), "SNPoverlap.tiff",col = "transparent",fill = c("cornflowerblue", "green"),
                          height = 5000, width = 5000, resolution = 500,units = "px");