
# create label locations for the data -- pretty values for the range [0, 35]

setwd('~/Desktop/100_Thesis/100_datafile/')

infile='sequencing_costs'

library(zoo)

yat <- pretty(c(0,10))

# add extra room to the left of the plot 
par(oma=c(0,2,0,0))

d <- read.table('sequencing_costs.txt', header=TRUE, sep='\t')

head(d)

pdf(paste0(infile,'.pdf'),height=5,width=10)

# plot, but don't label any of the axes
d <- d[complete.cases(d),]

d$date <- sapply(d$Date, FUN=as.yearmon, "%m-%y")

ratio <- max(d$Cost.per.Genome)/max(d$Cost.per.Mb)
ratio <- 20

d$Cost.per.Genome <- d$Cost.per.Genome/1000000
d$Cost.per.Mb <- d$Cost.per.Mb/1000

plot(x=d$date, y=d$Cost.per.Genome, ylim=c(0,100),col='green', type='l',main='Genome cost over time', xlab='',ylab='',xaxt='n', yaxt='n', lwd=3.75)


points(x=d$date, y=d$Cost.per.Genome, col='green', type='p', lwd=2.5)
# manually label axis 2, left, with the ratio calculated above times our manual label locations
axis(2, col='green', at=ratio*yat, labels=ratio*yat, las=2, lwd=2.5)
#mtext(side=2, line=0.5, 'Price ($1,000,000)')
# tell R t draw over the current plot with a new one
par(new=T)
plot(x=d$date, y=d$Cost.per.Mb, ylim=c(0,10),col='red', type='l', lwd=3.5,xaxt='n', axes=F, xlab='',ylab='')

points(x=d$date, y=d$Cost.per.Mb, col='red', type='p', lwd=2.5)
# label the yahoo data
axis(side=2, at=yat, labels=yat, col='red', line=2, las=2,lwd=2.5)

# manually label, farther out than normal, the Y axis
#mtext(side=2, line=4, 'Price ($1,000)')

# this code proceeds as in part 6 to neatly label the X axis
# put X axis labels on first date present in each quarter
axis(side=1, at=d$date,  labels=as.yearmon(d$date), las=2)
#abline(v=d$date, col='grey', lwd=0.01)

legend('topright', legend=c('Cost per genome (in $1,000,000)', 'Cost per base             (in $1,000)'), col=c(rep('green',1), rep('red', 1)), lwd=c(3.5, 3.5))

dev.off()