require(venneuler)
v <- venneuler(c("Cufflinks\n 64666"=64666, "GMAP\n 7690"=7690, "Augustus\n 33683"=33683, "Glimmer\n 52751"=52751, 
                 "GeneMark\n 98771"=98771, "Cufflinks\n 64666&GMAP\n 7690"=4000 ))

#v$labels <- c("a")
plot(v)

vd <- venneuler(c(A=0.3, B=0.3, C=1.1, "A&B"=0.1, "A&C"=0.2, "B&C"=0.1 ,"A&B&C"=0.1))
plot(vd)

m <- data.frame(elements=c("1","2","2","2","3"), sets=c("A","A","B","C","C"))
v <- venneuler(m)
plot(v)
m <- as.matrix(data.frame(A=c(1.5, 0.2, 0.4, 0, 0),
                          B=c(0  , 0.2, 0  , 1, 0),
                          C=c(0  , 0  , 0.3, 0, 1)))
# without weights
v <- venneuler(m > 0, labels='1')
plot(v)
# with weights
v <- venneuler(m)
plot(v)


### vennerable
install.packages("Vennerable", repos="http://R-Forge.R-project.org")
install.packages(c("graph", "RBGL"), dependencies=TRUE)
install.packages("Vennerable")
library(Vennerable)

##http://www.inside-r.org/packages/cran/VennDiagram/docs/venn.diagram
install.packages("VennDiagram")
library(VennDiagram)

venn.diagram(x, filename, height = 3000, width = 3000, resolution = 500,
             units = "px", compression = "lzw", na = "stop", main = "", sub = "",
             main.pos = c(0.5, 1.05), main.fontface = "plain", main.fontfamily = "serif",
             main.col = "black", main.cex = 1, main.just = c(0.5, 1),
             sub.pos = c(0.5, 1.05), sub.fontface = "plain", sub.fontfamily = "serif",
             sub.col = "black", sub.cex = 1, sub.just = c(0.5, 1),
             category.names = names(x), force.unique = TRUE, ...);

venn.plot <- venn.diagram(list(A = 1:150, B = 121:170), "Venn_2set_simple.tiff");
venn.plot <- venn.diagram(list(A = 1:150, B = 121:170, C = 101:200), "Venn_3set_simple.tiff");

