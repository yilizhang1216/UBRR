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

data <- data.frame(df[,c(1:32)],df[,c(34:36)],df[,40])

data[data==199|data==201]<-NA

fulldata <- df[!is.na(df$ruca),]
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

table(fulldata$ruca)[2]/table(fulldata$ruca)[1] ###3.222958

ratio <- c()
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2010'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2010'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2011'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2011'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2012'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2012'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2013'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2013'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2014'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2014'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2015'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2015'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2016'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2016'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2017'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2017'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2018'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2018'),]$ruca)[1])
ratio <-c(ratio,table(fulldata[which(fulldata$year=='2019'),]$ruca)[2]/table(fulldata[which(fulldata$year=='2019'),]$ruca)[1])

plot(ratio)

rural <- c()
rural <-c(rural,table(fulldata[which(fulldata$year=='2010'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2011'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2012'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2013'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2014'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2015'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2016'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2017'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2018'),]$ruca)[1])
rural <-c(rural,table(fulldata[which(fulldata$year=='2019'),]$ruca)[1])

plot(rural)

urban <- c()
urban <-c(urban,table(fulldata[which(fulldata$year=='2010'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2011'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2012'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2013'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2014'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2015'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2016'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2017'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2018'),]$ruca)[2])
urban <-c(urban,table(fulldata[which(fulldata$year=='2019'),]$ruca)[2])

plot(urban)

(sum(is.na(dataUrban))/dim(dataUrban)[1])/(sum(is.na(dataRural))/dim(dataRural)[1])  ### 1.42074

ratioNA <- c()
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2010'),]))/dim(dataUrban[which(dataUrban$year=='2010'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2010'),]))/dim(dataRural[which(dataRural$year=='2010'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2011'),]))/dim(dataUrban[which(dataUrban$year=='2011'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2011'),]))/dim(dataRural[which(dataRural$year=='2011'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2012'),]))/dim(dataUrban[which(dataUrban$year=='2012'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2012'),]))/dim(dataRural[which(dataRural$year=='2012'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2013'),]))/dim(dataUrban[which(dataUrban$year=='2013'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2013'),]))/dim(dataRural[which(dataRural$year=='2013'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2014'),]))/dim(dataUrban[which(dataUrban$year=='2014'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2014'),]))/dim(dataRural[which(dataRural$year=='2014'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2015'),]))/dim(dataUrban[which(dataUrban$year=='2015'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2015'),]))/dim(dataRural[which(dataRural$year=='2015'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2016'),]))/dim(dataUrban[which(dataUrban$year=='2016'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2016'),]))/dim(dataRural[which(dataRural$year=='2016'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2017'),]))/dim(dataUrban[which(dataUrban$year=='2017'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2017'),]))/dim(dataRural[which(dataRural$year=='2017'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2018'),]))/dim(dataUrban[which(dataUrban$year=='2018'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2018'),]))/dim(dataRural[which(dataRural$year=='2018'),])[1]))
ratioNA <- c(ratioNA,(sum(is.na(dataUrban[which(dataUrban$year=='2019'),]))/dim(dataUrban[which(dataUrban$year=='2019'),])[1])/(sum(is.na(dataRural[which(dataRural$year=='2019'),]))/dim(dataRural[which(dataRural$year=='2019'),])[1]))

plot(ratioNA)


urbanNA <- c()
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2010'),]))/dim(dataUrban[which(dataUrban$year=='2010'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2011'),]))/dim(dataUrban[which(dataUrban$year=='2011'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2012'),]))/dim(dataUrban[which(dataUrban$year=='2012'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2013'),]))/dim(dataUrban[which(dataUrban$year=='2013'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2014'),]))/dim(dataUrban[which(dataUrban$year=='2014'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2015'),]))/dim(dataUrban[which(dataUrban$year=='2015'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2016'),]))/dim(dataUrban[which(dataUrban$year=='2016'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2017'),]))/dim(dataUrban[which(dataUrban$year=='2017'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2018'),]))/dim(dataUrban[which(dataUrban$year=='2018'),])[1]))
urbanNA <- c(urbanNA,(sum(is.na(dataUrban[which(dataUrban$year=='2019'),]))/dim(dataUrban[which(dataUrban$year=='2019'),])[1]))

plot(urbanNA)


ruralNA <- c()
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2010'),]))/dim(dataRural[which(dataRural$year=='2010'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2011'),]))/dim(dataRural[which(dataRural$year=='2011'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2012'),]))/dim(dataRural[which(dataRural$year=='2012'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2013'),]))/dim(dataRural[which(dataRural$year=='2013'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2014'),]))/dim(dataRural[which(dataRural$year=='2014'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2015'),]))/dim(dataRural[which(dataRural$year=='2015'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2016'),]))/dim(dataRural[which(dataRural$year=='2016'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2017'),]))/dim(dataRural[which(dataRural$year=='2017'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2018'),]))/dim(dataRural[which(dataRural$year=='2018'),])[1]))
ruralNA <- c(ruralNA,(sum(is.na(dataRural[which(dataRural$year=='2019'),]))/dim(dataRural[which(dataRural$year=='2019'),])[1]))

plot(ruralNA)



deltaNA <- c()
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2010'),]))/dim(dataUrban[which(dataUrban$year=='2010'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2010'),]))/dim(dataRural[which(dataRural$year=='2010'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2011'),]))/dim(dataUrban[which(dataUrban$year=='2011'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2011'),]))/dim(dataRural[which(dataRural$year=='2011'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2012'),]))/dim(dataUrban[which(dataUrban$year=='2012'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2012'),]))/dim(dataRural[which(dataRural$year=='2012'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2013'),]))/dim(dataUrban[which(dataUrban$year=='2013'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2013'),]))/dim(dataRural[which(dataRural$year=='2013'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2014'),]))/dim(dataUrban[which(dataUrban$year=='2014'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2014'),]))/dim(dataRural[which(dataRural$year=='2014'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2015'),]))/dim(dataUrban[which(dataUrban$year=='2015'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2015'),]))/dim(dataRural[which(dataRural$year=='2015'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2016'),]))/dim(dataUrban[which(dataUrban$year=='2016'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2016'),]))/dim(dataRural[which(dataRural$year=='2016'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2017'),]))/dim(dataUrban[which(dataUrban$year=='2017'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2017'),]))/dim(dataRural[which(dataRural$year=='2017'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2018'),]))/dim(dataUrban[which(dataUrban$year=='2018'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2018'),]))/dim(dataRural[which(dataRural$year=='2018'),])[1]))
deltaNA <- c(deltaNA,(sum(is.na(dataUrban[which(dataUrban$year=='2019'),]))/dim(dataUrban[which(dataUrban$year=='2019'),])[1])-(sum(is.na(dataRural[which(dataRural$year=='2019'),]))/dim(dataRural[which(dataRural$year=='2019'),])[1]))

plot(deltaNA)


