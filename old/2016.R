library(rpart)
library(rpart.plot)
library('scales')
library(tree)


mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'character')
df <- read.csv("input/HHA2016-2019.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note')

names(df)
dim(df)
ruca <- read.csv("input/RUCA2006.csv",head=TRUE,sep=",",colClasses=c('factor','factor','double','double','factor'))
names(ruca) <- c('Zip','RUCA2.0','RUCA','State')
ruca <- ruca[,c(1,3)]
merg <- merge(df,ruca,by='Zip')
merg$RUCA <- floor(merg$RUCA)
names(merg)
head(merg)
dim(merg)

data <- merg[,c(-7:-4,-2,-1,-15,-17,-19,-21,-23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-49,-51,-53,-54)]

fulldata <- na.omit(data)
fulldata <- data
dim(fulldata)

feq <- table(fulldata$CCN)
hist(feq)

fulldata$RUCA[fulldata$RUCA==1] <- "Urban"
fulldata$RUCA[fulldata$RUCA!='Urban'] <- "Rural"
table(fulldata$RUCA)
dummyRUCA <- as.factor(fulldata$RUCA)
fulldata$RUCA <- dummyRUCA

dataRural <- fulldata[fulldata$RUCA=='Rural',]
dataUrban <- fulldata[fulldata$RUCA=='Urban',]

wilcox.test(dataUrban$admitted,dataRural$admitted)
wilcox.test(dataUrban$ER,dataRural$ER)

## value compare
typeCount_Urban <- table(dataUrban$type)
typeCount_Rural <- table(dataRural$type)
typePerc_Urban <- typeCount_Urban/dim(dataUrban)[1]
typePerc_Rural <- typeCount_Rural/dim(dataRural)[1]
typeTable <- data.frame(cbind(typeCount_Urban,typePerc_Urban,typeCount_Rural,typePerc_Rural))
typeTable
#write.csv(typeTable,file = "output/dummy.csv",row.names=FALSE, na="")

offCount_Urban <- c()
offPerc_Urban <- c()
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.nursing=='Yes'))
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.physical=='Yes'))
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.occupational=='Yes'))
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.speech=='Yes'))
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.medical=='Yes'))
offCount_Urban <-  c(offCount_Urban,sum(dataUrban$off.hha=='Yes'))
offPerc_Urban <- (offCount_Urban/dim(dataUrban)[1])

offCount_Rural <- c()
offPerc_Rural <- c()
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.nursing=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.physical=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.occupational=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.speech=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.medical=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.hha=='Yes'))
offPerc_Rural <- (offCount_Rural/dim(dataRural)[1])
offTable <- data.frame(cbind(offCount_Urban,offPerc_Urban,offCount_Rural,offPerc_Rural))
#write.csv(offTable,file = "output/dummy.csv",row.names=FALSE, na="")

valueMean_Urban <- c()
valueMedian_Urban <- c()
valueStd_Urban <- c()
valueMean_Rural <- c()
valueMedian_Rural <- c()
valueStd_Rural <- c()
valueWil <- c()

for (i in c(9:25)) {
  valueMean_Urban <- c(valueMean_Urban,mean(na.omit(dataUrban[,i])))
  valueMedian_Urban <- c(valueMedian_Urban,median(na.omit(dataUrban[,i])))
  valueStd_Urban <- c(valueStd_Urban,sd(na.omit(dataUrban[,i])))
  valueMean_Rural <- c(valueMean_Rural,mean(na.omit(dataRural[,i])))
  valueMedian_Rural <- c(valueMedian_Rural,median(na.omit(dataRural[,i])))
  valueStd_Rural <- c(valueStd_Rural,sd(na.omit(dataRural[,i])))
  valueWil <- c(valueWil,as.numeric(wilcox.test(dataUrban[,i],dataRural[,i])[3]))
}

valueMean_Urban
valueMedian_Urban
valueStd_Urban
valueMean_Rural
valueMedian_Rural
valueStd_Rural
valueWil

valueTable <- data.frame(cbind(valueMean_Urban,valueMedian_Urban,valueStd_Urban,valueMean_Rural,valueMedian_Rural,valueStd_Rural,valueWil))
#write.csv(valueTable,file = "output/dummy.csv",row.names=FALSE, na="")

hist(dataUrban$rating)

### Tree model
model1 <- rpart(formula= admitted ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare  + RUCA
                , 
                data =fulldata,
                cp=0.01)
summary(model1)
pdf("output/plot result/2016admitted_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model2 <- rpart(formula= ER ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare  + RUCA
                , 
                data =fulldata,
                cp=0.01)
summary(model2)
pdf("output/plot result/2016ER_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()


model3 <- rpart(formula= admitted ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                , 
                data =dataUrban,
                na.action=na.omit,
                cp=0.00024277)
summary(model3)
plotcp(model3)
rsq.rpart(model3)
rpart.plot(model3,digits=4,fallen.leaves=TRUE,type=4,extra=1)


model4 <- rpart(formula= ER ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                , 
                data =dataUrban,
                na.action=na.omit,
                cp=0.00027828)
summary(model4)
plotcp(model4)
rsq.rpart(model4)
rpart.plot(model4,digits=4,fallen.leaves=TRUE,type=4,extra=1)


model5 <- rpart(formula= admitted ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                , 
                data =dataRural,
                na.action=na.omit,
                cp=0.00085555)
summary(model5)
plotcp(model5)
rsq.rpart(model5)
rpart.plot(model5,digits=4,fallen.leaves=TRUE,type=4,extra=1)


model6 <- rpart(formula= ER ~ off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                , 
                data =dataRural,
                na.action=na.omit,
                cp=0.00089067)
summary(model6)
plotcp(model6)
rsq.rpart(model6)
rpart.plot(model6,digits=4,fallen.leaves=TRUE,type=4,extra=1)


pdf("output/plot result/2016compare.pdf",width=6,height=4,paper='special')
rpart.plot(model3,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model4,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model5,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model6,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()


