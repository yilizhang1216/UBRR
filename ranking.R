library(ggplot2)


mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),16),'character')
df <- read.csv("HHA2014-2019.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','note')

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


dataRural <- data.frame()
dataUrban <- data.frame()
dataRural <- fulldata[fulldata$RUCA=='Rural',]
dataUrban <- fulldata[fulldata$RUCA=='Urban',]

wilcox.test( ~ RUCA, data = fulldata, 
            exact = FALSE, alternative = "greater")

col <- names(dataRural)[9:24]
wil <- c()
wil2 <- c()
wil <- c(wil,wilcox.test(dataRural$timely,dataUrban$timely)[3])
wil2 <- c(wil2,wilcox.test( timely~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$taughtdrugs,dataUrban$taughtdrugs)[3])
wil2 <- c(wil2,wilcox.test(taughtdrugs ~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$checkfall,dataUrban$checkfall)[3])
wil2 <- c(wil2,wilcox.test( checkfall~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$checkdepression,dataUrban$checkdepression)[3])
wil2 <- c(wil2,wilcox.test( checkdepression~ RUCA, data = fulldata, 
                            exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$flushot,dataUrban$flushot)[3])
wil2 <- c(wil2,wilcox.test( flushot~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$pnumococcal,dataUrban$pnumococcal)[3])
wil2 <- c(wil2,wilcox.test(pnumococcal ~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$taughtfootcare,dataUrban$taughtfootcare)[3])
wil2 <- c(wil2,wilcox.test( taughtfootcare~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterwalking,dataUrban$betterwalking)[3])
wil2 <- c(wil2,wilcox.test( betterwalking~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterbed,dataUrban$betterbed)[3])
wil2 <- c(wil2,wilcox.test(betterbed ~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterbathing,dataUrban$betterbathing)[3])
wil2 <- c(wil2,wilcox.test( betterbathing~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$lesspain,dataUrban$lesspain)[3])
wil2 <- c(wil2,wilcox.test( lesspain~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterbreathing,dataUrban$betterbreathing)[3])
wil2 <- c(wil2,wilcox.test(betterbreathing ~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterheal,dataUrban$betterheal)[3])
wil2 <- c(wil2,wilcox.test( betterheal~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$betterdrug,dataUrban$betterdrug)[3])
wil2 <- c(wil2,wilcox.test(betterdrug ~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$urgent,dataUrban$urgent)[3])
wil2 <- c(wil2,wilcox.test( urgent~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])
wil <- c(wil,wilcox.test(dataRural$admitted,dataUrban$admitted)[3])
wil2 <- c(wil2,wilcox.test( admitted~ RUCA, data = fulldata, 
             exact = FALSE, alternative = "greater")[3])

meanRural <- c()
meanUrban <- c()
meanRural <- c(meanRural,mean(dataRural$timely))
meanUrban <- c(meanUrban,mean(dataUrban$timely))
meanRural <- c(meanRural,mean(dataRural$taughtdrugs))
meanUrban <- c(meanUrban,mean(dataUrban$taughtdrugs))
meanRural <- c(meanRural,mean(dataRural$checkfall))
meanUrban <- c(meanUrban,mean(dataUrban$checkfall))
meanRural <- c(meanRural,mean(dataRural$checkdepression))
meanUrban <- c(meanUrban,mean(dataUrban$checkdepression))
meanRural <- c(meanRural,mean(dataRural$flushot))
meanUrban <- c(meanUrban,mean(dataUrban$flushot))
meanRural <- c(meanRural,mean(dataRural$pnumococcal))
meanUrban <- c(meanUrban,mean(dataUrban$pnumococcal))
meanRural <- c(meanRural,mean(dataRural$taughtfootcare))
meanUrban <- c(meanUrban,mean(dataUrban$taughtfootcare))

meanRural <- c(meanRural,mean(dataRural$betterwalking))
meanUrban <- c(meanUrban,mean(dataUrban$betterwalking))
meanRural <- c(meanRural,mean(dataRural$betterbed))
meanUrban <- c(meanUrban,mean(dataUrban$betterbed))
meanRural <- c(meanRural,mean(dataRural$betterbathing))
meanUrban <- c(meanUrban,mean(dataUrban$betterbathing))
meanRural <- c(meanRural,mean(dataRural$lesspain))
meanUrban <- c(meanUrban,mean(dataUrban$lesspain))
meanRural <- c(meanRural,mean(dataRural$betterbreathing))
meanUrban <- c(meanUrban,mean(dataUrban$betterbreathing))
meanRural <- c(meanRural,mean(dataRural$betterheal))
meanUrban <- c(meanUrban,mean(dataUrban$betterheal))
meanRural <- c(meanRural,mean(dataRural$betterdrug))
meanUrban <- c(meanUrban,mean(dataUrban$betterdrug))
meanRural <- c(meanRural,mean(dataRural$urgent))
meanUrban <- c(meanUrban,mean(dataUrban$urgent))
meanRural <- c(meanRural,mean(dataRural$admitted))
meanUrban <- c(meanUrban,mean(dataUrban$admitted))

means <- data.frame()
means <- cbind(col,wil,wil2,meanUrban,meanRural)

write.csv(means,"means.csv", row.names = TRUE)

plot(density(dataUrban$checkdepression))
lines(density(dataRural$checkdepression),col='red')

dat <- data.frame(
  dens=fulldata$betterwalking, lines = fulldata$RUCA)
ggplot(dat, aes(x = dens, fill = lines)) + geom_density(alpha = 0.5)

wilcox.test(dataRural$timely,dataUrban$timely)
wilcox.test(dataUrban$timely,dataRural$timely)
