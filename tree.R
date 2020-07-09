library(rpart)
library(rpart.plot)
library('scales')
library(tree)
library(dplyr)
library(Rmisc)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',18),rep('factor',2),rep('numeric',6))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','ER','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER','episode','star','year','season','timeindex','median','mean','pop','ruca')
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


data <- data.frame(df[,c(17:20)],df[,c(23,31,32,33)],df[,c(35:41)])
ruca.num <- c()
ruca.num[data$ruca=="Urban"] <- 1
ruca.num[data$ruca=='Rural'] <- 0
table(ruca.num)
data$ruca.num <- ruca.num

calc.names <- c(1,2,3,4,5,6,7,8,12,16)
years <- c(2010:2019)
for (i in calc.names) {
buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
#buff.std <- c()
for (j in years) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,][,i]),0.95)[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,][,i]),0.95)[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,][,i]),0.95)[3])
  #buff.std <- c(buff.std,sqrt(var(na.omit(data[data$year==j,][,i]))))
}
plot(years,buff.mean,type='l',xlab='year',ylab=names(data)[i])
lines(years,buff.upper,lty=2)
lines(years,buff.lower,lty=2)
}






buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$taughtdrugs))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$taughtdrugs))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$taughtdrugs))[3])
  assign(paste("taughtdrugs","mean", sep = "."), buff.mean)
  assign(paste("taughtdrugs","upper", sep = "."), buff.upper)
  assign(paste("taughtdrugs","lower",  sep = "."), buff.lower)
}
plot(taughtdrugs.mean,type="l")
lines(taughtdrugs.upper,lty=2)
lines(taughtdrugs.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$checkfall))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$checkfall))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$checkfall))[3])
  assign(paste("checkfall","mean", sep = "."), buff.mean)
  assign(paste("checkfall","upper", sep = "."), buff.upper)
  assign(paste("checkfall","lower",  sep = "."), buff.lower)
}
plot(checkfall.mean,type="l")
lines(checkfall.upper,lty=2)
lines(checkfall.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$checkdepression))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$checkdepression))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$checkdepression))[3])
  assign(paste("checkdepression","mean", sep = "."), buff.mean)
  assign(paste("checkdepression","upper", sep = "."), buff.upper)
  assign(paste("checkdepression","lower",  sep = "."), buff.lower)
}
plot(checkdepression.mean,type="l")
lines(checkdepression.upper,lty=2)
lines(checkdepression.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$taughtfootcare))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$taughtfootcare))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$taughtfootcare))[3])
  assign(paste("taughtfootcare","mean", sep = "."), buff.mean)
  assign(paste("taughtfootcare","upper", sep = "."), buff.upper)
  assign(paste("taughtfootcare","lower",  sep = "."), buff.lower)
}
plot(taughtfootcare.mean,type="l")
lines(taughtfootcare.upper,lty=2)
lines(taughtfootcare.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$admitted))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$admitted))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$admitted))[3])
  assign(paste("admitted","mean", sep = "."), buff.mean)
  assign(paste("admitted","upper", sep = "."), buff.upper)
  assign(paste("admitted","lower",  sep = "."), buff.lower)
}
plot(admitted.mean,type="l")
lines(admitted.upper,lty=2)
lines(admitted.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$ER))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$ER))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$ER))[3])
  assign(paste("ER","mean", sep = "."), buff.mean)
  assign(paste("ER","upper", sep = "."), buff.upper)
  assign(paste("ER","lower",  sep = "."), buff.lower)
}
plot(ER.mean,type="l")
lines(ER.upper,lty=2)
lines(ER.lower,lty=2)

buff.mean <- c()
buff.upper <- c()
buff.lower <- c()
for (j in c(2010:2019)) {
  buff.mean <- c(buff.mean,CI(na.omit(data[data$year==j,]$median))[2])
  buff.upper <- c(buff.upper,CI(na.omit(data[data$year==j,]$median))[1])
  buff.lower <- c(buff.lower,CI(na.omit(data[data$year==j,]$median))[3])
  assign(paste("median","mean", sep = "."), buff.mean)
  assign(paste("median","upper", sep = "."), buff.upper)
  assign(paste("median","lower",  sep = "."), buff.lower)
}
plot(median.mean,type="l")
lines(median.upper,lty=2)
lines(median.lower,lty=2)
