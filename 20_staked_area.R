###getcommandlinearguments
args<-commandArgs(trailingOnly=TRUE)

###setworkingdirectory,infileandnumberofrowsarguments

#infile=args[1]
infile="/Users/vgupta/Desktop/03_Lotus_annotation/2013_week50/20131210_gene_type.txt.w1000000.s100000"
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
#d<-data.frame(t=rep(0:23,each=4),var=rep(LETTERS[1:4],4),val=round(runif(4*24,0,50)))
#head(d,10)
#ggplot(d,aes(x=t,y=val,group=var,fill=var))+geom_area(position="fill")

pdf(paste0(infile,'.pdf'),height=10,width=20)
Lj_chr=c("chr0","chr1","chr2","chr3","chr4","chr5","chr6")
#Lj_chr=c("chr1")
#max_chr_length=200000000
#par(mfrow=c(1,1),mar=c(5.5,7.5,3.5,3.5),oma=c(1,2,1,1))
d<-read.table(infile,header=F)
head(d)
d<- d[which(d$V3!="fragmented"),]

d1<-d[,c(2,3,4)]
lv<-factor(tmp_chr2$V3,levels=sample(levels(tmp_chr2$V3)))#Lookthedifferenceinthefactorsorder

tmp_chr0<-d[which(Lj_chr[1]==d$V1),]
tmp_chr0$V3 <- factor(tmp_chr0$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot1<-ggplot(tmp_chr0,aes(x=tmp_chr0$V2,y=tmp_chr0$V4,fill=tmp_chr0$V3,order=tmp_chr0$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+ylab("Gene type density")+scale_fill_discrete(name="GeneType") + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(1, 0, 0, 0.75), "lines"))
#+ theme(legend.position = "none")

tmp_chr1<-d[which(Lj_chr[2]==d$V1),]
tmp_chr1$V3 <- factor(tmp_chr1$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot2<-ggplot(tmp_chr1,aes(x=tmp_chr1$V2,y=tmp_chr1$V4,fill=tmp_chr1$V3,order=tmp_chr1$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+scale_fill_discrete(name="GeneType") + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))
#+ theme(legend.position = "none")

tmp_chr2<-d[which(Lj_chr[3]==d$V1),]
tmp_chr2$V3 <- factor(tmp_chr2$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot3<-ggplot(tmp_chr2,aes(x=tmp_chr2$V2,y=tmp_chr2$V4,fill=tmp_chr2$V3,order=tmp_chr2$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+scale_fill_discrete(name="GeneType") + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))
#+ theme(legend.position = "none")


tmp_chr3<-d[which(Lj_chr[4]==d$V1),]
tmp_chr3$V3 <- factor(tmp_chr3$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot4<-ggplot(tmp_chr3,aes(x=tmp_chr3$V2,y=tmp_chr3$V4,fill=tmp_chr3$V3,order=tmp_chr3$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+ylab("Gene type density")+scale_fill_discrete(name="GeneType")+ theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0), "lines"))

tmp_chr4<-d[which(Lj_chr[5]==d$V1),]
tmp_chr4$V3 <- factor(tmp_chr4$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot5<-ggplot(tmp_chr4,aes(x=tmp_chr4$V2,y=tmp_chr4$V4,fill=tmp_chr4$V3,order=tmp_chr4$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+scale_fill_discrete(name="GeneType") + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))
#+ theme(legend.position = "none")

tmp_chr5<-d[which(Lj_chr[6]==d$V1),]
tmp_chr5$V3 <- factor(tmp_chr5$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot6<-ggplot(tmp_chr5,aes(x=tmp_chr5$V2,y=tmp_chr5$V4,fill=tmp_chr5$V3,order=tmp_chr5$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+scale_fill_discrete(name="GeneType") + theme(axis.title.x=element_blank(),axis.line=element_blank(),axis.text.x=element_blank(),axis.title.y=element_blank()) + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines"))
#+ theme(legend.position = "none") 

tmp_chr6<-d[which(Lj_chr[7]==d$V1),]
tmp_chr6$V3 <- factor(tmp_chr6$V3, levels = c("protein_coding","repeat","NULL","rRNA","tRNA"))
plot7<-ggplot(tmp_chr6,aes(x=tmp_chr6$V2,y=tmp_chr6$V4,fill=tmp_chr6$V3,order=tmp_chr6$V3))+geom_area(position="fill")+guides(fill=guide_legend(reverse=TRUE))+theme_classic()+xlab("Position")+scale_fill_discrete(name="GeneType") + xlim(0, 200000000) + scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) + theme(plot.margin= unit(c(0, 0, 0, 0.75), "lines")) + theme(axis.title.y=element_blank())
#+ theme(legend.position = "none")

arrange_ggplot2(plot1,plot2,plot3,plot4,plot5,plot6,plot7,ncol=1)

dev.off()