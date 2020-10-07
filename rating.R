library("nnet")
library(foreign)
library(ggplot2)
library(MASS)
library(Hmisc)
library(reshape2)
library(ordinal)
library(rms)

#source("plot.xmean.R")

mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',2),rep('numeric',6))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','star','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

#data <- data.frame(df[,c(7:14)],df[,c(16:40)])

#sum(is.na(df$episode[which(df$year==2018)])) ##44612
#dim(df[which(df$year==2018),])  ###46297
# 96.3%


#data <- data.frame(df[,c(8:14)],df[,c(17:20)],df[,c(23:37)],df[,41]) ## no episode, no mean, no median, no pop, no time, no flutshot& pnumo
#data <- data.frame(df[,c(8:14)],df[,c(17:20)],df[,c(23:41)])
data <- data.frame(df[,c(17:20,23,33:37,41)])
#data <- data.frame(df[,c(8:14,17:20,23,24:32,33:37,41)])
data[data==199|data==201]<-NA
data[data==5030353|data==16665138]<-NA
names(data)
dim(data)
#fulldata <- na.omit(data)
data$star[data$star %in% c('','Not Available')] <- NA
table(data$star)
data_1 <- na.omit(data)
table(data_1$star)

data_1 <- data[which(data$year %in% c(2016,2017,2018,2019)),]
data_2 <- data_1[which(data_1$star %in% c(1,2,3,4,5)),]
data_3 <- na.omit(data_2)
fulldata <- data_2
dim(fulldata)
table(fulldata$year)
table(fulldata$star)
fulldata$star <- factor(fulldata$star, levels = c("1", "2", "3", "4", "5"))
table(fulldata$star)

olr.model<- polr(star ~ timely 
                 + taughtdrugs 
                 + checkfall 
                 + checkdepression 
                 + taughtfootcare
                 + log1p(episode)
                 + timeindex
                 + ruca
         #+ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
         #+ betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
         #+ admitted + ER 
         #+ median 
         #+ pop
         #+ flushot + pnumococcal
         ,
         data =fulldata,
         Hess=TRUE)
summary(olr.model)

ctable <- coef(summary(olr.model))
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
ctable <- cbind(ctable, "p value" = p)
ctable
ci <- confint(olr.model)
ci
exp(coef(olr.model))
exp(cbind(OR = coef(olr.model), ci))
OR <- as.data.frame(exp(cbind(OR = coef(olr.model), ci)))
OR$CI <- OR$OR-OR$'2.5 %'
new_ctable <- cbind(ctable[c(1:8),c(1,2,4)],OR[,c(1,4)])
new_ctable
round(new_ctable,2)


par(mfrow=c(2,4))
plot.xmean.ordinaly(star ~ timely 
                    + taughtdrugs 
                    + checkfall 
                    + checkdepression 
                    + taughtfootcare
                    + log1p(episode)
                    + timeindex
                    + ruca,
                    data=fulldata,
                    cr=TRUE
                    #subn=FALSE,
                    #cex.points=.65
                    )



fulldata$star <- as.numeric(fulldata$star)



lm.model <- lm(star ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare
               #+ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
               #+ betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
               #+ admitted + ER 
               + episode
               + timeindex
               #+ median 
               #+ pop
               + ruca
               #+ flushot + pnumococcal
               ,
               data =fulldata)
summary(lm.model)




        
        
        