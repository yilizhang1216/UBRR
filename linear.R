mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),16),'character')
df <- read.csv("HHA2014-2019.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','note')

names(df)
dim(df)
feq <- table(df$CCN)

hist(feq)


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
hist(feq)

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

## plot(fulldata$flushot,fulldata$pnumococcal)
## plotdata <- fulldata[,c(16:20,22)]
## plot(plotdata)
dataRural <- fulldata[fulldata$RUCA=='Rural',]
dataUrban <- fulldata[fulldata$RUCA=='Urban',]


brk <- 48
brk <- 30
par(mfrow=c(2,2))
hist(dataUrban$admitted,breaks=brk)
hist(dataUrban$urgent,breaks=brk)
hist(dataRural$admitted,breaks=brk)
hist(dataRural$urgent,breaks=brk)

library(nlme)
##no pnumococcal

model1 <- lme(admitted~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA,data=fulldata,random=~1|CCN)
summary(model1)
vif(model1)

model2 <- lme(urgent~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + RUCA,data=fulldata,random=~1|CCN)
summary(model2)

model3 <- lme(admitted~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data=dataUrban,random=~1|CCN)
summary(model3)

model4 <- lme(urgent~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data=dataUrban,random=~1|CCN)
summary(model4)

model5 <- lme(admitted~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data=dataRural,random=~1|CCN)
summary(model5)

model6 <- lme(urgent~timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug, data=dataRural,random=~1|CCN)
summary(model6)


## lmadmitted <- lm(admitted~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + RUCA,data=fulldata)
## summary(lmadmitted)

## lmurgent <- lm(urgent~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + age + RUCA,data=data)
## summary(lmurgent)


## lmadmittedUrban <- lm(admitted~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + age,data=dataUrban)
## summary(lmadmittedUrban)

## lmurgentUrban <- lm(urgent~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + age,data=dataUrban)
## summary(lmurgentUrban)

## lmadmittedRural <- lm(admitted~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + age,data=dataRural)
## summary(lmadmittedRural)

## lmurgentRural <- lm(urgent~timely + taughtdrugs + checkfall + checkdepression + flushot + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + Median + Pop + age,data=dataRural)
## summary(lmurgentRural)


## mytypes60 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),22),'character')
## names60 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','note')

## mytypes66 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),23),rep(c('factor','character'),2),'character')
## names66 <-  c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','readmit','not-readmit','emergency','note-emergency','note')

## mytypes54 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'character')
## names54 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','readmit','not-readmit','emergency','note-emergency','note')

## setdiff(names60, names66)
## setdiff(names66, names60)
## setdiff(names54, names60)
## setdiff(names60, names54)
## setdiff(names54, names66)
## setdiff(names66, names54)

## df20141 <- read.csv("HHC_SOCRATA_PRVDR20141.csv",sep=',',colClasses=mytypes60)
## length(names(df20141))
## names(df20141) <- names60

## df20142 <- read.csv("HHC_SOCRATA_PRVDR20142.csv",sep=',',colClasses=mytypes60)
## length(names(df20142))
## names(df20142) <- names60

## df20143 <- read.csv("HHC_SOCRATA_PRVDR20143.csv",sep=',',colClasses=mytypes60)
## length(names(df20143))
## names(df20143) <- names60

## df20144 <- read.csv("HHC_SOCRATA_PRVDR20144.csv",sep=',',colClasses=mytypes60)
## length(names(df20144))
## names(df20144) <- names60

## df20151 <- read.csv("HHC_SOCRATA_PRVDR20151.csv",sep=',',colClasses=mytypes60)
## length(names(df20151))
## names(df20151) <- names60

## df20152 <- read.csv("HHC_SOCRATA_PRVDR20152.csv",sep=',',colClasses=mytypes60)
## length(names(df20152))
## names(df20152) <- names60

## df20153 <- read.csv("HHC_SOCRATA_PRVDR20153.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20153))
## names(df20153) <- names66

## df20154 <- read.csv("HHC_SOCRATA_PRVDR20154.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20154))
## names(df20154) <- names66

## df20161 <- read.csv("HHC_SOCRATA_PRVDR20161.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20161))
## names(df20161) <- names66

## df20162 <- read.csv("HHC_SOCRATA_PRVDR20162.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20162))
## names(df20162) <- names66

## df20163 <- read.csv("HHC_SOCRATA_PRVDR20163.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20163))
## names(df20163) <- names66

## df20164 <- read.csv("HHC_SOCRATA_PRVDR20164.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
## length(names(df20164))
## names(df20164) <- names66

## df20171 <- read.csv("HHC_SOCRATA_PRVDR20171.csv",sep=',',colClasses=mytypes54)
## length(names(df20171))
## names(df20171) <- names54

## df20172 <- read.csv("HHC_SOCRATA_PRVDR20172.csv",sep=',',colClasses=mytypes54)
## length(names(df20172))
## names(df20172) <- names54

## df20173 <- read.csv("HHC_SOCRATA_PRVDR20173.csv",sep=',',colClasses=mytypes54)
## length(names(df20173))
## names(df20173) <- names54

## df20174 <- read.csv("HHC_SOCRATA_PRVDR20174.csv",sep=',',colClasses=mytypes54)
## length(names(df20174))
## names(df20174) <- names54

## df20181 <- read.csv("HHC_SOCRATA_PRVDR20181.csv",sep=',',colClasses=mytypes54)
## length(names(df20181))
## names(df20181) <- names54

## df20182 <- read.csv("HHC_SOCRATA_PRVDR20182.csv",sep=',',colClasses=mytypes54)
## length(names(df20182))
## names(df20182) <- names54

## df20183 <- read.csv("HHC_SOCRATA_PRVDR20183.csv",sep=',',colClasses=mytypes54)
## length(names(df20183))
## names(df20183) <- names54

## df20184 <- read.csv("HHC_SOCRATA_PRVDR20184.csv",sep=',',colClasses=mytypes54)
## length(names(df20184))
## names(df20184) <- names54

## df20141 <- df20141[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20142 <- df20142[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20143 <- df20143[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20144 <- df20144[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20151 <- df20151[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20152 <- df20152[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
## df20153 <- df20153[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20154 <- df20154[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20161 <- df20161[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20162 <- df20162[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20163 <- df20163[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20164 <- df20164[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
## df20171 <- df20171[,c(-16,-17,-50,-51,-52,-53)]
## df20172 <- df20172[,c(-16,-17,-50,-51,-52,-53)]
## df20173 <- df20173[,c(-16,-17,-50,-51,-52,-53)]
## df20174 <- df20174[,c(-16,-17,-50,-51,-52,-53)]
## df20181 <- df20181[,c(-16,-17,-50,-51,-52,-53)]
## df20182 <- df20182[,c(-16,-17,-50,-51,-52,-53)]
## df20183 <- df20183[,c(-16,-17,-50,-51,-52,-53)]
## df20184 <- df20184[,c(-16,-17,-50,-51,-52,-53)]


## year20141 <- as.factor(rep('2014',nrow(df20141)))
## df20141$year <- year20141
## year20142 <- as.factor(rep('2014',nrow(df20142)))
## df20142$year <- year20142
## year20143 <- as.factor(rep('2014',nrow(df20143)))
## df20143$year <- year20143
## year20144 <- as.factor(rep('2014',nrow(df20144)))
## df20144$year <- year20144

## year20151 <- as.factor(rep('2015',nrow(df20151)))
## df20151$year <- year20151
## year20152 <- as.factor(rep('2015',nrow(df20152)))
## df20152$year <- year20152
## year20153 <- as.factor(rep('2015',nrow(df20153)))
## df20153$year <- year20153
## year20154 <- as.factor(rep('2015',nrow(df20154)))
## df20154$year <- year20154

## year20161 <- as.factor(rep('2016',nrow(df20161)))
## df20161$year <- year20161
## year20162 <- as.factor(rep('2016',nrow(df20162)))
## df20162$year <- year20162
## year20163 <- as.factor(rep('2016',nrow(df20163)))
## df20163$year <- year20163
## year20164 <- as.factor(rep('2016',nrow(df20164)))
## df20164$year <- year20164

## year20171 <- as.factor(rep('2017',nrow(df20171)))
## df20171$year <- year20171
## year20172 <- as.factor(rep('2017',nrow(df20172)))
## df20172$year <- year20172
## year20173 <- as.factor(rep('2017',nrow(df20173)))
## df20173$year <- year20173
## year20174 <- as.factor(rep('2017',nrow(df20174)))
## df20174$year <- year20174

## year20181 <- as.factor(rep('2018',nrow(df20181)))
## df20181$year <- year20181
## year20182 <- as.factor(rep('2018',nrow(df20182)))
## df20182$year <- year20182
## year20183 <- as.factor(rep('2018',nrow(df20183)))
## df20183$year <- year20183
## year20184 <- as.factor(rep('2018',nrow(df20184)))
## df20184$year <- year20184



## df <- rbind(df20141,df20142,df20143,df20144,df20151,df20152,df20153,df20154,df20161,df20162,df20163,df20164,df20171,df20172,df20173,df20174,df20181,df20182,df20183,df20184)


## write.csv(df, file = "HHA2014-2018.csv",row.names=FALSE, na="")
