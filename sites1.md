
```r
d <- read.table("~/Desktop/07_degradome/20130826_merged.bam.annot", header = F)
head(d)
```

```
##       V1   V2  V3 V4   V5  V6             V7
## 1 chloro 8971  71 11 0.15 cds protein_coding
## 2 chloro 8981  91  7 0.08 cds protein_coding
## 3 chloro 9015 152  7 0.05 cds protein_coding
## 4 chloro 9018 158  7 0.04 cds protein_coding
## 5 chloro 9034 183  9 0.05 cds protein_coding
## 6 chloro 9038 196  6 0.03 cds protein_coding
```

```r

string1 <- paste(c(mean(d$V3), median(d$V3), mean(d$V4), median(d$V4)), sep = "\t")

d1 <- d[which(d$V5 > 0.7), ]
string2 <- paste(c(mean(d1$V3), median(d1$V3), mean(d1$V4), median(d1$V4)), 
    sep = "\t")


dr <- d[which(d$V7 == "rRNA"), ]
### total coverage
string3 <- paste(c(mean(dr$V3), median(dr$V3), mean(dr$V4), median(dr$V4)), 
    sep = "\t")

drs <- d[which(d$V5 > 0.7 & d$V7 == "rRNA"), ]
string4 <- paste(c(mean(drs$V3), median(drs$V3), mean(drs$V4), median(drs$V4)), 
    sep = "\t")


string <- (c("TotalCoverageMean", "TotalCoverageMedian", "StackCoverageMean", 
    "StackCoverageMedian"))
print(string1, quote = FALSE)
```

```
## [1] 1540.14567414515 626              23.519276147498  10
```

```r
print(string2, quote = FALSE)
```

```
## [1] 520.251728907331 29               448.146334716459 25
```

```r
print(string3, quote = FALSE)
```

```
## [1] 4649.49753183462 683              65.4539852224493 11
```

```r
print(string4, quote = FALSE)
```

```
## [1] 8149.56626506024 40               6218.84337349398 31
```

