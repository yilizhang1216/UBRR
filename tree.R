library(rpart)
library(rpart.plot)
library('scales')
library(tree)
library(dplyr)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',2),rep('numeric',6))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','star','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

df$ruca[df$ruca==1] <- "Urban"
df$ruca[df$ruca!='Urban'] <- "Rural"
table(df$ruca)
dummyruca <- as.factor(df$ruca)
df$ruca <- dummyruca

df[df==199|df==201]<-NA
df[df==5030353|df==16665138]<-NA
sum(is.na(df))

names(df)
sum(is.na(df))

data_admitted <- data.frame(df[,c(17:20)],df[,c(23,31,33)],df[,c(35:41)])
names(data_admitted)
data_ER <- data.frame(df[,c(17:20)],df[,c(23,32,33)],df[,c(35:41)])
names(data_ER)

dim(data_admitted)
sum(is.na(data_admitted))
dim(data_ER)
sum(is.na(data_ER))


fulldata_admitted <- na.omit(data_admitted)
dim(fulldata_admitted)
fulldata_ER <- na.omit(data_ER)
dim(fulldata_ER)
table(fulldata_admitted$year)
table(fulldata_ER$year)


model1 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                #+ betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + median 
                #+ pop
                + episode
                + ruca
                + timeindex
                #+ flushot + pnumococcal
                , 
                model=TRUE,
                data =fulldata_admitted,cp=0.001
                )
#0.002
#0.00019852
summary(model1)
rpart.plot(model1,digits=10,fallen.leaves=TRUE,type=4,extra=1)
printcp(model1)
rsq.rpart(model1)


model2 <- rpart(formula= ER ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                #+ betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + median 
                #+ pop
                + episode
                + ruca
                + timeindex
                #+ flushot + pnumococcal
                , 
                model=TRUE,
                data =fulldata_ER,cp= 0.0008
                  #1.6548e-04
)
# 0.0018
# 1.6548e-04
rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)
summary(model2)
printcp(model2)
rsq.rpart(model2)


table(fulldata$year)
table(fulldata$timeindex)




