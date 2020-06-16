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

#data <- df[,c(-16,-32)] ###rating is missing in 20101-20152 ER is missing in 20104-20123
data <- df[,c(-16,-32,-33)] ###rating is missing in 20101-20152 ER is missing in 20104-20123, also removed ER because its missing in 2018
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
                ,
                data =fulldata)
summary(lm.model0)

names(fulldata)
#names(fulldata)[c(31,35,37,38)]
names(fulldata)[c(34,36:37)]

set.seed(1)
#fit1 <- kmeans(fulldata[,c(31,35,37,38)], 9, nstart = 25)
fit1 <- kmeans(fulldata[,c(34,36:37)], 9, nstart = 25)
table(fit1$cluster)
fit1.data <- cbind(fulldata, cluster = fit1$cluster)

cluster1 <- fit1.data[which(fit1.data$cluster=='1'),]
cluster2 <- fit1.data[which(fit1.data$cluster=='2'),]
cluster3 <- fit1.data[which(fit1.data$cluster=='3'),]
cluster4 <- fit1.data[which(fit1.data$cluster=='4'),]
cluster5 <- fit1.data[which(fit1.data$cluster=='5'),]
cluster6 <- fit1.data[which(fit1.data$cluster=='6'),]
cluster7 <- fit1.data[which(fit1.data$cluster=='7'),]
cluster8 <- fit1.data[which(fit1.data$cluster=='8'),]
cluster9 <- fit1.data[which(fit1.data$cluster=='9'),]


lm.model1 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                ,
                data =cluster1)
summary(lm.model1)

lm.model2 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                ,
                data =cluster2)
summary(lm.model2)

lm.model3 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                ,
                data =cluster3)
summary(lm.model3)

lm.model4 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                ,
                data =cluster4)
summary(lm.model4)

lm.model5 <- lm(admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
                + type 
                + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + flushot + pnumococcal
                ,
                data =cluster5)
summary(lm.model5)







### cluster 2 is high episode,median,pop & low ruca (urban area)
summary(cluster1[,c(31,35,37,38)])
summary(cluster2[,c(31,35,37,38)])
summary(cluster3[,c(31,35,37,38)])
#summary(cluster1[,c(34,36:37)])
#summary(cluster2[,c(34,36:37)])


mean1 <- c(mean(cluster1$episode),mean(cluster1$median),mean(cluster1$pop),mean(cluster1$ruca))
mean2 <- c(mean(cluster2$episode),mean(cluster2$median),mean(cluster2$pop),mean(cluster2$ruca))
#mean1 <- c(mean(cluster1$median),mean(cluster1$pop),mean(cluster1$ruca))
#mean2 <- c(mean(cluster2$median),mean(cluster2$pop),mean(cluster2$ruca))
mean1
mean2



print(fit1)
# Centroid Plot against 1st 2 discriminant functions
plotcluster(fulldata[,c(31,36:38)], fit1$cluster)