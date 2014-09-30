
### You can change the following
file='/Volumes/Pmg/DennisBH/20140320_root_merged.bam.sites.1'

### fill the positions in the chromosome:positions format
center_position=c('chr3:38925540','chr0:38365260','chr2:28137370','chr1:54397020')

### fill the bases you want to plot both side
flanking_region=1000










#### Don't change
library(scales)
tiff(paste0(file,".tiff"),width = 10, height = 5, units = 'in', res = 300)
col_list <- c("red","green","blue","purple","yellow","black","orange","voilet")
plot (c(-1*flanking_region,flanking_region),c(0,1),type="n", xlab="position", ylab='Cleavage signal')
d <- read.table(file, sep = '\t', header = T)

cols <- c()
for (p in 1:length(center_position)){ 
    print(p)
a <- unlist(strsplit(center_position[p],":"))
st=as.numeric(a[2])-flanking_region
en=as.numeric(a[2])+flanking_region
print(a[2])
d2 <- c(rep(0,en-st+1))
for (j in st:en)
{ 
    
    if (length(which(as.numeric(d$POS)==as.numeric(j) & d[,1]==a[1]))>0)
    {  
    d2[j-st] <- as.numeric(d[which(as.numeric(d$POS)==as.numeric(j) & d[,1]==a[1]),3])
    }
}


print (col_list[p])
lines(c(seq(-1*flanking_region+1,flanking_region+1)),d2,col=alpha(col_list[p],0.6), lwd=2)
cols <- c(cols, col_list[p])
}

legend(0.5*flanking_region,1, center_position,lty=c(1,1),lwd=c(2.5,2.5),col=c(cols))


dev.off()

