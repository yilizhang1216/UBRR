library(rpart)
library(rpart.plot)
library('scales')
library(tree)
library(dplyr)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',3),rep('numeric',4))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

#data <- filter(df, df$timeindex %in% c(4:12))
data <- filter(df, df$timeindex %in% c(13:40))
names(data) 

#data_bf <- data.frame(data[,c(8:14)],data[,c(17:32)],data[,c(34:37)],data[,39:40]) ## no episode, no mean, no rating
data_bf <- data.frame(data[,c(8:14)],data[,c(17:31)],data[,c(34:40)])
#names(data_bf)[26] <- 'ruca'
names(data_bf)
dim(data_bf)
sum(is.na(data_bf))


data_bf[data_bf==199|data_bf==201]<-NA
sum(is.na(data_bf))

table(data_bf$timeindex)
table(data_bf$year)

fulldata <- na.omit(data_bf)
dim(fulldata)

table(fulldata$timeindex)
table(fulldata$year)

fulldata$ruca[fulldata$ruca==1] <- "Urban"
fulldata$ruca[fulldata$ruca!='Urban'] <- "Rural"
table(fulldata$ruca)
dummyruca <- as.factor(fulldata$ruca)
fulldata$ruca <- dummyruca

dataRural <- fulldata[fulldata$ruca=='Rural',]
dataUrban <- fulldata[fulldata$ruca=='Urban',]



model1 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + median + pop
                + ruca
                + flushot + pnumococcal
                , 
                data =fulldata,cp=0.003
                )
summary(model1)
rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)

table(fulldata$timeindex)
table(fulldata$year)
table(fulldata$ruca)



