library(rpart)
library(rpart.plot)

mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),16),'character','factor')
df <- read.csv("HHA2014-2018(nosize).csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','note','year')

names(df)
dim(df)
feq <- table(df$CCN)

table(df$type)

levels(df$type)

levels(df$type) <- c('1','2','3','4','5','6','7','8','9','10','11','12','13')

levels(df$type)

table(df$type)

income <- read.table("MedianIncome.csv",head=TRUE,sep=",",colClasses=c('factor','integer','character','integer'))

income$Mean[income$Mean=="."] <- NA

income$Mean <- as.integer(income$Mean)


merg <- merge(df,income,by="Zip")
ruca <- read.csv("RUCAfile.csv",head=TRUE,sep=",",colClasses=c('factor','factor','double','double','factor'))
names(ruca)[1] <- 'Zip'
names(ruca)[3] <- 'RUCA'
ruca <- ruca[,c(1,3)]
merg <- merge(merg,ruca,by='Zip')
merg$RUCA <- floor(merg$RUCA)
names(merg)
head(merg)
dim(merg)

data <- merg[,c(-7:-4,-2,-1,-15,-17,-19,-21,-23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-48)]

fulldata <- na.omit(data)
dim(fulldata)

feq <- table(fulldata$CCN)

bigMedian <- max(fulldata$Median)
vectorMedian <- fulldata$Median
fulldata$Median <- vectorMedian/bigMedian

bigPop <- max(fulldata$Pop)
vectorPop <- fulldata$Pop
fulldata$Pop <- vectorPop/bigPop

fulldata$RUCA[fulldata$RUCA==1] <- "Urban"
fulldata$RUCA[fulldata$RUCA!='Urban'] <- "Rural"
table(fulldata$RUCA)
dummyRUCA <- as.factor(fulldata$RUCA)
fulldata$RUCA <- dummyRUCA

dataRural <- fulldata[fulldata$RUCA=='Rural',]
dataUrban <- fulldata[fulldata$RUCA=='Urban',]




model1 <- rpart(formula= admitted ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + RUCA, data =fulldata,cp=0.005)
summary(model1)
pdf("plot/admitted_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model2 <- rpart(formula= urgent ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + RUCA, data =fulldata,cp=0.01)
summary(model2)
pdf("plot/urgent_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model3 <- rpart(formula= admitted ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataUrban,cp=0.0075)
summary(model3)
pdf("plot/admitted_urbandata.pdf",width=6,height=4,paper='special')
rpart.plot(model3,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model4 <- rpart(formula= urgent ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataUrban,cp=0.008)
summary(model4)
pdf("plot/urgent_urbandata.pdf",width=6,height=4,paper='special')
rpart.plot(model4,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model5 <- rpart(formula= admitted ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataRural,cp=0.003)
summary(model5)
pdf("plot/admitted_ruraldata.pdf",width=6,height=4,paper='special')
rpart.plot(model5,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model6 <- rpart(formula= urgent ~ type + off.nursing + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataRural,cp=0.005)
summary(model6)
pdf("plot/urgent_ruraldata.pdf",width=6,height=4,paper='special')
rpart.plot(model6,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()


## no characteristics
## model0 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA, data =fulldata,cp=0.005)
## rpart.plot(model0,digits=8,fallen.leaves=TRUE,type=4)

## model1 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + RUCA, data =fulldata,cp=0.0098)
## summary(model1)
## rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)


## model2 <- rpart(formula= urgent ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + RUCA, data =fulldata,cp=0.012)
## summary(model2)
## rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)


## par(mfrow=c(2,2))

## model3 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataUrban,cp=0.005)
## summary(model3)
## rpart.plot(model3,digits=4,fallen.leaves=TRUE,type=4,extra=1)


## model4 <- rpart(formula= urgent ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataUrban,cp=0.008)
## summary(model4)
## rpart.plot(model4,digits=4,fallen.leaves=TRUE,type=4,extra=1)


## model5 <- rpart(formula= admitted ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataRural,cp=0.003)
## summary(model5)
## rpart.plot(model5,digits=4,fallen.leaves=TRUE,type=4,extra=1)


## model6 <- rpart(formula= urgent ~ timely + taughtdrugs + checkfall + checkdepression + taughtfootcare, data =dataRural,cp=0.0053)
## summary(model6)
## rpart.plot(model6,digits=4,fallen.leaves=TRUE,type=4,extra=1)
