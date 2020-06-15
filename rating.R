library(rpart)
library(rpart.plot)
library('scales')
library(tree)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',3),rep('numeric',4))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

#data <- data.frame(df[,c(7:14)],df[,c(16:40)])

#sum(is.na(df$episode[which(df$year==2018)])) ##44612
#dim(df[which(df$year==2018),])  ###46297

data <- data.frame(df[,c(7:14)],df[,c(16:32)],df[,c(34:37)],df[,c(39:40)]) ## no episode, no mean

fulldata <- na.omit(data)
dim(fulldata)


tree.model <- rpart(formula= rating ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + admitted + ER 
                #+ episode
                #+ year + season + timeindex
                #+ median + pop
                + ruca
                + flushot + pnumococcal
                ,
                data =fulldata,
                cp=0.01)

summary(tree.model)
rpart.plot(tree.model,digits=4,fallen.leaves=TRUE,type=4,extra=1)



lm.model <- lm(rating ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
               + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
               + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
               + admitted + ER 
               #+ episode
               #+ year + season + timeindex
               #+ median + pop
               + ruca
               + flushot + pnumococcal
               ,
               data =fulldata)
summary(lm.model)
