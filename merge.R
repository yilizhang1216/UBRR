numtype <-c('character','character','character','character','numeric')
numnames <- c('RPT_REC_NUM','WKSHT_CD','LINE_NUM','CLMN_NUM','size')
rptnames <- c('RPT_REC_NUM','CCN')

visit2014 <- read.csv("hha_2014_NMRC.CSV",sep=',',colClasses=numtype)
names(visit2014) <- numnames
visit2014 <- visit2014[visit2014$WKSHT_CD=="S300000"&visit2014$LINE_NUM=="00100"&visit2014$CLMN_NUM=="0100",]
dim(visit2014)
report2014 <- read.csv("hha_2014_RPT.CSV",sep=',')[,c(1,3)]
names(report2014) <- rptnames
size2014 <- merge(visit2014,report2014,by='RPT_REC_NUM')
size2014 <- size2014[,c(-1,-2,-3,-4)]
dim(size2014)
names(size2014)

visit2015 <- read.csv("hha_2015_NMRC.CSV",sep=',',colClasses=numtype)
names(visit2015) <- numnames
visit2015 <- visit2015[visit2015$WKSHT_CD=="S300000"&visit2015$LINE_NUM=="00100"&visit2015$CLMN_NUM=="0100",]
dim(visit2015)
report2015 <- read.csv("hha_2015_RPT.CSV",sep=',')[,c(1,3)]
names(report2015) <- rptnames
size2015 <- merge(visit2015,report2015,by='RPT_REC_NUM')
size2015 <- size2015[,c(-1,-2,-3,-4)]
dim(size2015)
names(size2015)

visit2016 <- read.csv("hha_2016_NMRC.CSV",sep=',',colClasses=numtype)
names(visit2016) <- numnames
visit2016 <- visit2016[visit2016$WKSHT_CD=="S300000"&visit2016$LINE_NUM=="00100"&visit2016$CLMN_NUM=="0100",]
dim(visit2016)
report2016 <- read.csv("hha_2016_RPT.CSV",sep=',')[,c(1,3)]
names(report2016) <- rptnames
size2016 <- merge(visit2016,report2016,by='RPT_REC_NUM')
size2016 <- size2016[,c(-1,-2,-3,-4)]
dim(size2016)
names(size2016)

visit2017 <- read.csv("hha_2017_NMRC.CSV",sep=',',colClasses=numtype)
names(visit2017) <- numnames
visit2017 <- visit2017[visit2017$WKSHT_CD=="S300000"&visit2017$LINE_NUM=="00100"&visit2017$CLMN_NUM=="0100",]
dim(visit2017)
report2017 <- read.csv("hha_2017_RPT.CSV",sep=',')[,c(1,3)]
names(report2017) <- rptnames
size2017 <- merge(visit2017,report2017,by='RPT_REC_NUM')
size2017 <- size2017[,c(-1,-2,-3,-4)]
dim(size2017)
names(size2017)

visit2018 <- read.csv("hha_2018_NMRC.CSV",sep=',',colClasses=numtype)
names(visit2018) <- numnames
visit2018 <- visit2018[visit2018$WKSHT_CD=="S300000"&visit2018$LINE_NUM=="00100"&visit2018$CLMN_NUM=="0100",]
dim(visit2018)
report2018 <- read.csv("hha_2018_RPT.CSV",sep=',')[,c(1,3)]
names(report2018) <- rptnames
size2018 <- merge(visit2018,report2018,by='RPT_REC_NUM')
size2018 <- size2018[,c(-1,-2,-3,-4)]
dim(size2018)
names(size2018)



mytypes60 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),22),'character')
names60 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','note')

mytypes66 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),23),rep(c('factor','character'),2),'character')
names66 <-  c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','checkpain','note-checkpain','treatpain','note-treatpain','treatheart','note-treatheart','actionsores','note-actionsores','treatsores','note-treatsores','checksores','note-checksores','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','readmit','not-readmit','emergency','note-emergency','note')

mytypes54 <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'character')
names54 <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','urgent','note-urgent','admitted','note-admitted','readmit','not-readmit','emergency','note-emergency','note')

setdiff(names60, names66)
setdiff(names66, names60)
setdiff(names54, names60)
setdiff(names60, names54)
setdiff(names54, names66)
setdiff(names66, names54)

df20141 <- read.csv("HHC_SOCRATA_PRVDR20141.csv",sep=',',colClasses=mytypes60)
length(names(df20141))
names(df20141) <- names60

df20142 <- read.csv("HHC_SOCRATA_PRVDR20142.csv",sep=',',colClasses=mytypes60)
length(names(df20142))
names(df20142) <- names60

df20143 <- read.csv("HHC_SOCRATA_PRVDR20143.csv",sep=',',colClasses=mytypes60)
length(names(df20143))
names(df20143) <- names60

df20144 <- read.csv("HHC_SOCRATA_PRVDR20144.csv",sep=',',colClasses=mytypes60)
length(names(df20144))
names(df20144) <- names60

df20151 <- read.csv("HHC_SOCRATA_PRVDR20151.csv",sep=',',colClasses=mytypes60)
length(names(df20151))
names(df20151) <- names60

df20152 <- read.csv("HHC_SOCRATA_PRVDR20152.csv",sep=',',colClasses=mytypes60)
length(names(df20152))
names(df20152) <- names60

df20153 <- read.csv("HHC_SOCRATA_PRVDR20153.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20153))
names(df20153) <- names66

df20154 <- read.csv("HHC_SOCRATA_PRVDR20154.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20154))
names(df20154) <- names66

df20161 <- read.csv("HHC_SOCRATA_PRVDR20161.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20161))
names(df20161) <- names66

df20162 <- read.csv("HHC_SOCRATA_PRVDR20162.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20162))
names(df20162) <- names66

df20163 <- read.csv("HHC_SOCRATA_PRVDR20163.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20163))
names(df20163) <- names66

df20164 <- read.csv("HHC_SOCRATA_PRVDR20164.csv",sep=',',colClasses=mytypes66,na.strings = "NotAvailable")
length(names(df20164))
names(df20164) <- names66

df20171 <- read.csv("HHC_SOCRATA_PRVDR20171.csv",sep=',',colClasses=mytypes54)
length(names(df20171))
names(df20171) <- names54

df20172 <- read.csv("HHC_SOCRATA_PRVDR20172.csv",sep=',',colClasses=mytypes54)
length(names(df20172))
names(df20172) <- names54

df20173 <- read.csv("HHC_SOCRATA_PRVDR20173.csv",sep=',',colClasses=mytypes54)
length(names(df20173))
names(df20173) <- names54

df20174 <- read.csv("HHC_SOCRATA_PRVDR20174.csv",sep=',',colClasses=mytypes54)
length(names(df20174))
names(df20174) <- names54

df20181 <- read.csv("HHC_SOCRATA_PRVDR20181.csv",sep=',',colClasses=mytypes54)
length(names(df20181))
names(df20181) <- names54

df20182 <- read.csv("HHC_SOCRATA_PRVDR20182.csv",sep=',',colClasses=mytypes54)
length(names(df20182))
names(df20182) <- names54

df20183 <- read.csv("HHC_SOCRATA_PRVDR20183.csv",sep=',',colClasses=mytypes54)
length(names(df20183))
names(df20183) <- names54

df20184 <- read.csv("HHC_SOCRATA_PRVDR20184.csv",sep=',',colClasses=mytypes54)
length(names(df20184))
names(df20184) <- names54

df20141 <- df20141[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20142 <- df20142[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20143 <- df20143[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20144 <- df20144[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20151 <- df20151[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20152 <- df20152[,c(-30,-31,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41)]
df20153 <- df20153[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20154 <- df20154[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20161 <- df20161[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20162 <- df20162[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20163 <- df20163[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20164 <- df20164[,c(-16,-17,-32,-33,-34,-35,-36,-37,-38,-39,-40,-41,-42,-43,-62,-63,-64,-65)]
df20171 <- df20171[,c(-16,-17,-50,-51,-52,-53)]
df20172 <- df20172[,c(-16,-17,-50,-51,-52,-53)]
df20173 <- df20173[,c(-16,-17,-50,-51,-52,-53)]
df20174 <- df20174[,c(-16,-17,-50,-51,-52,-53)]
df20181 <- df20181[,c(-16,-17,-50,-51,-52,-53)]
df20182 <- df20182[,c(-16,-17,-50,-51,-52,-53)]
df20183 <- df20183[,c(-16,-17,-50,-51,-52,-53)]
df20184 <- df20184[,c(-16,-17,-50,-51,-52,-53)]


year20141 <- as.factor(rep('2014',nrow(df20141)))
df20141$year <- year20141
year20142 <- as.factor(rep('2014',nrow(df20142)))
df20142$year <- year20142
year20143 <- as.factor(rep('2014',nrow(df20143)))
df20143$year <- year20143
year20144 <- as.factor(rep('2014',nrow(df20144)))
df20144$year <- year20144

year20151 <- as.factor(rep('2015',nrow(df20151)))
df20151$year <- year20151
year20152 <- as.factor(rep('2015',nrow(df20152)))
df20152$year <- year20152
year20153 <- as.factor(rep('2015',nrow(df20153)))
df20153$year <- year20153
year20154 <- as.factor(rep('2015',nrow(df20154)))
df20154$year <- year20154

year20161 <- as.factor(rep('2016',nrow(df20161)))
df20161$year <- year20161
year20162 <- as.factor(rep('2016',nrow(df20162)))
df20162$year <- year20162
year20163 <- as.factor(rep('2016',nrow(df20163)))
df20163$year <- year20163
year20164 <- as.factor(rep('2016',nrow(df20164)))
df20164$year <- year20164

year20171 <- as.factor(rep('2017',nrow(df20171)))
df20171$year <- year20171
year20172 <- as.factor(rep('2017',nrow(df20172)))
df20172$year <- year20172
year20173 <- as.factor(rep('2017',nrow(df20173)))
df20173$year <- year20173
year20174 <- as.factor(rep('2017',nrow(df20174)))
df20174$year <- year20174

year20181 <- as.factor(rep('2018',nrow(df20181)))
df20181$year <- year20181
year20182 <- as.factor(rep('2018',nrow(df20182)))
df20182$year <- year20182
year20183 <- as.factor(rep('2018',nrow(df20183)))
df20183$year <- year20183
year20184 <- as.factor(rep('2018',nrow(df20184)))
df20184$year <- year20184

ddf20141 <- merge(df20141,size2014,by='CCN')
ddf20142 <- merge(df20142,size2014,by='CCN')
ddf20143 <- merge(df20143,size2014,by='CCN')
ddf20144 <- merge(df20144,size2014,by='CCN')
ddf20151 <- merge(df20151,size2015,by='CCN')
ddf20152 <- merge(df20152,size2015,by='CCN')
ddf20153 <- merge(df20153,size2015,by='CCN')
ddf20154 <- merge(df20154,size2015,by='CCN')
ddf20161 <- merge(df20161,size2016,by='CCN')
ddf20162 <- merge(df20162,size2016,by='CCN')
ddf20163 <- merge(df20163,size2016,by='CCN')
ddf20164 <- merge(df20164,size2016,by='CCN')
ddf20171 <- merge(df20171,size2017,by='CCN')
ddf20172 <- merge(df20172,size2017,by='CCN')
ddf20173 <- merge(df20173,size2017,by='CCN')
ddf20174 <- merge(df20174,size2017,by='CCN')
ddf20181 <- merge(df20181,size2018,by='CCN')
ddf20182 <- merge(df20182,size2018,by='CCN')
ddf20183 <- merge(df20183,size2018,by='CCN')
ddf20184 <- merge(df20184,size2018,by='CCN')


df <- rbind(ddf20141,ddf20142,ddf20143,ddf20144,ddf20151,ddf20152,ddf20153,ddf20154,ddf20161,ddf20162,ddf20163,ddf20164,ddf20171,ddf20172,ddf20173,ddf20174,ddf20181,ddf20182,ddf20183,ddf20184)


write.csv(df, file = "HHA2014-2018.csv",row.names=FALSE, na="")





