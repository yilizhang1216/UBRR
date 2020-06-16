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
data[data=='Y'] <- 'Yes'
data[data=='N'] <- 'No'
data[data==199|data==201]<-NA
data[data==5030353|data==16665138]<-NA

fulldata <- na.omit(data)
dim(fulldata)
table(fulldata$timeindex)
table(fulldata$year)

lm.model0 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                + episode + median + pop + ruca
                ,
                data =fulldata)
summary(lm.model0)

## cluster by outcome and utilization variables but no ER
names(fulldata)[c(23:30)]
set.seed(2)
fit2 <- kmeans(fulldata[,c(23:30)], 9, nstart = 25)
table(fit2$cluster)
#print(fit2)

fit2.data <- cbind(fulldata, cluster = fit2$cluster)
cluster1 <- fit2.data[which(fit2.data$cluster=='1'),]
cluster2 <- fit2.data[which(fit2.data$cluster=='2'),]
cluster3 <- fit2.data[which(fit2.data$cluster=='3'),]
cluster4 <- fit2.data[which(fit2.data$cluster=='4'),]
cluster5 <- fit2.data[which(fit2.data$cluster=='5'),]



lm.model1 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                + episode + median + pop + ruca
                ,
                data =cluster1)
summary(lm.model1)

lm.model2 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                + episode + median + pop + ruca
                ,
                data =cluster2)
summary(lm.model2)


### cluster 2 is high episode,median,pop & low ruca (urban area)
summary(cluster1[,c(23:30)])
summary(cluster2[,c(23:30)])


mean1 <- c(mean(cluster1$betterwalking),mean(cluster1$betterbed),mean(cluster1$betterbathing),mean(cluster1$lesspain),mean(cluster1$betterbreathing),mean(cluster1$betterheal),mean(cluster1$betterdrug),mean(cluster1$admitted))
mean2 <- c(mean(cluster2$betterwalking),mean(cluster2$betterbed),mean(cluster2$betterbathing),mean(cluster2$lesspain),mean(cluster2$betterbreathing),mean(cluster2$betterheal),mean(cluster2$betterdrug),mean(cluster2$admitted))
mean1
mean2






