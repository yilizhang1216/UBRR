mytypes <- c("factor",rep("character",4),"factor","character",rep("factor",7),rep(c("character","double"),17),rep(c("character","factor"),2),"factor",rep(c("character","double"),1),"character","factor",rep(c("character","double"),3))




df <- read.csv("HHCfile.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','foot-rating','timely','foot-timely','taughtdrugs','foot-taughtdrugs','checkfall','foot-checkfall','checkdepression','foot-checkdepression','flushot','foot-flushot','pnumococcal','foot-pnumococcal','taughtfootcare','foot-tautfootcare','betterwalking','foot-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','urgent','note-urgent','readmitted','note-readmitted','note','emergency','note-emergency','worseulcers','note-worseulcers','reminddischarge','note-discharge','medication','note-medication','episode','note-episode','no.episodes')

dim(df)

df2 <- df[,c(1,6,8,9:15,seq(16,51,2),seq(53,63,2))]
names(df2)
dim(df2)

## install.packages("Hmisc")
## library(Hmisc)

## describe(df2)

##df2 <- df2[!is.na(df2),]

#dim(df2)

income <- read.table("MedianIncome.csv",head=TRUE,sep=",",colClasses=c('factor','integer','character','integer'))

income$Mean[income$Mean=="."] <- NA

income$Mean <- as.integer(income$Mean)

dim(income)
names(income)
head(income)


merg <- merge(df2,income,by="Zip")
merg$age <- as.integer(Sys.Date() -as.Date(merg$date))
ruca <- read.csv("RUCAfile.csv",head=TRUE,sep=",",colClasses=c('factor','factor','double','double','factor'))
names(ruca)[1] <- 'Zip'
names(ruca)[3] <- 'RUCA'
ruca <- ruca[,c(1,3)]
merg <- merge(merg,ruca,by='Zip')
merg$RUCA <- floor(merg$RUCA)
names(merg)
head(merg)
dim(merg)


####nursing only one value
table(merg$off.nursing)

###no meaningful value in emergency
table(merg$emergency)


merg1 <- merg[,c(-1,-2,-4,-29)]


merg1$RUCA[merg1$RUCA==1] <- "Urban"
merg1$RUCA[merg1$RUCA!='Urban'] <- "Rural"
table(merg1$RUCA)


mergRural <- merg1[merg1$RUCA=='Rural',]
mergUrban <- merg1[merg1$RUCA=='Urban',]

par(mfrow=c(2,2))
hist(mergUrban$admitted,breaks=200)
hist(mergRural$admitted,breaks=200)
hist(mergUrban$urgent,breaks=200)
hist(mergRural$urgent,breaks=200)



##removed emergency because no meaningful value in it
####offer nursing has only one level - no flu shot
lmadmitted <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + RUCA,data=merg1)
summary(lmadmitted)


lmurgent <- lm(urgent~type + off.physical + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + RUCA,data=merg1)
summary(lmurgent)



##urban admitted
###with all

### if off.physical=="false", betterheal is NA
plot(mergUrban$betterheal,mergUrban$off.physical)
mergUrban$betterheal[mergUrban$off.physical=="false"]

####Remove off.physical
lmadmittedUrban <- lm(admitted~ type + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterheal + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age,data=mergUrban)
summary(lmadmittedUrban)



##Urban urgent
##Remove off.physical
lmurgentUrban <- lm(urgent~type + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age,data=mergUrban)
summary(lmurgentUrban)



##Rural
##admitted
###with all
lmadmittedRural <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + betterheal,data=mergRural)
summary(lmadmittedRural)


##urgent
##with all
lmurgentRural <- lm(urgent~type + off.physical + off.occupational + off.speech + off.medical + off.hha + rating + timely + taughtdrugs + checkfall + checkdepression + pnumococcal + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterdrug + readmitted + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + betterheal,data=mergRural)
summary(lmurgentRural)


##remove rating, readmitted, and pnumococcal
lmadmitted <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + RUCA,data=merg1)
summary(lmadmitted)

lmurgent <- lm(urgent~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + RUCA,data=merg1)
summary(lmurgent)

lmadmittedUrban <- lm(admitted~ type + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterheal + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age,data=mergUrban)
summary(lmadmittedUrban)

lmurgentUrban <- lm(urgent~type + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age,data=mergUrban)
summary(lmurgentUrban)

lmadmittedRural <- lm(admitted~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + betterheal,data=mergRural)
summary(lmadmittedRural)

lmurgentRural <- lm(urgent~type + off.physical + off.occupational + off.speech + off.medical + off.hha + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare + betterwalking + betterbed + betterbathing + lesspain + betterbreathing  + betterdrug + worseulcers + reminddischarge + medication + episode + no.episodes + Median + Pop + age + betterheal,data=mergRural)
summary(lmurgentRural)



## merg1matrix <- merg1[,c(-1,-2,-3,-4,-5,-6,-7,-25,-27,-35)]
## var1 <- var(merg1matrix, y = NULL, na.rm = TRUE)
## which(var1 == max(var1), arr.ind = TRUE)
## write.table(var1, file = "MyData.csv", sep=",")

## set.seed(123)
## mm <- matrix(rbinom(40, 20, 0.5), 8, 5)
## mm

## which(mm == max(mm), arr.ind = TRUE)

