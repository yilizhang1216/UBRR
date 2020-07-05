mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',2),rep('numeric',6))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','star','year','season','timeindex','median','mean','pop','ruca')
df <- read.csv("input/HHA2010-2019.csv",sep=',',colClasses=mytypes)
dim(df)
names(df)

#data <- data.frame(df[,c(7:14)],df[,c(16:40)])

#sum(is.na(df$episode[which(df$year==2018)])) ##44612
#dim(df[which(df$year==2018),])  ###46297
# 96.3%


data <- data.frame(df[,c(8:14)],df[,c(17:20)],df[,c(23:37)],df[,41]) ## no episode, no mean, no median, no pop, no time, no flutshot& pnumo
names(data)[27] <- 'ruca'
data[data==199|data==201]<-NA
data[data==5030353|data==16665138]<-NA
names(data)
#fulldata <- na.omit(data)
data_1 <- data[which(data$year %in% c(2016,2017,2018,2019)),]
fulldata <- data_1
dim(fulldata)
table(fulldata$year)


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




        
        
        