### data merge starts from here
mytypes60 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),22),'character')
names60 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','ER','note-ER','admitted','note-admitted','note')

mytypes66_1 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),23),rep(c('factor','character'),2),'character')
names66_1 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterdrug','note-betterdrug','ER','note-ER','admitted','note-admitted','readmit','note-readmit','emergency','note-emergency','note')

mytypes66_2 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),23),rep(c('factor','character'),2),'character')
names66_2 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note')

mytypes54 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'character')
names54 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note')

mytypes63 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'factor','numeric','character','factor','character',rep(c('numeric','character'),2),'numeric')
names63 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note','newulcers','note-newulcers','remained','note-remained','medication','note-medication','spend','note-spend','episodes')

mytypes79 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'factor','numeric','character','factor','character','numeric','character',rep('numeric',6),'factor','character',rep('numeric',6),'factor','character','numeric','character','numeric')
names79 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note','newulcers','note-newulcers','remained','note-remained','medication','note-medication','DTC1','DTC2','DTC3','DTC4','DTC5','DTC6','DTC7','note-DTC','PPR1','PPR2','PPR3','PPR4','PPR5','PPR6','PPR7','note-PPR','spend','note-spend','episodes')


setdiff(names60, names66_2)
setdiff(names66_2, names60)
setdiff(names54, names60)
setdiff(names60, names54)
setdiff(names54, names66_2)
setdiff(names66_2, names54)
setdiff(names54,names63)
setdiff(names60,names63)
setdiff(names66_2,names63)
setdiff(names54,names79)
setdiff(names60,names79)
setdiff(names66_2,names79)

df20141 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20141.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20141))
names(df20141) <- names60
df20141 <- cbind(df20141[,c(1:55)],df20141[,c(58:59)],df20141[,c(56:57)],df20141[,60])
names(df20141)[60] <- 'note'
names(df20141)

df20142 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20142.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20142))
names(df20142) <- names60
df20142 <- cbind(df20142[,c(1:55)],df20142[,c(58:59)],df20142[,c(56:57)],df20142[,60])
names(df20142)[60] <- 'note'
names(df20142)

df20143 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20143.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20143))
names(df20143) <- names60
df20143 <- cbind(df20143[,c(1:55)],df20143[,c(58:59)],df20143[,c(56:57)],df20143[,60])
names(df20143)[60] <- 'note'
names(df20143)

df20144 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20144.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20144))
names(df20144) <- names60
df20144 <- cbind(df20144[,c(1:55)],df20144[,c(58:59)],df20144[,c(56:57)],df20144[,60])
names(df20144)[60] <- 'note'
names(df20144)

df20151 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20151.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20151))
names(df20151) <- names60
df20151 <- cbind(df20151[,c(1:55)],df20151[,c(58:59)],df20151[,c(56:57)],df20151[,60])
names(df20151)[60] <- 'note'
names(df20151)

df20152 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20152.csv",sep=',',colClasses=mytypes60,check.names = F)
length(names(df20152))
names(df20152) <- names60
df20152 <- cbind(df201512[,c(1:55)],df20152[,c(58:59)],df20152[,c(56:57)],df20152[,60])
names(df20152)[60] <- 'note'
names(df20152)

df20153 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20153.csv",sep=',',colClasses=mytypes66_1,na.strings = "NotAvailable",check.names = F)
length(names(df20153))
names(df20153) <- names66_1
df20153 <- cbind(df201513[,c(1:55)],df20153[,c(60:61)],df20153[,c(58:59)],df20153[,c(62:66)])
names(df20153)[66] <- 'note'
names(df20153)

df20154 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20154.csv",sep=',',colClasses=mytypes66_1,na.strings = "NotAvailable",check.names = F)
length(names(df20154))
names(df20154) <- names66_1
df20154 <- cbind(df201514[,c(1:55)],df20154[,c(60:61)],df20154[,c(58:59)],df20154[,c(62:66)])
names(df20154)[66] <- 'note'
names(df20154)

df20161 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20161.csv",sep=',',colClasses=mytypes66_2,na.strings = "NotAvailable",check.names = F)
length(names(df20161))
names(df20161) <- names66_2

df20162 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20162.csv",sep=',',colClasses=mytypes66_2,na.strings = "NotAvailable",check.names = F)
length(names(df20162))
names(df20162) <- names66_2

df20163 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20163.csv",sep=',',colClasses=mytypes66_2,na.strings = "NotAvailable",check.names = F)
length(names(df20163))
names(df20163) <- names66_2

df20164 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20164.csv",sep=',',colClasses=mytypes66_2,na.strings = "NotAvailable",check.names = F)
length(names(df20164))
names(df20164) <- names66_2

df20171 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20171.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20171))
names(df20171) <- names54

df20172 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20172.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20172))
names(df20172) <- names54

df20173 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20173.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20173))
names(df20173) <- names54

df20174 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20174.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20174))
names(df20174) <- names54

df20181 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20181.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20181))
names(df20181) <- names54

df20182 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20182.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20182))
names(df20182) <- names54

df20183 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20183.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20183))
names(df20183) <- names54

df20184 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20184.csv",sep=',',colClasses=mytypes54,check.names = F)
length(names(df20184))
names(df20184) <- names54

df20191 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20191.csv",sep=',',colClasses=mytypes63,check.names = F)
length(names(df20191))
names(df20191) <- names63

df20192 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20192.csv",sep=',',colClasses=mytypes63,check.names = F)
length(names(df20192))
names(df20192) <- names63

df20193 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20193.csv",sep=',',colClasses=mytypes63,check.names = F)
length(names(df20193))
names(df20193) <- names63

df20194 <- read.csv("input/data/HHAALL/HHC_SOCRATA_PRVDR20194.csv",sep=',',colClasses=mytypes79,na.strings = "NotAvailable",check.names = F)
length(names(df20194))
names(df20194) <- names79

hha20141 <- df20141[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20142 <- df20142[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20143 <- df20143[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20144 <- df20144[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20151 <- df20151[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20152 <- df20152[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
hha20153 <- df20153[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20154 <- df20154[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20161 <- df20161[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20162 <- df20162[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20163 <- df20163[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20164 <- df20164[,c(-16,-17,-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55,-62,-63,-64,-65)]
hha20171 <- df20171[,c(-16,-17,-50,-51,-52,-53)]
hha20172 <- df20172[,c(-16,-17,-50,-51,-52,-53)]
hha20173 <- df20173[,c(-16,-17,-50,-51,-52,-53)]
hha20174 <- df20174[,c(-16,-17,-50,-51,-52,-53)]
hha20181 <- df20181[,c(-16,-17,-50,-51,-52,-53)]
hha20182 <- df20182[,c(-16,-17,-50,-51,-52,-53)]
hha20183 <- df20183[,c(-16,-17,-50,-51,-52,-53)]
hha20184 <- df20184[,c(-16,-17,-50,-51,-52,-53)]
hha20191 <- df20191[,c(-16,-17,-50,-51,-52,-53,-55,-56,-57,-58,-59,-60,-61,-62,-63)]
hha20192 <- df20192[,c(-16,-17,-50,-51,-52,-53,-55,-56,-57,-58,-59,-60,-61,-62,-63)]
hha20193 <- df20193[,c(-16,-17,-50,-51,-52,-53,-55,-56,-57,-58,-59,-60,-61,-62,-63)]
hha20194 <- df20194[,c(-16,-17,-50,-51,-52,-53,-55,-56,-57,-58,-59,-60,-61,-62,-63,-64,-65,-66,-67,-68,-69,-70,-71,-72,-73,-74,-75,-76,-77,-78,-79)]


df2014_2019 <- rbind(hha20141,hha20142,hha20143,hha20144,hha20151,hha20152,hha20153,hha20154,hha20161,hha20162,hha20163,hha20164,hha20171,hha20172,hha20173,hha20174,hha20181,hha20182,hha20183,hha20184,hha20191,hha20192,hha20193,hha20194)
write.csv(df2014_2019, file = "input/HHA2014-2019.csv",row.names=FALSE, na="")


Hha20153 <- df20153[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20154 <- df20154[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20161 <- df20161[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20162 <- df20162[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20163 <- df20163[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20164 <- df20164[,c(-32,-33,-34,-35,-36,-37,-50,-51,-52,-53,-54,-55)]
Hha20171 <- df20171
Hha20172 <- df20172
Hha20173 <- df20173
Hha20174 <- df20174
Hha20181 <- df20181
Hha20182 <- df20182
Hha20183 <- df20183
Hha20184 <- df20184
Hha20191 <- df20191[,c(-55,-56,-57,-58,-59,-60,-61,-62,-63)]
Hha20192 <- df20192[,c(-55,-56,-57,-58,-59,-60,-61,-62,-63)]
Hha20193 <- df20193[,c(-55,-56,-57,-58,-59,-60,-61,-62,-63)]
Hha20194 <- df20194[,c(-55,-56,-57,-58,-59,-60,-61,-62,-63,-64,-65,-66,-67,-68,-69,-70,-71,-72,-73,-74,-75,-76,-77,-78,-79)]

df2015_2019 <- rbind(Hha20153,Hha20154,Hha20161,Hha20162,Hha20163,Hha20164,Hha20171,Hha20172,Hha20173,Hha20174,Hha20181,Hha20182,Hha20183,Hha20184,Hha20191,Hha20192,Hha20193,Hha20194)
write.csv(df2015_2019, file = "input/HHA2015-2019.csv",row.names=FALSE, na="")

df2016_2019 <- rbind(Hha20161,Hha20162,Hha20163,Hha20164,Hha20171,Hha20172,Hha20173,Hha20174,Hha20181,Hha20182,Hha20183,Hha20184,Hha20191,Hha20192,Hha20193,Hha20194)
write.csv(df2016_2019, file = "input/HHA2016-2019.csv",row.names=FALSE, na="")



year20141 <- rep(2014,nrow(df20141))
year20142 <- rep(2014,nrow(df20142))
year20143 <- rep(2014,nrow(df20143))
year20144 <- rep(2014,nrow(df20144))
season20141 <- rep(20141,nrow(df20141))
season20142 <- rep(20142,nrow(df20142))
season20143 <- rep(20143,nrow(df20143))
season20144 <- rep(20144,nrow(df20144))


year20151 <- rep(2015,nrow(df20151))
year20152 <- rep(2015,nrow(df20152))
year20153 <- rep(2015,nrow(df20153))
year20154 <- rep(2015,nrow(df20154))
season20151 <- rep(20151,nrow(df20151))
season20152 <- rep(20152,nrow(df20152))
season20153 <- rep(20153,nrow(df20153))
season20154 <- rep(20154,nrow(df20154))

year20161 <- rep(2016,nrow(df20161))
year20162 <- rep(2016,nrow(df20162))
year20163 <- rep(2016,nrow(df20163))
year20164 <- rep(2016,nrow(df20164))
season20161 <- rep(20161,nrow(df20161))
season20162 <- rep(20162,nrow(df20162))
season20163 <- rep(20163,nrow(df20163))
season20164 <- rep(20164,nrow(df20164))

year20171 <- rep(2017,nrow(df20171))
year20172 <- rep(2017,nrow(df20172))
year20173 <- rep(2017,nrow(df20173))
year20174 <- rep(2017,nrow(df20174))
season20171 <- rep(20171,nrow(df20171))
season20172 <- rep(20172,nrow(df20172))
season20173 <- rep(20173,nrow(df20173))
season20174 <- rep(20174,nrow(df20174))


year20181 <- rep(2018,nrow(df20181))
year20182 <- rep(2018,nrow(df20182))
year20183 <- rep(2018,nrow(df20183))
year20184 <- rep(2018,nrow(df20184))
season20181 <- rep(20181,nrow(df20181))
season20182 <- rep(20182,nrow(df20182))
season20183 <- rep(20183,nrow(df20183))
season20184 <- rep(20184,nrow(df20184))


year20191 <- rep(2019,nrow(df20191))
year20192 <- rep(2019,nrow(df20192))
year20193 <- rep(2019,nrow(df20193))
year20194 <- rep(2019,nrow(df20194))
season20191 <- rep(20191,nrow(df20191))
season20192 <- rep(20192,nrow(df20192))
season20193 <- rep(20193,nrow(df20193))
season20194 <- rep(20194,nrow(df20194))

year2014_2019 <- c(year20141,year20142,year20143,year20144,year20151,year20152,year20153,year20154,year20161,year20162,year20163,year20164,year20171,year20172,year20173,year20174,year20181,year20182,year20183,year20184,year20191,year20192,year20193,year20194)
season2014_2019 <- c(season20141,season20142,season20143,season20144,season20151,season20152,season20153,season20154,season20161,season20162,season20163,season20164,season20171,season20172,season20173,season20174,season20181,season20182,season20183,season20184,season20191,season20192,season20193,season20194)

year2015_2019 <- c(year20153,year20154,year20161,year20162,year20163,year20164,year20171,year20172,year20173,year20174,year20181,year20182,year20183,year20184,year20191,year20192,year20193,year20194)
season2015_2019 <- c(season20153,season20154,season20161,season20162,season20163,season20164,season20171,season20172,season20173,season20174,season20181,season20182,season20183,season20184,season20191,season20192,season20193,season20194)

year2016_2019 <- c(year20161,year20162,year20163,year20164,year20171,year20172,year20173,year20174,year20181,year20182,year20183,year20184,year20191,year20192,year20193,year20194)
season2016_2019 <- c(season20161,season20162,season20163,season20164,season20171,season20172,season20173,season20174,season20181,season20182,season20183,season20184,season20191,season20192,season20193,season20194)

df2014_2019$year <- year2014_2019
df2014_2019$season <- season2014_2019
df2015_2019$year <- year2015_2019
df2015_2019$season <- season2015_2019
df2016_2019$year <- year2016_2019
df2016_2019$season <- season2016_2019

write.csv(df2014_2019, file = "input/HHA2014-2019(time).csv",row.names=FALSE, na="")
write.csv(df2015_2019, file = "input/HHA2015-2019(time).csv",row.names=FALSE, na="")
write.csv(df2016_2019, file = "input/HHA2016-2019(time).csv",row.names=FALSE, na="")





