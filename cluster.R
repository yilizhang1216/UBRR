library("cluster")
library("factoextra")
library("magrittr")
library(fpc)
library(NbClust)

mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',3),rep('numeric',4))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

data <- df[,c(-16,-32)] ###rating is missing in 20101-20152 ER is missing in 20104-20123
data[data==199|data==201]<-NA

fulldata <- na.omit(data)
dim(fulldata)
table(fulldata$timeindex)
table(fulldata$year)


## cluster by episode, median, pop,ruca
set.seed(1)
fit1 <- kmeans(fulldata[,c(31,36:38)], 2, nstart = 25)
table(fit1$cluster)
print(fit1)

fit1.data <- cbind(fulldata, cluster = fit1$cluster)

# Centroid Plot against 1st 2 discriminant functions
plotcluster(fulldata[,c(31,36:38)], fit1$cluster)

## cluster by outcome and utilization variables but no ER

## select the best number of cluster
set.seed(0)
fviz_nbclust(df, kmeans, nstart = 25,  method = "gap_stat", nboot = 1)+
labs(subtitle = "Gap statistic method")

set.seed(2)
fit2 <- kmeans(fulldata[,c(23:30)], 4, nstart = 25)
table(fit2$cluster)
print(fit2)

fit2.data <- cbind(fulldata, cluster = fit2$cluster)

# Centroid Plot against 1st 2 discriminant functions
plotcluster(fulldata[,c(31,36:38)], fit2$cluster)









