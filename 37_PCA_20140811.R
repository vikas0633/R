#http://www.r-bloggers.com/using-r-two-plots-of-principal-component-analysis/

library(reshape2)
library(ggplot2)


sample.groups <- c(rep(1, 10), rep(2, 10), rep(3, 10),
                   rep(4, 10), rep(5, 10))
variable.groups <- c(rep(1, 10), rep(2, 10), rep(3, 10),
                     rep(4, 10), rep(5, 10), rep(6, 10),
                     rep(7, 10))

data <- matrix(nrow=length(sample.groups), ncol=70)
base.data <- matrix(nrow=length(sample.groups), ncol=7)



for (j in 1:ncol(base.data)) {
    mu <- rnorm(1, 0, 4)
    sigma <- runif(1, 5, 10)
    base.data[,j] <- sample.groups*mu +
        rnorm(length(sample.groups), 0, sigma)
}

for (j in 1:ncol(data)) {
    mu <- runif(1, 0, 4)
    data[,j] <- base.data[,variable.groups[j]] +
        rnorm(length(sample.groups), mu, 10)
}

pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/temp",'.pdf'), height=20, width=20)

qplot(x=Var1, y=Var2, data=melt(cor(data)), geom="tile",
                 fill=value)
dev.off()


pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/temp",'.pdf'), height=20, width=20)
pca <- prcomp(data, scale=T)
melted <- cbind(variable.groups, melt(pca$rotation[,1:9]))

barplot <- ggplot(data=melted) +
    geom_bar(aes(x=Var1, y=value, fill=variable.groups), stat="identity") +
    facet_wrap(~Var2)
barplot

dev.off()

pdf(paste0("/Users/vgupta/Desktop/35_simon_RNAseq/temp",'.pdf'), height=20, width=20)
scores <- data.frame(sample.groups, pca$x[,1:3])
pc1.2 <- qplot(x=PC1, y=PC2, data=scores, colour=factor(sample.groups),labels=sample.groups) +
    theme(legend.position="none")
pc1.3 <- qplot(x=PC1, y=PC3, data=scores, colour=factor(sample.groups)) +
    theme(legend.position="none")
pc2.3 <- qplot(x=PC2, y=PC3, data=scores, colour=factor(sample.groups)) +
    theme(legend.position="none")

pc1.2

dev.off()

