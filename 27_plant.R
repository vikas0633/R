library(ggplot2)
require(mgcv)
library(plyr)
library(gridExtra)

setwd('~/Desktop/temp/')

infile <- 'MGr3_early_relength_quant_single_root_images_Brat.txt'
d <- read.table(infile, header = TRUE, fill=TRUE)

pdf(paste0(infile,'.pdf'),height=30,width=20)
d <- d[,c(1,3,4,7,11)]
#pdf(paste0('sample','.pdf'))
head(d)
d$UniqueID <- paste(d$ACC_ID,d$plate,d$abs_pos,sep = '_') 

acce <- sort(as.character(unique(unlist(d[,1]))))

i = 1
plot = list() 
for (n in 1:length(acce)){
    ### process data for plotting here ####
    tmp_d <- d[which(acce[n]==d$ACC_ID),]
    print (n)
    print (i)
    plot[[i]] = ggplot(tmp_d, aes(x=day, y=total_length, col=UniqueID)) + geom_line(data=tmp_d,aes(x=day, y=total_length, col=UniqueID)) +theme_classic() + ylim(0,4000)
    if (i %% 50 == 0) { ## print 8 plots on a page
        print (do.call(grid.arrange,  plot))
        plot = list() # reset plot 
        i = 0 # reset index
    }
    i = i + 1
}
if (length(plot) != 0) { 
    print (do.call(grid.arrange,  plot))
}
dev.off()
