setwd('~/Desktop/03_Lotus_annotation/2013_week50/')

###getcommandlinearguments
args<-commandArgs(trailingOnly=TRUE)

###setworkingdirectory,infileandnumberofrowsarguments

#infile=args[1]
infile="~/Desktop/03_Lotus_annotation/2013_week50/20130802_Lj30.gff3.lore1.genes.protein_coding.processed_transcript.mod"
library(ggplot2)
require(grid)
vp.layout <- function(x, y) viewport(layout.pos.row=x, layout.pos.col=y)
arrange_ggplot2 <- function(..., nrow=NULL, ncol=NULL, as.table=FALSE) {
  dots <- list(...)
  n <- length(dots)
  if(is.null(nrow) & is.null(ncol)) { nrow = floor(n/2) ; ncol = ceiling(n/nrow)}
  if(is.null(nrow)) { nrow = ceiling(n/ncol)}
  if(is.null(ncol)) { ncol = ceiling(n/nrow)}
  ## NOTE see n2mfrow in grDevices for possible alternative
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(nrow,ncol,heights=unit(0.14, "npc")) ) )
  ii.p <- 1
  for(ii.row in seq(1, nrow)){
    ii.table.row <- ii.row  
    if(as.table) {ii.table.row <- nrow - ii.table.row + 1}
    for(ii.col in seq(1, ncol)){
      ii.table <- ii.p
      if(ii.p > n) break
      print(dots[[ii.table]], vp=vp.layout(ii.table.row, ii.col))
      ii.p <- ii.p + 1
    }
  }
}

pdf(paste0(infile,'.pdf'),height=10,width=20)
Lj_chr=c("chr0","chr1","chr2","chr3","chr4","chr5","chr6")
#Lj_chr=c("chloro")
d<-read.table(infile,header=F)
head(d)
names(d) <- c("chro","pos","freq","type")
head(d)

d <- subset(d, freq>0)
y_lim = 3000

#geom_point(alpha = 0.7,size=1)

tmp_chr0<-d[which(Lj_chr[1]==d$chro),]
tmp_chr0<-tmp_chr0[which(tmp_chr0$pos <= 191700000),]
plot1 <- ggplot(tmp_chr0, aes(x=pos,y = freq, colour=type)) + geom_line() +theme_classic()+guides(fill=guide_legend(reverse=TRUE)) + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank())  +scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(1, 0, 0, 0.75), "lines"))+ xlim(0, 200000000) + ylim(0,y_lim)

tmp_chr1<-d[which(Lj_chr[2]==d$chro),]
tmp_chr1<-tmp_chr1[which(tmp_chr1$pos <= 61500000),]
plot2 <- ggplot(tmp_chr1, aes(x=pos,y = freq, colour=type)) + geom_line() +guides(fill=guide_legend(reverse=TRUE))+theme_classic() + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank())  + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))+ xlim(0, 200000000) + ylim(0,y_lim)


tmp_chr2<-d[which(Lj_chr[3]==d$chro),]
tmp_chr2<-tmp_chr2[which(tmp_chr2$pos <= 42800000),]
plot3<-ggplot(tmp_chr2, aes(x=pos,y = freq, colour=type)) + geom_line() +  guides(fill=guide_legend(reverse=TRUE))+theme_classic() + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank())  + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))+ xlim(0, 200000000) + ylim(0,y_lim)
#+ theme(legend.position = "none")


tmp_chr3<-d[which(Lj_chr[4]==d$chro),]
tmp_chr3<-tmp_chr3[which(tmp_chr3$pos <= 45000000),]
plot4<-ggplot(tmp_chr3, aes(x=pos,y = freq, colour=type)) + geom_line() + guides(fill=guide_legend(reverse=TRUE))+theme_classic()+ theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank())  + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0), "lines")) + xlim(0, 200000000) + ylim(0,y_lim)

tmp_chr4<-d[which(Lj_chr[5]==d$chro),]
tmp_chr4<-tmp_chr4[which(tmp_chr4$pos <= 41700000),]
plot5<-ggplot(tmp_chr4, aes(x=pos,y = freq, colour=type)) + geom_line() + guides(fill=guide_legend(reverse=TRUE))+theme_classic()+theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank())  + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines")) + xlim(0, 200000000) + ylim(0,y_lim)
#+ theme(legend.position = "none")

tmp_chr5<-d[which(Lj_chr[6]==d$chro),]
tmp_chr5<-tmp_chr5[which(tmp_chr5$pos <= 33500000),]
plot6<-ggplot(tmp_chr5, aes(x=pos,y = freq, colour=type)) + geom_line() +guides(fill=guide_legend(reverse=TRUE))+theme_classic() + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines")) + xlim(0, 200000000) + ylim(0,y_lim)
#+ theme(legend.position = "none") 

tmp_chr6<-d[which(Lj_chr[7]==d$chro),]
tmp_chr6<-tmp_chr6[which(tmp_chr6$pos <= 26000000),]
plot7<-ggplot(tmp_chr6, aes(x=pos,y = freq, colour=type)) + geom_line() +guides(fill=guide_legend(reverse=TRUE))+theme_classic()+ theme(axis.title.y=element_blank(),axis.line=element_blank()) + xlab("Position")  + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines")) + theme(axis.title.y=element_blank()) + xlim(0, 200000000) + ylim(0,y_lim)
#+ theme(legend.position = "none")

arrange_ggplot2(plot1,plot2,plot3,plot4,plot5,plot6,plot7,ncol=1)

dev.off()
