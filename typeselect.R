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


######################
plot(merg1$type,merg1$off.physical)
## if merg1$type=="Non - Profit Religious", most of merg1$off.physical is true (1 vs 313)
table(merg1$off.physical[merg1$type=="Non - Profit Religious"])
plot(merg1$off.physical,merg1$type)


plot(merg1$type,merg1$off.occupational)
plot(merg1$off.occupational,merg1$type)

plot(merg1$type,merg1$off.speech)
plot(merg1$off.speech,merg1$type)

plot(merg1$type,merg1$off.medical)
plot(merg1$off.medical,merg1$type)

plot(merg1$type,merg1$off.hha)
## if merg1$type=="Government - Combination Government & Voluntary", all merg1$off.hha is true
table(merg1$off.hha[merg1$type=="Government - Combination Government & Voluntary"])
plot(merg1$off.hha,merg1$type)


plot(merg1$type,merg1$readmitted)
plot(merg1$readmitted,merg1$type)

plot(merg1$type,merg1$reminddischarge)
plot(merg1$reminddischarge,merg1$type)



plot(merg1$off.physical,merg1$off.occupational)
table(merg1$off.occupational[merg1$off.physical=="true"])
table(merg1$off.occupational[merg1$off.physical=="false"])
plot(merg1$off.occupational,merg1$off.physical)
### if merg1$off.occupational=="true", most of merg1$off.physical is true(11 vs 9946)
table(merg1$off.physical[merg1$off.occupational=="true"])

plot(merg1$off.physical,merg1$off.speech)
table(merg1$off.speech[merg1$off.physical=="true"])
table(merg1$off.speech[merg1$off.physical=="false"])
plot(merg1$off.speech,merg1$off.physical)
### if merg1$off.speech=="true", most of merg1$off.physical is true(12 vs 9452)
table(merg1$off.physical[merg1$off.speech=="true"])

plot(merg1$off.physical,merg1$off.medical)
plot(merg1$off.medical,merg1$off.physical)
### if merg1$off.medical=="true", most of merg1$off.physical is true(58 vs 8800)
table(merg1$off.physical[merg1$off.medical=="true"])

plot(merg1$off.physical,merg1$off.hha)
table(merg1$off.hha[merg1$off.physical=="true"])
table(merg1$off.hha[merg1$off.physical=="false"])
plot(merg1$off.hha,merg1$off.physical)
table(merg1$off.physical[merg1$off.hha=="true"])
table(merg1$off.physical[merg1$off.hha=="false"])


plot(merg1$off.occupational,merg1$off.speech)
plot(merg1$off.speech,merg1$off.occupational)
#### if merg1$off.speech=="true", most of merg1$off.occupational is true (121 vs 9343)
table(merg1$off.occupational[merg1$off.speech=="true"])

plot(merg1$off.occupational,merg1$off.medical)
plot(merg1$off.medical,merg1$off.occupational)

plot(merg1$off.occupational,merg1$off.hha)
plot(merg1$off.hha,merg1$off.occupational)

plot(merg1$off.speech,merg1$off.medical)
plot(merg1$off.medical,merg1$off.speech)

plot(merg1$off.speech,merg1$off.hha)
plot(merg1$off.hha,merg1$off.speech)

plot(merg1$off.medical,merg1$off.hha)
plot(merg1$off.hha,merg1$off.medical)


plot(merg1$type,merg1$rating)
plot(merg1$type,merg1$timely)
plot(merg1$type,merg1$taughtdrugs)
plot(merg1$type,merg1$checkfall)
plot(merg1$type,merg1$checkdepression)
plot(merg1$type,merg1$flushot)
plot(merg1$type,merg1$pnumococcal)
plot(merg1$type,merg1$taughtfootcare)
plot(merg1$type,merg1$betterwalking)
plot(merg1$type,merg1$betterbed)
plot(merg1$type,merg1$betterbathing)
plot(merg1$type,merg1$lesspain)
plot(merg1$type,merg1$betterbreathing)
plot(merg1$type,merg1$betterheal)
plot(merg1$type,merg1$betterdrug)
plot(merg1$type,merg1$admitted)
plot(merg1$type,merg1$urgent)
plot(merg1$type,merg1$worseulcers)
plot(merg1$type,merg1$medication)
plot(merg1$type,merg1$episode)
plot(merg1$type,merg1$no.episodes)
plot(merg1$type,merg1$age)

### if off.physical is true, rating is higher
plot(merg1$off.physical,merg1$rating)
plot(merg1$off.physical,merg1$timely)
plot(merg1$off.physical,merg1$taughtdrugs)
plot(merg1$off.physical,merg1$checkfall)
plot(merg1$off.physical,merg1$checkdepression)
### if off.physical is true, flushot is higher
plot(merg1$off.physical,merg1$flushot)
### if off.physical is true, pumococcal is higher
plot(merg1$off.physical,merg1$pnumococcal)
plot(merg1$off.physical,merg1$taughtfootcare)
plot(merg1$off.physical,merg1$betterwalking)
plot(merg1$off.physical,merg1$betterbed)
plot(merg1$off.physical,merg1$betterbathing)
### if off.physical is true, lesspain is higher
plot(merg1$off.physical,merg1$lesspain)
### if off.physical is true, betterbreathing is higher
plot(merg1$off.physical,merg1$betterbreathing)
plot(merg1$off.physical,merg1$betterheal)
plot(merg1$off.physical,merg1$betterdrug)
### if off.physical is true, admitted is higher
plot(merg1$off.physical,merg1$admitted)
plot(merg1$off.physical,merg1$urgent)
plot(merg1$off.physical,merg1$worseulcers)
plot(merg1$off.physical,merg1$medication)
plot(merg1$off.physical,merg1$episode)
plot(merg1$off.physical,merg1$no.episodes)
plot(merg1$off.physical,merg1$age)

plot(merg1$off.occupational,merg1$rating)
plot(merg1$off.occupational,merg1$timely)
plot(merg1$off.occupational,merg1$taughtdrugs)
plot(merg1$off.occupational,merg1$checkfall)
plot(merg1$off.occupational,merg1$checkdepression)
### if off.occupational is true, flushot is higher
plot(merg1$off.occupational,merg1$flushot)
### if off.occupational is true, pnumococcal is higher
plot(merg1$off.occupational,merg1$pnumococcal)
plot(merg1$off.occupational,merg1$taughtfootcare)
plot(merg1$off.occupational,merg1$betterwalking)
plot(merg1$off.occupational,merg1$betterbed)
plot(merg1$off.occupational,merg1$betterbathing)
plot(merg1$off.occupational,merg1$lesspain)
plot(merg1$off.occupational,merg1$betterbreathing)
plot(merg1$off.occupational,merg1$betterheal)
plot(merg1$off.occupational,merg1$betterdrug)
plot(merg1$off.occupational,merg1$admitted)
plot(merg1$off.occupational,merg1$urgent)
plot(merg1$off.occupational,merg1$worseulcers)
plot(merg1$off.occupational,merg1$medication)
plot(merg1$off.occupational,merg1$episode)
plot(merg1$off.occupational,merg1$no.episodes)
plot(merg1$off.occupational,merg1$age)

plot(merg1$off.speech,merg1$rating)
plot(merg1$off.speech,merg1$timely)
plot(merg1$off.speech,merg1$taughtdrugs)
plot(merg1$off.speech,merg1$checkfall)
plot(merg1$off.speech,merg1$checkdepression)
### if off.speech is true, flushot is higher
plot(merg1$off.speech,merg1$flushot)
### if off.speech is true, pnumococcal is higherl)
plot(merg1$off.speech,merg1$pnumococcal)
plot(merg1$off.speech,merg1$taughtfootcare)
plot(merg1$off.speech,merg1$betterwalking)
plot(merg1$off.speech,merg1$betterbed)
plot(merg1$off.speech,merg1$betterbathing)
plot(merg1$off.speech,merg1$lesspain)
plot(merg1$off.speech,merg1$betterbreathing)
plot(merg1$off.speech,merg1$betterheal)
plot(merg1$off.speech,merg1$betterdrug)
plot(merg1$off.speech,merg1$admitted)
plot(merg1$off.speech,merg1$urgent)
plot(merg1$off.speech,merg1$worseulcers)
plot(merg1$off.speech,merg1$medication)
plot(merg1$off.speech,merg1$episode)
plot(merg1$off.speech,merg1$no.episodes)
plot(merg1$off.speech,merg1$age)

### if off.medical is true, rating is higher
plot(merg1$off.medical,merg1$rating)
plot(merg1$off.medical,merg1$timely)
plot(merg1$off.medical,merg1$taughtdrugs)
plot(merg1$off.medical,merg1$checkfall)
plot(merg1$off.medical,merg1$checkdepression)
plot(merg1$off.medical,merg1$flushot)
plot(merg1$off.medical,merg1$pnumococcal)
plot(merg1$off.medical,merg1$taughtfootcare)
plot(merg1$off.medical,merg1$betterwalking)
plot(merg1$off.medical,merg1$betterbed)
### if off.medical is true, betterbathing is higher
plot(merg1$off.medical,merg1$betterbathing)
### if off.medical is true, lesspain is higher
plot(merg1$off.medical,merg1$lesspain)
### if off.medical is true, betterbreathing is higher
plot(merg1$off.medical,merg1$betterbreathing)
plot(merg1$off.medical,merg1$betterheal)
plot(merg1$off.medical,merg1$betterdrug)
plot(merg1$off.medical,merg1$admitted)
### if off.medical is true, urgent is lower
plot(merg1$off.medical,merg1$urgent)
plot(merg1$off.medical,merg1$worseulcers)
plot(merg1$off.medical,merg1$medication)
plot(merg1$off.medical,merg1$episode)
plot(merg1$off.medical,merg1$no.episodes)
plot(merg1$off.medical,merg1$age)

plot(merg1$off.hha,merg1$rating)
plot(merg1$off.hha,merg1$timely)
plot(merg1$off.hha,merg1$taughtdrugs)
plot(merg1$off.hha,merg1$checkfall)
plot(merg1$off.hha,merg1$checkdepression)
plot(merg1$off.hha,merg1$flushot)
plot(merg1$off.hha,merg1$pnumococcal)
plot(merg1$off.hha,merg1$taughtfootcare)
plot(merg1$off.hha,merg1$betterwalking)
plot(merg1$off.hha,merg1$betterbed)
plot(merg1$off.hha,merg1$betterbathing)
plot(merg1$off.hha,merg1$lesspain)
plot(merg1$off.hha,merg1$betterbreathing)
plot(merg1$off.hha,merg1$betterheal)
plot(merg1$off.hha,merg1$betterdrug)
plot(merg1$off.hha,merg1$admitted)
plot(merg1$off.hha,merg1$urgent)
plot(merg1$off.hha,merg1$worseulcers)
plot(merg1$off.hha,merg1$medication)
plot(merg1$off.hha,merg1$episode)
plot(merg1$off.hha,merg1$no.episodes)
plot(merg1$off.hha,merg1$age)



######################
plot(mergUrban$type,mergUrban$off.physical)
## if mergUrban$type=="Non - Profit Religious", most of mergUrban$off.physical is true (0 vs 197)
table(mergUrban$off.physical[mergUrban$type=="Non - Profit Religious"])
## if mergUrban$type is "Government - Combination Government & Voluntary", all of mergUrban$physical is true (0 vs 5)
table(mergUrban$off.physical[mergUrban$type=="Government - Combination Government & Voluntary"])
plot(mergUrban$off.physical,mergUrban$type)



plot(mergUrban$type,mergUrban$off.occupational)
## if mergUrban$type is "Government - Combination Government & Voluntary", all of mergUrban$off.occupational is true (0 vs 5)
table(mergUrban$off.occupational[mergUrban$type=="Government - Combination Government & Voluntary"])
plot(mergUrban$off.occupational,mergUrban$type)

plot(mergUrban$type,mergUrban$off.speech)
## if mergUrban$type is "Government - Combination Government & Voluntary", all of mergUrban$off.speech is true (0 vs 5)
table(mergUrban$off.occupational[mergUrban$type=="Government - Combination Government & Voluntary"])
plot(mergUrban$off.speech,mergUrban$type)

plot(mergUrban$type,mergUrban$off.medical)
## if mergUrban$type is "Government - Combination Government & Voluntary", all of mergUrban$off.medical is true (0 vs 5)
table(mergUrban$off.medical[mergUrban$type=="Government - Combination Government & Voluntary"])
plot(mergUrban$off.medical,mergUrban$type)

plot(mergUrban$type,mergUrban$off.hha)
## if mergUrban$type=="Government - Combination Government & Voluntary", all mergUrban$off.hha is true
table(mergUrban$off.hha[mergUrban$type=="Government - Combination Government & Voluntary"])
plot(mergUrban$off.hha,mergUrban$type)


plot(mergUrban$type,mergUrban$readmitted)
plot(mergUrban$readmitted,mergUrban$type)

plot(mergUrban$type,mergUrban$reminddischarge)
plot(mergUrban$reminddischarge,mergUrban$type)



plot(mergUrban$off.physical,mergUrban$off.occupational)
table(mergUrban$off.occupational[mergUrban$off.physical=="true"])
table(mergUrban$off.occupational[mergUrban$off.physical=="false"])
plot(mergUrban$off.occupational,mergUrban$off.physical)
### if mergUrban$off.occupational=="true", most of mergUrban$off.physical is true(10 vs 7870)
table(mergUrban$off.physical[mergUrban$off.occupational=="true"])

plot(mergUrban$off.physical,mergUrban$off.speech)
table(mergUrban$off.speech[mergUrban$off.physical=="true"])
table(mergUrban$off.speech[mergUrban$off.physical=="false"])
plot(mergUrban$off.speech,mergUrban$off.physical)
### if mergUrban$off.speech=="true", most of mergUrban$off.physical is true(12 vs 7489)
table(mergUrban$off.physical[mergUrban$off.speech=="true"])

plot(mergUrban$off.physical,mergUrban$off.medical)
plot(mergUrban$off.medical,mergUrban$off.physical)
### if mergUrban$off.medical=="true", most of mergUrban$off.physical is true(50 vs 7177)
table(mergUrban$off.physical[mergUrban$off.medical=="true"])

plot(mergUrban$off.physical,mergUrban$off.hha)
table(mergUrban$off.hha[mergUrban$off.physical=="true"])
table(mergUrban$off.hha[mergUrban$off.physical=="false"])
plot(mergUrban$off.hha,mergUrban$off.physical)
table(mergUrban$off.physical[mergUrban$off.hha=="true"])
table(mergUrban$off.physical[mergUrban$off.hha=="false"])


plot(mergUrban$off.occupational,mergUrban$off.speech)
plot(mergUrban$off.speech,mergUrban$off.occupational)
#### if mergUrban$off.speech=="true", most of mergUrban$off.occupational is true (49 vs 97452)
table(mergUrban$off.occupational[mergUrban$off.speech=="true"])

plot(mergUrban$off.occupational,mergUrban$off.medical)
plot(mergUrban$off.medical,mergUrban$off.occupational)

plot(mergUrban$off.occupational,mergUrban$off.hha)
plot(mergUrban$off.hha,mergUrban$off.occupational)

plot(mergUrban$off.speech,mergUrban$off.medical)
plot(mergUrban$off.medical,mergUrban$off.speech)

plot(mergUrban$off.speech,mergUrban$off.hha)
plot(mergUrban$off.hha,mergUrban$off.speech)

plot(mergUrban$off.medical,mergUrban$off.hha)
plot(mergUrban$off.hha,mergUrban$off.medical)

### type is "Government - Combination Government & Voluntary" or "Non - Profit Private", rating is lower
plot(mergUrban$type,mergUrban$rating)
plot(mergUrban$type,mergUrban$timely)
plot(mergUrban$type,mergUrban$taughtdrugs)
plot(mergUrban$type,mergUrban$checkfall)
plot(mergUrban$type,mergUrban$checkdepression)
plot(mergUrban$type,mergUrban$flushot)
plot(mergUrban$type,mergUrban$pnumococcal)
plot(mergUrban$type,mergUrban$taughtfootcare)
plot(mergUrban$type,mergUrban$betterwalking)
plot(mergUrban$type,mergUrban$betterbed)
plot(mergUrban$type,mergUrban$betterbathing)
plot(mergUrban$type,mergUrban$lesspain)
plot(mergUrban$type,mergUrban$betterbreathing)
### type is "Government - Local", betterheal is higher
plot(mergUrban$type,mergUrban$betterheal)
plot(mergUrban$type,mergUrban$betterdrug)
plot(mergUrban$type,mergUrban$admitted)
plot(mergUrban$type,mergUrban$urgent)
plot(mergUrban$type,mergUrban$worseulcers)
plot(mergUrban$type,mergUrban$medication)
plot(mergUrban$type,mergUrban$episode)
plot(mergUrban$type,mergUrban$no.episodes)
plot(mergUrban$type,mergUrban$age)

### if off.physical is true, rating is higher
plot(mergUrban$off.physical,mergUrban$rating)
### if off.physical is true, timely is higher
plot(mergUrban$off.physical,mergUrban$timely)
### if off.physical is true, taughtdrugs is higher
plot(mergUrban$off.physical,mergUrban$taughtdrugs)
### if off.physical is true, checkfall is higher
plot(mergUrban$off.physical,mergUrban$checkfall)
### if off.physical is true, checkdepression is higher
plot(mergUrban$off.physical,mergUrban$checkdepression)
### if off.physical is true, flushot is higher
plot(mergUrban$off.physical,mergUrban$flushot)
### if off.physical is true, pumococcal is higher
plot(mergUrban$off.physical,mergUrban$pnumococcal)
plot(mergUrban$off.physical,mergUrban$taughtfootcare)
### if off.physical is true, betterwalking is higher
plot(mergUrban$off.physical,mergUrban$betterwalking)
### if off.physical is true, betterbed is higher
plot(mergUrban$off.physical,mergUrban$betterbed)
### if off.physical is true, betterbathing is higher
plot(mergUrban$off.physical,mergUrban$betterbathing)
### if off.physical is true, lesspain is higher
plot(mergUrban$off.physical,mergUrban$lesspain)
### if off.physical is true, betterbreathing is higher
plot(mergUrban$off.physical,mergUrban$betterbreathing)
### only off.physical is true note betterheal
plot(mergUrban$off.physical,mergUrban$betterheal)
### if off.physical is true, betterdrug is higher
plot(mergUrban$off.physical,mergUrban$betterdrug)
### if off.physical is true, admitted is lower
plot(mergUrban$off.physical,mergUrban$admitted)
plot(mergUrban$off.physical,mergUrban$urgent)
plot(mergUrban$off.physical,mergUrban$worseulcers)
### if off.physical is true, medicaiton is higher
plot(mergUrban$off.physical,mergUrban$medication)
### if off.physical is true, episode is higher
plot(mergUrban$off.physical,mergUrban$episode)
plot(mergUrban$off.physical,mergUrban$no.episodes)
plot(mergUrban$off.physical,mergUrban$age)

### if off.occupational is true, rating is higher
plot(mergUrban$off.occupational,mergUrban$rating)
### if off.occupational is true, timely is higher
plot(mergUrban$off.occupational,mergUrban$timely)
### if off.occupational is true, taughtdrugs is higher
plot(mergUrban$off.occupational,mergUrban$taughtdrugs)
### if off.occupational is true, checkfall is higher
plot(mergUrban$off.occupational,mergUrban$checkfall)
### if off.occupational is true, checkdepression is higher
plot(mergUrban$off.occupational,mergUrban$checkdepression)
### if off.occupational is true, flushot is higher
plot(mergUrban$off.occupational,mergUrban$flushot)
### if off.occupational is true, pnumococcal is higher
plot(mergUrban$off.occupational,mergUrban$pnumococcal)
### if off.occupational is true, taughtfootcare is higher
plot(mergUrban$off.occupational,mergUrban$taughtfootcare)
### if off.occupational is true, betterwalking is higher
plot(mergUrban$off.occupational,mergUrban$betterwalking)
### if off.occupational is true, betterbed is higher
plot(mergUrban$off.occupational,mergUrban$betterbed)
### if off.occupational is true, betterbathing is higher
plot(mergUrban$off.occupational,mergUrban$betterbathing)
### if off.occupational is true, lesspain is higher
plot(mergUrban$off.occupational,mergUrban$lesspain)
### if off.occupational is true, betterbreathing is higher
plot(mergUrban$off.occupational,mergUrban$betterbreathing)
plot(mergUrban$off.occupational,mergUrban$betterheal)
### if off.occupational is true, betterdrug is higher
plot(mergUrban$off.occupational,mergUrban$betterdrug)
plot(mergUrban$off.occupational,mergUrban$admitted)
plot(mergUrban$off.occupational,mergUrban$urgent)
plot(mergUrban$off.occupational,mergUrban$worseulcers)
### if off.occupational is true, medication is higher
plot(mergUrban$off.occupational,mergUrban$medication)
### if off.occupational is true, episode is higher
plot(mergUrban$off.occupational,mergUrban$episode)
plot(mergUrban$off.occupational,mergUrban$no.episodes)
plot(mergUrban$off.occupational,mergUrban$age)

plot(mergUrban$off.speech,mergUrban$rating)
### if off.speech is true, timely is higher
plot(mergUrban$off.speech,mergUrban$timely)
### if off.occupational is true, taughtdrugs is higher
plot(mergUrban$off.speech,mergUrban$taughtdrugs)
### if off.occupational is true, checkfall is higher
plot(mergUrban$off.speech,mergUrban$checkfall)
plot(mergUrban$off.speech,mergUrban$checkdepression)
### if off.speech is true, flushot is higher
plot(mergUrban$off.speech,mergUrban$flushot)
### if off.speech is true, pnumococcal is higherl)
plot(mergUrban$off.speech,mergUrban$pnumococcal)
### if off.occupational is true, taughtfootcare is higher
plot(mergUrban$off.speech,mergUrban$taughtfootcare)
plot(mergUrban$off.speech,mergUrban$betterwalking)
### if off.occupational is true, betterbed is higher
plot(mergUrban$off.speech,mergUrban$betterbed)
### if off.occupational is true, betterbathing is higher
plot(mergUrban$off.speech,mergUrban$betterbathing)
plot(mergUrban$off.speech,mergUrban$lesspain)
### if off.occupational is true, betterbreathing is higher
plot(mergUrban$off.speech,mergUrban$betterbreathing)
plot(mergUrban$off.speech,mergUrban$betterheal)
### if off.occupational is true, betterdrug is higher
plot(mergUrban$off.speech,mergUrban$betterdrug)
plot(mergUrban$off.speech,mergUrban$admitted)
plot(mergUrban$off.speech,mergUrban$urgent)
plot(mergUrban$off.speech,mergUrban$worseulcers)
### if off.occupational is true, medication is higher
plot(mergUrban$off.speech,mergUrban$medication)
### if off.occupational is true, episode is higher
plot(mergUrban$off.speech,mergUrban$episode)
plot(mergUrban$off.speech,mergUrban$no.episodes)
plot(mergUrban$off.speech,mergUrban$age)

### if off.medical is true, rating is higher
plot(mergUrban$off.medical,mergUrban$rating)
### if off.medical is true, timely is higher
plot(mergUrban$off.medical,mergUrban$timely)
### if off.medical is true, taughtdrugs is higher
plot(mergUrban$off.medical,mergUrban$taughtdrugs)
### if off.medical is true, checkfall is higher
plot(mergUrban$off.medical,mergUrban$checkfall)
### if off.medical is true, checkdepression is higher
plot(mergUrban$off.medical,mergUrban$checkdepression)
### if off.medical is true, flushot is higher
plot(mergUrban$off.medical,mergUrban$flushot)
### if off.medical is true, pnumococcal is higher
plot(mergUrban$off.medical,mergUrban$pnumococcal)
### if off.medical is true, taughtfootcare is higher
plot(mergUrban$off.medical,mergUrban$taughtfootcare)
### if off.medical is true, betterwalking is higher
plot(mergUrban$off.medical,mergUrban$betterwalking)
### if off.medical is true, betterbed is higher
plot(mergUrban$off.medical,mergUrban$betterbed)
### if off.medical is true, betterbathing is higher
plot(mergUrban$off.medical,mergUrban$betterbathing)
### if off.medical is true, lesspain is higher
plot(mergUrban$off.medical,mergUrban$lesspain)
### if off.medical is true, betterbreathing is higher
plot(mergUrban$off.medical,mergUrban$betterbreathing)
### if off.medical is true, betterheal is lower
plot(mergUrban$off.medical,mergUrban$betterheal)
### if off.medical is true, betterdrug is higher
plot(mergUrban$off.medical,mergUrban$betterdrug)
plot(mergUrban$off.medical,mergUrban$admitted)
### if off.medical is true, urgent is lower
plot(mergUrban$off.medical,mergUrban$urgent)
plot(mergUrban$off.medical,mergUrban$worseulcers)
### if off.medical is true, medication is higher
plot(mergUrban$off.medical,mergUrban$medication)
### if off.medical is true, episode is higher
plot(mergUrban$off.medical,mergUrban$episode)
plot(mergUrban$off.medical,mergUrban$no.episodes)
plot(mergUrban$off.medical,mergUrban$age)

### if off.hha is true, rating is higher
plot(mergUrban$off.hha,mergUrban$rating)
plot(mergUrban$off.hha,mergUrban$timely)
plot(mergUrban$off.hha,mergUrban$taughtdrugs)
plot(mergUrban$off.hha,mergUrban$checkfall)
plot(mergUrban$off.hha,mergUrban$checkdepression)
plot(mergUrban$off.hha,mergUrban$flushot)
plot(mergUrban$off.hha,mergUrban$pnumococcal)
plot(mergUrban$off.hha,mergUrban$taughtfootcare)
plot(mergUrban$off.hha,mergUrban$betterwalking)
plot(mergUrban$off.hha,mergUrban$betterbed)
### if off.hha is true, betterbathing is higher
plot(mergUrban$off.hha,mergUrban$betterbathing)
### if off.hha is true, lesspain is higher
plot(mergUrban$off.hha,mergUrban$lesspain)
### if off.hha is true, betterbreathing is higher
plot(mergUrban$off.hha,mergUrban$betterbreathing)
### if off.hha is true, betterheal is lower
plot(mergUrban$off.hha,mergUrban$betterheal)
plot(mergUrban$off.hha,mergUrban$betterdrug)
### if off.hha is true, admitted is higher
plot(mergUrban$off.hha,mergUrban$admitted)
### if off.hha is true, urgent is lower
plot(mergUrban$off.hha,mergUrban$urgent)
plot(mergUrban$off.hha,mergUrban$worseulcers)
### if off.hha is true, medication is higher
plot(mergUrban$off.hha,mergUrban$medication)
### if off.hha is true, episode is higher
plot(mergUrban$off.hha,mergUrban$episode)
plot(mergUrban$off.hha,mergUrban$no.episodes)
plot(mergUrban$off.hha,mergUrban$age)












###################### Rural
plot(mergRural$type,mergRural$off.physical)
## if mergRural$type=="Non - Profit Religious", most of mergRural$off.physical is true (1 vs 116)
table(mergRural$off.physical[mergRural$type=="Non - Profit Religious"])
table(mergRural$off.physical[mergRural$type=="Government - Combination Government & Voluntary"])
plot(mergRural$off.physical,mergRural$type)



plot(mergRural$type,mergRural$off.occupational)
table(mergRural$off.occupational[mergRural$type=="Government - Combination Government & Voluntary"])
plot(mergRural$off.occupational,mergRural$type)

plot(mergRural$type,mergRural$off.speech)
table(mergRural$off.occupational[mergRural$type=="Government - Combination Government & Voluntary"])
plot(mergRural$off.speech,mergRural$type)

plot(mergRural$type,mergRural$off.medical)
table(mergRural$off.medical[mergRural$type=="Government - Combination Government & Voluntary"])
plot(mergRural$off.medical,mergRural$type)

plot(mergRural$type,mergRural$off.hha)
## if mergRural$type=="Government - Combination Government & Voluntary", all mergRural$off.hha is true (0 vs 10)
table(mergRural$off.hha[mergRural$type=="Government - Combination Government & Voluntary"])
plot(mergRural$off.hha,mergRural$type)


plot(mergRural$type,mergRural$readmitted)
plot(mergRural$readmitted,mergRural$type)

plot(mergRural$type,mergRural$reminddischarge)
plot(mergRural$reminddischarge,mergRural$type)



plot(mergRural$off.physical,mergRural$off.occupational)
table(mergRural$off.occupational[mergRural$off.physical=="true"])
### if mergRural$off.off.physical is false, most of mergRural$off.occupational is false (60 vs 1)
table(mergRural$off.occupational[mergRural$off.physical=="false"])
plot(mergRural$off.occupational,mergRural$off.physical)
### if mergRural$off.occupational=="true", most of mergRural$off.physical is true(1 vs 2076)
table(mergRural$off.physical[mergRural$off.occupational=="true"])

plot(mergRural$off.physical,mergRural$off.speech)
table(mergRural$off.speech[mergRural$off.physical=="true"])
### if mergRural$off.physical=="true", all of mergRural$off.speech is false(61 vs 0)
table(mergRural$off.speech[mergRural$off.physical=="false"])
plot(mergRural$off.speech,mergRural$off.physical)
### if mergRural$off.speech=="true", most of mergRural$off.physical is true(0 vs 1963)
table(mergRural$off.physical[mergRural$off.speech=="true"])

plot(mergRural$off.physical,mergRural$off.medical)
plot(mergRural$off.medical,mergRural$off.physical)
### if mergRural$off.medical=="true", most of mergRural$off.physical is true(8 vs 1623)
table(mergRural$off.physical[mergRural$off.medical=="true"])

plot(mergRural$off.physical,mergRural$off.hha)
table(mergRural$off.hha[mergRural$off.physical=="true"])
table(mergRural$off.hha[mergRural$off.physical=="false"])
plot(mergRural$off.hha,mergRural$off.physical)
table(mergRural$off.physical[mergRural$off.hha=="true"])
table(mergRural$off.physical[mergRural$off.hha=="false"])


plot(mergRural$off.occupational,mergRural$off.speech)
plot(mergRural$off.speech,mergRural$off.occupational)
table(mergRural$off.occupational[mergRural$off.speech=="true"])

plot(mergRural$off.occupational,mergRural$off.medical)
plot(mergRural$off.medical,mergRural$off.occupational)

plot(mergRural$off.occupational,mergRural$off.hha)
plot(mergRural$off.hha,mergRural$off.occupational)

plot(mergRural$off.speech,mergRural$off.medical)
plot(mergRural$off.medical,mergRural$off.speech)

plot(mergRural$off.speech,mergRural$off.hha)
plot(mergRural$off.hha,mergRural$off.speech)

plot(mergRural$off.medical,mergRural$off.hha)
plot(mergRural$off.hha,mergRural$off.medical)

plot(mergRural$type,mergRural$rating)
plot(mergRural$type,mergRural$timely)
plot(mergRural$type,mergRural$taughtdrugs)
plot(mergRural$type,mergRural$checkfall)
plot(mergRural$type,mergRural$checkdepression)
### if type is "Non - Profit Religious", flushot is higher
plot(mergRural$type,mergRural$flushot)
### if type is "Non - Profit Religious", pnumococcal is higher
plot(mergRural$type,mergRural$pnumococcal)
plot(mergRural$type,mergRural$taughtfootcare)
### if type is "Proprietary", betterwalking is higher
plot(mergRural$type,mergRural$betterwalking)
plot(mergRural$type,mergRural$betterbed)
plot(mergRural$type,mergRural$betterbathing)
plot(mergRural$type,mergRural$lesspain)
plot(mergRural$type,mergRural$betterbreathing)
### type is "Government - State/ County", betterheal is higher
plot(mergRural$type,mergRural$betterheal)
### type is "Proprietary", betterdrug is higher
plot(mergRural$type,mergRural$betterdrug)
plot(mergRural$type,mergRural$admitted)
plot(mergRural$type,mergRural$urgent)
### type is "Government - Combination Government & Voluntary", worseulcers is higher
plot(mergRural$type,mergRural$worseulcers)
plot(mergRural$type,mergRural$medication)
####
plot(mergRural$type,mergRural$episode)
plot(mergRural$type,mergRural$no.episodes)
plot(mergRural$type,mergRural$age)

### if off.physical is true, rating is higher
plot(mergRural$off.physical,mergRural$rating)
### if off.physical is true, timely is higher
plot(mergRural$off.physical,mergRural$timely)
### if off.physical is true, taughtdrugs is higher
plot(mergRural$off.physical,mergRural$taughtdrugs)
### if off.physical is true, checkfall is higher
plot(mergRural$off.physical,mergRural$checkfall)
### if off.physical is true, checkdepression is higher
plot(mergRural$off.physical,mergRural$checkdepression)
### if off.physical is true, flushot is higher
plot(mergRural$off.physical,mergRural$flushot)
### if off.physical is true, pumococcal is higher
plot(mergRural$off.physical,mergRural$pnumococcal)
### if off.physical is true, footcare is higher
plot(mergRural$off.physical,mergRural$taughtfootcare)
### if off.physical is true, betterwalking is higher
plot(mergRural$off.physical,mergRural$betterwalking)
### if off.physical is true, betterbed is higher
plot(mergRural$off.physical,mergRural$betterbed)
### if off.physical is true, betterbathing is lower
plot(mergRural$off.physical,mergRural$betterbathing)
### if off.physical is true, lesspain is higher
plot(mergRural$off.physical,mergRural$lesspain)
### if off.physical is true, betterbreathing is higher
plot(mergRural$off.physical,mergRural$betterbreathing)
### only off.physical is true note betterheal
plot(mergRural$off.physical,mergRural$betterheal)
### if off.physical is true, betterdrug is higher
plot(mergRural$off.physical,mergRural$betterdrug)
### if off.physical is true, admitted is higher
plot(mergRural$off.physical,mergRural$admitted)
### if off.physical is true, urgent is higher
plot(mergRural$off.physical,mergRural$urgent)
### if off.physical is true, worseulvers is lower
plot(mergRural$off.physical,mergRural$worseulcers)
### if off.physical is true, medicaiton is higher
plot(mergRural$off.physical,mergRural$medication)
### if off.physical is true, episode is higher
plot(mergRural$off.physical,mergRural$episode)
### if off.physical is true, no.episode is higher
plot(mergRural$off.physical,mergRural$no.episodes)
plot(mergRural$off.physical,mergRural$age)


plot(mergRural$off.occupational,mergRural$rating)
### if off.occupational is true, timely is higher
plot(mergRural$off.occupational,mergRural$timely)
### if off.occupational is true, taughtdrugs is higher
plot(mergRural$off.occupational,mergRural$taughtdrugs)
### if off.occupational is true, checkfall is higher
plot(mergRural$off.occupational,mergRural$checkfall)
### if off.occupational is true, checkdepression is higher
plot(mergRural$off.occupational,mergRural$checkdepression)
### if off.occupational is true, flushot is higher
plot(mergRural$off.occupational,mergRural$flushot)
### if off.occupational is true, pnumococcal is higher
plot(mergRural$off.occupational,mergRural$pnumococcal)
### if off.occupational is true, taughtfootcare is higher
plot(mergRural$off.occupational,mergRural$taughtfootcare)
### if off.occupational is true, betterwalking is higher
plot(mergRural$off.occupational,mergRural$betterwalking)
plot(mergRural$off.occupational,mergRural$betterbed)
### if off.occupational is true, betterbathing is higher
plot(mergRural$off.occupational,mergRural$betterbathing)
### if off.occupational is true, lesspain is higher
plot(mergRural$off.occupational,mergRural$lesspain)
### if off.occupational is true, betterbreathing is higher
plot(mergRural$off.occupational,mergRural$betterbreathing)
### if off.occupational is true, betterbreathing is lower
plot(mergRural$off.occupational,mergRural$betterheal)
plot(mergRural$off.occupational,mergRural$betterdrug)
plot(mergRural$off.occupational,mergRural$admitted)
plot(mergRural$off.occupational,mergRural$urgent)
plot(mergRural$off.occupational,mergRural$worseulcers)
### if off.occupational is true, medication is higher
plot(mergRural$off.occupational,mergRural$medication)
### if off.occupational is true, episode is higher
plot(mergRural$off.occupational,mergRural$episode)
plot(mergRural$off.occupational,mergRural$no.episodes)
plot(mergRural$off.occupational,mergRural$age)


############### have not checked below yet urban is quite different with rural anyway

plot(mergRural$off.speech,mergRural$rating)
### if off.speech is true, timely is higher
plot(mergRural$off.speech,mergRural$timely)
### if off.occupational is true, taughtdrugs is higher
plot(mergRural$off.speech,mergRural$taughtdrugs)
### if off.occupational is true, checkfall is higher
plot(mergRural$off.speech,mergRural$checkfall)
plot(mergRural$off.speech,mergRural$checkdepression)
### if off.speech is true, flushot is higher
plot(mergRural$off.speech,mergRural$flushot)
### if off.speech is true, pnumococcal is higherl)
plot(mergRural$off.speech,mergRural$pnumococcal)
### if off.occupational is true, taughtfootcare is higher
plot(mergRural$off.speech,mergRural$taughtfootcare)
plot(mergRural$off.speech,mergRural$betterwalking)
### if off.occupational is true, betterbed is higher
plot(mergRural$off.speech,mergRural$betterbed)
### if off.occupational is true, betterbathing is higher
plot(mergRural$off.speech,mergRural$betterbathing)
plot(mergRural$off.speech,mergRural$lesspain)
### if off.occupational is true, betterbreathing is higher
plot(mergRural$off.speech,mergRural$betterbreathing)
plot(mergRural$off.speech,mergRural$betterheal)
### if off.occupational is true, betterdrug is higher
plot(mergRural$off.speech,mergRural$betterdrug)
plot(mergRural$off.speech,mergRural$admitted)
plot(mergRural$off.speech,mergRural$urgent)
plot(mergRural$off.speech,mergRural$worseulcers)
### if off.occupational is true, medication is higher
plot(mergRural$off.speech,mergRural$medication)
### if off.occupational is true, episode is higher
plot(mergRural$off.speech,mergRural$episode)
plot(mergRural$off.speech,mergRural$no.episodes)
plot(mergRural$off.speech,mergRural$age)

### if off.medical is true, rating is higher
plot(mergRural$off.medical,mergRural$rating)
### if off.medical is true, timely is higher
plot(mergRural$off.medical,mergRural$timely)
### if off.medical is true, taughtdrugs is higher
plot(mergRural$off.medical,mergRural$taughtdrugs)
### if off.medical is true, checkfall is higher
plot(mergRural$off.medical,mergRural$checkfall)
### if off.medical is true, checkdepression is higher
plot(mergRural$off.medical,mergRural$checkdepression)
### if off.medical is true, flushot is higher
plot(mergRural$off.medical,mergRural$flushot)
### if off.medical is true, pnumococcal is higher
plot(mergRural$off.medical,mergRural$pnumococcal)
### if off.medical is true, taughtfootcare is higher
plot(mergRural$off.medical,mergRural$taughtfootcare)
### if off.medical is true, betterwalking is higher
plot(mergRural$off.medical,mergRural$betterwalking)
### if off.medical is true, betterbed is higher
plot(mergRural$off.medical,mergRural$betterbed)
### if off.medical is true, betterbathing is higher
plot(mergRural$off.medical,mergRural$betterbathing)
### if off.medical is true, lesspain is higher
plot(mergRural$off.medical,mergRural$lesspain)
### if off.medical is true, betterbreathing is higher
plot(mergRural$off.medical,mergRural$betterbreathing)
### if off.medical is true, betterheal is lower
plot(mergRural$off.medical,mergRural$betterheal)
### if off.medical is true, betterdrug is higher
plot(mergRural$off.medical,mergRural$betterdrug)
plot(mergRural$off.medical,mergRural$admitted)
### if off.medical is true, urgent is lower
plot(mergRural$off.medical,mergRural$urgent)
plot(mergRural$off.medical,mergRural$worseulcers)
### if off.medical is true, medication is higher
plot(mergRural$off.medical,mergRural$medication)
### if off.medical is true, episode is higher
plot(mergRural$off.medical,mergRural$episode)
plot(mergRural$off.medical,mergRural$no.episodes)
plot(mergRural$off.medical,mergRural$age)

### if off.hha is true, rating is higher
plot(mergRural$off.hha,mergRural$rating)
plot(mergRural$off.hha,mergRural$timely)
plot(mergRural$off.hha,mergRural$taughtdrugs)
plot(mergRural$off.hha,mergRural$checkfall)
plot(mergRural$off.hha,mergRural$checkdepression)
plot(mergRural$off.hha,mergRural$flushot)
plot(mergRural$off.hha,mergRural$pnumococcal)
plot(mergRural$off.hha,mergRural$taughtfootcare)
plot(mergRural$off.hha,mergRural$betterwalking)
plot(mergRural$off.hha,mergRural$betterbed)
### if off.hha is true, betterbathing is higher
plot(mergRural$off.hha,mergRural$betterbathing)
### if off.hha is true, lesspain is higher
plot(mergRural$off.hha,mergRural$lesspain)
### if off.hha is true, betterbreathing is higher
plot(mergRural$off.hha,mergRural$betterbreathing)
### if off.hha is true, betterheal is lower
plot(mergRural$off.hha,mergRural$betterheal)
plot(mergRural$off.hha,mergRural$betterdrug)
### if off.hha is true, admitted is higher
plot(mergRural$off.hha,mergRural$admitted)
### if off.hha is true, urgent is lower
plot(mergRural$off.hha,mergRural$urgent)
plot(mergRural$off.hha,mergRural$worseulcers)
### if off.hha is true, medication is higher
plot(mergRural$off.hha,mergRural$medication)
### if off.hha is true, episode is higher
plot(mergRural$off.hha,mergRural$episode)
plot(mergRural$off.hha,mergRural$no.episodes)
plot(mergRural$off.hha,mergRural$age)
