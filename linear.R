library(rpart)
library(rpart.plot)
library('scales')

mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),16),'character')
df <- read.csv("input/HHA2014-2019.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','note')

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

data <- merg[,c(-7:-4,-2,-1,-15,-17,-19,-21,-23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-48)]

#fulldata <- na.omit(data)
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
typeTable[,2] <- percent(typeTable$typePerc_Urban)
typeTable[,4] <- percent(typeTable$typePerc_Rural)
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
offPerc_Urban <- percent(offCount_Urban/dim(dataUrban)[1])

offCount_Rural <- c()
offPerc_Rural <- c()
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.nursing=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.physical=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.occupational=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.speech=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.medical=='Yes'))
offCount_Rural <-  c(offCount_Rural,sum(dataRural$off.hha=='Yes'))
offPerc_Rural <- percent(offCount_Rural/dim(dataRural)[1])
offTable <- data.frame(cbind(offCount_Urban,offPerc_Urban,offCount_Rural,offPerc_Rural))
#write.csv(offTable,file = "output/dummy.csv",row.names=FALSE, na="")

valueMean_Urban <- c()
valueMedian_Urban <- c()
valueStd_Urban <- c()
valueMean_Rural <- c()
valueMedian_Rural <- c()
valueStd_Rural <- c()
valueWil <- c()

for (i in c(9:24)) {
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


### Tree model
model1 <- rpart(formula= admitted ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA, data =fulldata,cp=0.005)
summary(model1)
pdf("output/plot result/2014admitted_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model1,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model2 <- rpart(formula= ER ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA, data =fulldata,cp=0.006)
summary(model2)
pdf("output/plot result/2014ER_fulldata.pdf",width=6,height=4,paper='special')
rpart.plot(model2,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()

model3 <- rpart(formula= admitted ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data =dataUrban,cp=0.004)
summary(model3)

model4 <- rpart(formula= ER ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data =dataUrban,cp=0.003)
summary(model4)

model5 <- rpart(formula= admitted ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data =dataRural,cp=0.002)
summary(model5)

model6 <- rpart(formula= ER ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data =dataRural,cp=0.0015)
summary(model6)


pdf("output/plot result/2014compare.pdf",width=6,height=4,paper='special')
rpart.plot(model3,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model4,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model5,digits=4,fallen.leaves=TRUE,type=4,extra=1)
rpart.plot(model6,digits=4,fallen.leaves=TRUE,type=4,extra=1)
dev.off()


median(fulldata$betterbed)
mean(fulldata$betterbed)


# linear model - commented because of low R square
# ####offer nursing has only one level 
# lmadmitted <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA,data=fulldata)
# summary(lmadmitted)
# 
# lmER <- lm(ER~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA,data=fulldata)
# summary(lmER)
# 
# 
# ## Urban data
# lmadmittedUrban <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug,data=dataUrban)
# summary(lmadmittedUrban)
# 
# lmERUrban <- lm(ER~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug,data=dataUrban)
# summary(lmERUrban)
# 
# ## Rural data
# lmadmittedRural <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug,data=dataRural)
# summary(lmadmittedRural)
# 
# lmERRural <- lm(ER~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug,data=dataRural)
# summary(lmERRural)


### Tree model
