library(rpart)
library(rpart.plot)
library('scales')
library(tree)
library(dplyr)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',2),rep('numeric',5))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

data <- filter(df, df$timeindex %in% c(1:40))
#data <- filter(df, df$timeindex %in% c(13:40))
names(data) 

#data_bf <- data.frame(data[,c(8:14)],data[,c(17:23)],data[,c(31:40)])
data_bf <- data.frame(data[,c(17:20)],data[,c(23:23)],data[,c(31:40)])
names(data_bf)[5] <- 'taughtfootcare'
names(data_bf)
dim(data_bf)
sum(is.na(data_bf))


data_bf[data_bf==199|data_bf==201]<-NA
data_bf[data_bf==5030353|data_bf==16665138]<-NA
sum(is.na(data_bf))

table(data_bf$timeindex)
table(data_bf$year)

#fulldata <- na.omit(data_bf$admitted)
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
                #+ betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + median 
                #+ pop
                + episode
                + ruca
                + timeindex
                #+ flushot + pnumococcal
                , 
                model=TRUE,
                data =fulldata,cp=0.002
                )
#0.002
#0.00019852
summary(model1)
rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)
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
                data =fulldata,cp=0.0018
)
# 0.0018
# 1.6548e-04
summary(model2)
printcp(model2)
rsq.rpart(model2)
rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)


table(fulldata$year)
table(fulldata$timeindex)




