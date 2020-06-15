ep2010 <- read.csv("input/data/HHAALL/EpisodeData/Episode2010.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2011 <- read.csv("input/data/HHAALL/EpisodeData/Episode2011.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2012 <- read.csv("input/data/HHAALL/EpisodeData/Episode2012.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2013 <- read.csv("input/data/HHAALL/EpisodeData/Episode2013.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2014 <- read.csv("input/data/HHAALL/EpisodeData/Episode2014.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2015 <- read.csv("input/data/HHAALL/EpisodeData/Episode2015.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2016 <- read.csv("input/data/HHAALL/EpisodeData/Episode2016.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2017 <- read.csv("input/data/HHAALL/EpisodeData/Episode2017.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2018 <- read.csv("input/data/HHAALL/EpisodeData/Episode2018.csv",sep=',',colClasses=c('character','numeric'),check.names = F)
ep2019 <- read.csv("input/data/HHAALL/EpisodeData/Episode2019.csv",sep=',',colClasses=c('character','numeric'),check.names = F)

### 
mytypes27 <- c(rep('character',3),rep('factor',3),'character','factor','character',rep('factor',6),rep('numeric',12))
names27 <- c('CCN','name','address','city','state','Zip','phone','type','date','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','betterwalking','betterbed','bladdercontrol','lesspain','betterbathing','betterdrug','lessshortbreath','admitted','ER','stayathome','medicalwound','woundimproved')

mytypes38 <- c(rep('character',3),rep('factor',3),'character','factor','character',rep('factor',6),rep('numeric',23))
names38 <- c('CCN','name','address','city','state','Zip','phone','type','date','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','checkpain','treatpain','treatheart','actionsores','treatsores','checksores','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','moresore','betterdrug','ER','admitted')

mytypes37 <- c(rep('character',3),rep('factor',3),'character','factor','character',rep('factor',6),rep('numeric',22))
names37 <- c('CCN','name','address','city','state','Zip','phone','type','date','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','checkpain','treatpain','treatheart','actionsores','treatsores','checksores','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','ER','admitted')


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

INTG_types <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',17))
INTG_names <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER')
INTG_names ##32

df20101 <- read.csv("input/data/HHAALL/ProviderData/Provider20101.csv",sep=',',colClasses=mytypes27,check.names = F)
names(df20101) <- names27
setdiff(INTG_names,names27)
df20101_bf <- data.frame(df20101[,1],df20101[,5],df20101[,c(2:4)],df20101[,c(6:8)],df20101[,c(10:15)],df20101[,9])
df20101_bf$rating <- NA
df20101_bf$timely <- NA
df20101_bf$taughtdrugs <- NA
df20101_bf$checkfall <- NA
df20101_bf$checkdepression <- NA
df20101_bf$flushot <- NA
df20101_bf$pnumococcal <- NA
df20101_bf$taughtfootcare <- NA
df20101_bf1 <- data.frame(df20101_bf,df20101[,c(16:17)],df20101[,20],df20101[,19])
df20101_bf1$betterbreathing <- NA
df20101_bf1$betterheal <- NA
df20101_bf2 <- data.frame(df20101_bf1,df20101[,21],df20101[,c(23:24)])
names(df20101_bf2) <- INTG_names
df20101_bf3 <- merge(x = df20101_bf2, y = ep2010, by = "CCN", all.x = TRUE)
year20101 <- rep(2010,nrow(df20101))
season20101 <- rep(1,nrow(df20101))
timeindex20101 <- rep(1,nrow(df20101))
df20101_bf3$year <- year20101
df20101_bf3$season <- season20101
df20101_bf3$timeindex <- timeindex20101
data20101 <- df20101_bf3


df20102 <- read.csv("input/data/HHAALL/ProviderData/Provider20102.csv",sep=',',colClasses=mytypes27,check.names = F)
names(df20102) <- names27
setdiff(INTG_names,names27)
df20102_bf <- data.frame(df20102[,1],df20102[,5],df20102[,c(2:4)],df20102[,c(6:8)],df20102[,c(10:15)],df20102[,9])
df20102_bf$rating <- NA
df20102_bf$timely <- NA
df20102_bf$taughtdrugs <- NA
df20102_bf$checkfall <- NA
df20102_bf$checkdepression <- NA
df20102_bf$flushot <- NA
df20102_bf$pnumococcal <- NA
df20102_bf$taughtfootcare <- NA
df20102_bf1 <- data.frame(df20102_bf,df20102[,c(16:17)],df20102[,20],df20102[,19])
df20102_bf1$betterbreathing <- NA
df20102_bf1$betterheal <- NA
df20102_bf2 <- data.frame(df20102_bf1,df20102[,21],df20102[,c(23:24)])
names(df20102_bf2) <- INTG_names
df20102_bf3 <- merge(x = df20102_bf2, y = ep2010, by = "CCN", all.x = TRUE)
year20102 <- rep(2010,nrow(df20102))
season20102 <- rep(2,nrow(df20102))
timeindex20102 <- rep(2,nrow(df20102))
df20102_bf3$year <- year20102
df20102_bf3$season <- season20102
df20102_bf3$timeindex <- timeindex20102
data20102 <- df20102_bf3


df20104 <- read.csv("input/data/HHAALL/ProviderData/Provider20104.csv",sep=',',colClasses=mytypes38,check.names = F)
names(df20104) <- names38
setdiff(INTG_names,names38)
df20104_bf <- data.frame(df20104[,1],df20104[,5],df20104[,c(2:4)],df20104[,c(6:8)],df20104[,c(10:15)],df20104[,9])
df20104_bf$rating <- NA
df20104_bf1 <- data.frame(df20104_bf,df20104[,c(16:22)],df20104[,29:34],df20104[,36],df20104[,38:37])
names(df20104_bf1) <- INTG_names
df20104_bf2 <- merge(x = df20104_bf1, y = ep2010, by = "CCN", all.x = TRUE)
year20104 <- rep(2010,nrow(df20104))
season20104 <- rep(4,nrow(df20104))
timeindex20104 <- rep(4,nrow(df20104))
df20104_bf2$year <- year20104
df20104_bf2$season <- season20104
df20104_bf2$timeindex <- timeindex20104
data20104 <- df20104_bf2



df20111 <- read.csv("input/data/HHAALL/ProviderData/Provider20111.csv",sep=',',colClasses=mytypes38,check.names = F)
names(df20111) <- names38
setdiff(INTG_names,names38)
df20111_bf <- data.frame(df20111[,1],df20111[,5],df20111[,c(2:4)],df20111[,c(6:8)],df20111[,c(10:15)],df20111[,9])
df20111_bf$rating <- NA
df20111_bf1 <- data.frame(df20111_bf,df20111[,c(16:22)],df20111[,29:34],df20111[,36],df20111[,38:37])
names(df20111_bf1) <- INTG_names
df20111_bf2 <- merge(x = df20111_bf1, y = ep2011, by = "CCN", all.x = TRUE)
year20111 <- rep(2011,nrow(df20111))
season20111 <- rep(1,nrow(df20111))
timeindex20111 <- rep(5,nrow(df20111))
df20111_bf2$year <- year20111
df20111_bf2$season <- season20111
df20111_bf2$timeindex <- timeindex20111
data20111 <- df20111_bf2



df20112 <- read.csv("input/data/HHAALL/ProviderData/Provider20112.csv",sep=',',colClasses=mytypes38,check.names = F)
names(df20112) <- names38
setdiff(INTG_names,names38)
df20112_bf <- data.frame(df20112[,1],df20112[,5],df20112[,c(2:4)],df20112[,c(6:8)],df20112[,c(10:15)],df20112[,9])
df20112_bf$rating <- NA
df20112_bf1 <- data.frame(df20112_bf,df20112[,c(16:22)],df20112[,29:34],df20112[,36],df20112[,38:37])
names(df20112_bf1) <- INTG_names
df20112_bf2 <- merge(x = df20112_bf1, y = ep2011, by = "CCN", all.x = TRUE)
year20112 <- rep(2011,nrow(df20112))
season20112 <- rep(2,nrow(df20112))
timeindex20112 <- rep(6,nrow(df20112))
df20112_bf2$year <- year20112
df20112_bf2$season <- season20112
df20112_bf2$timeindex <- timeindex20112
data20112 <- df20112_bf2


df20113 <- read.csv("input/data/HHAALL/ProviderData/Provider20113.csv",sep=',',colClasses=mytypes38,check.names = F)
names(df20113) <- names38
setdiff(INTG_names,names38)
df20113_bf <- data.frame(df20113[,1],df20113[,5],df20113[,c(2:4)],df20113[,c(6:8)],df20113[,c(10:15)],df20113[,9])
df20113_bf$rating <- NA
df20113_bf1 <- data.frame(df20113_bf,df20113[,c(16:22)],df20113[,29:34],df20113[,36],df20113[,38:37])
names(df20113_bf1) <- INTG_names
df20113_bf2 <- merge(x = df20113_bf1, y = ep2011, by = "CCN", all.x = TRUE)
year20113 <- rep(2011,nrow(df20113))
season20113 <- rep(3,nrow(df20113))
timeindex20113 <- rep(7,nrow(df20113))
df20113_bf2$year <- year20113
df20113_bf2$season <- season20113
df20113_bf2$timeindex <- timeindex20113
data20113 <- df20113_bf2


df20114 <- read.csv("input/data/HHAALL/ProviderData/Provider20114.csv",sep=',',colClasses=mytypes38,check.names = F)
names(df20114) <- names38
setdiff(INTG_names,names38)
df20114_bf <- data.frame(df20114[,1],df20114[,5],df20114[,c(2:4)],df20114[,c(6:8)],df20114[,c(10:15)],df20114[,9])
df20114_bf$rating <- NA
df20114_bf1 <- data.frame(df20114_bf,df20114[,c(16:22)],df20114[,29:34],df20114[,36],df20114[,38:37])
names(df20114_bf1) <- INTG_names
df20114_bf2 <- merge(x = df20114_bf1, y = ep2011, by = "CCN", all.x = TRUE)
year20114 <- rep(2011,nrow(df20114))
season20114 <- rep(4,nrow(df20114))
timeindex20114 <- rep(8,nrow(df20114))
df20114_bf2$year <- year20114
df20114_bf2$season <- season20114
df20114_bf2$timeindex <- timeindex20114
data20114 <- df20114_bf2



df20121 <- read.csv("input/data/HHAALL/ProviderData/Provider20121.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20121) <- names37
setdiff(INTG_names,names37)
df20121_bf <- data.frame(df20121[,1],df20121[,5],df20121[,c(2:4)],df20121[,c(6:8)],df20121[,c(10:15)],df20121[,9])
df20121_bf$rating <- NA
df20121_bf1 <- data.frame(df20121_bf,df20121[,c(16:22)],df20121[,29:35],df20121[,37:36])
names(df20121_bf1) <- INTG_names
df20121_bf2 <- merge(x = df20121_bf1, y = ep2012, by = "CCN", all.x = TRUE)
year20121 <- rep(2012,nrow(df20121))
season20121 <- rep(1,nrow(df20121))
timeindex20121 <- rep(9,nrow(df20121))
df20121_bf2$year <- year20121
df20121_bf2$season <- season20121
df20121_bf2$timeindex <- timeindex20121
data20121 <- df20121_bf2



df20122 <- read.csv("input/data/HHAALL/ProviderData/Provider20122.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20122) <- names37
setdiff(INTG_names,names37)
df20122_bf <- data.frame(df20122[,1],df20122[,5],df20122[,c(2:4)],df20122[,c(6:8)],df20122[,c(10:15)],df20122[,9])
df20122_bf$rating <- NA
df20122_bf1 <- data.frame(df20122_bf,df20122[,c(16:22)],df20122[,29:35],df20122[,37:36])
names(df20122_bf1) <- INTG_names
df20122_bf2 <- merge(x = df20122_bf1, y = ep2012, by = "CCN", all.x = TRUE)
year20122 <- rep(2012,nrow(df20122))
season20122 <- rep(2,nrow(df20122))
timeindex20122 <- rep(10,nrow(df20122))
df20122_bf2$year <- year20122
df20122_bf2$season <- season20122
df20122_bf2$timeindex <- timeindex20122
data20122 <- df20122_bf2


df20123 <- read.csv("input/data/HHAALL/ProviderData/Provider20123.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20123) <- names37
setdiff(INTG_names,names37)
df20123_bf <- data.frame(df20123[,1],df20123[,5],df20123[,c(2:4)],df20123[,c(6:8)],df20123[,c(10:15)],df20123[,9])
df20123_bf$rating <- NA
df20123_bf1 <- data.frame(df20123_bf,df20123[,c(16:22)],df20123[,29:35],df20123[,37:36])
names(df20123_bf1) <- INTG_names
df20123_bf2 <- merge(x = df20123_bf1, y = ep2012, by = "CCN", all.x = TRUE)
year20123 <- rep(2012,nrow(df20123))
season20123 <- rep(3,nrow(df20123))
timeindex20123 <- rep(11,nrow(df20123))
df20123_bf2$year <- year20123
df20123_bf2$season <- season20123
df20123_bf2$timeindex <- timeindex20123
data20123 <- df20123_bf2


df20124 <- read.csv("input/data/HHAALL/ProviderData/Provider20124.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20124) <- names37
setdiff(INTG_names,names37)
df20124_bf <- data.frame(df20124[,1],df20124[,5],df20124[,c(2:4)],df20124[,c(6:8)],df20124[,c(10:15)],df20124[,9])
df20124_bf$rating <- NA
df20124_bf1 <- data.frame(df20124_bf,df20124[,c(16:22)],df20124[,29:35],df20124[,37:36])
names(df20124_bf1) <- INTG_names
df20124_bf2 <- merge(x = df20124_bf1, y = ep2012, by = "CCN", all.x = TRUE)
year20124 <- rep(2012,nrow(df20124))
season20124 <- rep(4,nrow(df20124))
timeindex20124 <- rep(12,nrow(df20124))
df20124_bf2$year <- year20124
df20124_bf2$season <- season20124
df20124_bf2$timeindex <- timeindex20124
data20124 <- df20124_bf2


df20131 <- read.csv("input/data/HHAALL/ProviderData/Provider20131.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20131) <- names37
setdiff(INTG_names,names37)
df20131_bf <- data.frame(df20131[,1],df20131[,5],df20131[,c(2:4)],df20131[,c(6:8)],df20131[,c(10:15)],df20131[,9])
df20131_bf$rating <- NA
df20131_bf1 <- data.frame(df20131_bf,df20131[,c(16:22)],df20131[,29:35],df20131[,37:36])
names(df20131_bf1) <- INTG_names
df20131_bf2 <- merge(x = df20131_bf1, y = ep2013, by = "CCN", all.x = TRUE)
year20131 <- rep(2013,nrow(df20131))
season20131 <- rep(1,nrow(df20131))
timeindex20131 <- rep(13,nrow(df20131))
df20131_bf2$year <- year20131
df20131_bf2$season <- season20131
df20131_bf2$timeindex <- timeindex20131
data20131 <- df20131_bf2




df20132 <- read.csv("input/data/HHAALL/ProviderData/Provider20132.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20132) <- names37
setdiff(INTG_names,names37)
df20132_bf <- data.frame(df20132[,1],df20132[,5],df20132[,c(2:4)],df20132[,c(6:8)],df20132[,c(10:15)],df20132[,9])
df20132_bf$rating <- NA
df20132_bf1 <- data.frame(df20132_bf,df20132[,c(16:22)],df20132[,29:35],df20132[,37:36])
names(df20132_bf1) <- INTG_names
df20132_bf2 <- merge(x = df20132_bf1, y = ep2013, by = "CCN", all.x = TRUE)
year20132 <- rep(2013,nrow(df20132))
season20132 <- rep(2,nrow(df20132))
timeindex20132 <- rep(14,nrow(df20132))
df20132_bf2$year <- year20132
df20132_bf2$season <- season20132
df20132_bf2$timeindex <- timeindex20132
data20132 <- df20132_bf2



df20133 <- read.csv("input/data/HHAALL/ProviderData/Provider20133.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20133) <- names37
setdiff(INTG_names,names37)
df20133_bf <- data.frame(df20133[,1],df20133[,5],df20133[,c(2:4)],df20133[,c(6:8)],df20133[,c(10:15)],df20133[,9])
df20133_bf$rating <- NA
df20133_bf1 <- data.frame(df20133_bf,df20133[,c(16:22)],df20133[,29:35],df20133[,37:36])
names(df20133_bf1) <- INTG_names
df20133_bf2 <- merge(x = df20133_bf1, y = ep2013, by = "CCN", all.x = TRUE)
year20133 <- rep(2013,nrow(df20133))
season20133 <- rep(3,nrow(df20133))
timeindex20133 <- rep(15,nrow(df20133))
df20133_bf2$year <- year20133
df20133_bf2$season <- season20133
df20133_bf2$timeindex <- timeindex20133
data20133 <- df20133_bf2



df20134 <- read.csv("input/data/HHAALL/ProviderData/Provider20134.csv",sep=',',colClasses=mytypes37,check.names = F)
names(df20134) <- names37
setdiff(INTG_names,names37)
df20134_bf <- data.frame(df20134[,1],df20134[,5],df20134[,c(2:4)],df20134[,c(6:8)],df20134[,c(10:15)],df20134[,9])
df20134_bf$rating <- NA
df20134_bf1 <- data.frame(df20134_bf,df20134[,c(16:22)],df20134[,29:35],df20134[,37:36])
names(df20134_bf1) <- INTG_names
df20134_bf2 <- merge(x = df20134_bf1, y = ep2013, by = "CCN", all.x = TRUE)
year20134 <- rep(2013,nrow(df20134))
season20134 <- rep(4,nrow(df20134))
timeindex20134 <- rep(16,nrow(df20134))
df20134_bf2$year <- year20134
df20134_bf2$season <- season20134
df20134_bf2$timeindex <- timeindex20134
data20134 <- df20134_bf2



df20141 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20141.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20141) <- names60
setdiff(INTG_names,names60)
df20141_bf <- data.frame(df20141[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20141_bf))
df20141_bf1 <- data.frame(df20141_bf[,c(2:1)],df20141_bf[,c(3:15)])
df20141_bf1$rating <- NA
df20141_bf2 <- data.frame(df20141_bf1,df20141_bf[,c(16:22)],df20141_bf[,c(29:35)],df20141_bf[,37:36])
names(df20141_bf2) <- INTG_names
df20141_bf3 <- merge(x = df20141_bf2, y = ep2014, by = "CCN", all.x = TRUE)
year20141 <- rep(2014,nrow(df20141))
season20141 <- rep(1,nrow(df20141))
timeindex20141 <- rep(17,nrow(df20141))
df20141_bf3$year <- year20141
df20141_bf3$season <- season20141
df20141_bf3$timeindex <- timeindex20141
data20141 <- df20141_bf3



df20142 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20142.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20142) <- names60
setdiff(INTG_names,names60)
df20142_bf <- data.frame(df20142[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20142_bf))
df20142_bf1 <- data.frame(df20142_bf[,c(2:1)],df20142_bf[,c(3:15)])
df20142_bf1$rating <- NA
df20142_bf2 <- data.frame(df20142_bf1,df20142_bf[,c(16:22)],df20142_bf[,c(29:35)],df20142_bf[,37:36])
names(df20142_bf2) <- INTG_names
df20142_bf3 <- merge(x = df20142_bf2, y = ep2014, by = "CCN", all.x = TRUE)
year20142 <- rep(2014,nrow(df20142))
season20142 <- rep(2,nrow(df20142))
timeindex20142 <- rep(18,nrow(df20142))
df20142_bf3$year <- year20142
df20142_bf3$season <- season20142
df20142_bf3$timeindex <- timeindex20142
data20142 <- df20142_bf3




df20143 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20143.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20143) <- names60
setdiff(INTG_names,names60)
df20143_bf <- data.frame(df20143[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20143_bf))
df20143_bf1 <- data.frame(df20143_bf[,c(2:1)],df20143_bf[,c(3:15)])
df20143_bf1$rating <- NA
df20143_bf2 <- data.frame(df20143_bf1,df20143_bf[,c(16:22)],df20143_bf[,c(29:35)],df20143_bf[,37:36])
names(df20143_bf2) <- INTG_names
df20143_bf3 <- merge(x = df20143_bf2, y = ep2014, by = "CCN", all.x = TRUE)
year20143 <- rep(2014,nrow(df20143))
season20143 <- rep(3,nrow(df20143))
timeindex20143 <- rep(19,nrow(df20143))
df20143_bf3$year <- year20143
df20143_bf3$season <- season20143
df20143_bf3$timeindex <- timeindex20143
data20143 <- df20143_bf3



df20144 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20144.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20144) <- names60
setdiff(INTG_names,names60)
df20144_bf <- data.frame(df20144[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20144_bf))
df20144_bf1 <- data.frame(df20144_bf[,c(2:1)],df20144_bf[,c(3:15)])
df20144_bf1$rating <- NA
df20144_bf2 <- data.frame(df20144_bf1,df20144_bf[,c(16:22)],df20144_bf[,c(29:35)],df20144_bf[,37:36])
names(df20144_bf2) <- INTG_names
df20144_bf3 <- merge(x = df20144_bf2, y = ep2014, by = "CCN", all.x = TRUE)
year20144 <- rep(2014,nrow(df20144))
season20144 <- rep(4,nrow(df20144))
timeindex20144 <- rep(20,nrow(df20144))
df20144_bf3$year <- year20144
df20144_bf3$season <- season20144
df20144_bf3$timeindex <- timeindex20144
data20144 <- df20144_bf3



df20151 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20151.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20151) <- names60
setdiff(INTG_names,names60)
df20151_bf <- data.frame(df20151[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20151_bf))
df20151_bf1 <- data.frame(df20151_bf[,c(2:1)],df20151_bf[,c(3:15)])
df20151_bf1$rating <- NA
df20151_bf2 <- data.frame(df20151_bf1,df20151_bf[,c(16:22)],df20151_bf[,c(29:35)],df20151_bf[,37:36])
names(df20151_bf2) <- INTG_names
df20151_bf3 <- merge(x = df20151_bf2, y = ep2015, by = "CCN", all.x = TRUE)
year20151 <- rep(2015,nrow(df20151))
season20151 <- rep(1,nrow(df20151))
timeindex20151 <- rep(21,nrow(df20151))
df20151_bf3$year <- year20151
df20151_bf3$season <- season20151
df20151_bf3$timeindex <- timeindex20151
data20151 <- df20151_bf3



df20152 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20152.csv",sep=',',colClasses=mytypes60,check.names = F)
names(df20152) <- names60
setdiff(INTG_names,names60)
df20152_bf <- data.frame(df20152[,-c(seq(17,by=2,len=22),60)])
setdiff(INTG_names,names(df20152_bf))
df20152_bf1 <- data.frame(df20152_bf[,c(2:1)],df20152_bf[,c(3:15)])
df20152_bf1$rating <- NA
df20152_bf2 <- data.frame(df20152_bf1,df20152_bf[,c(16:22)],df20152_bf[,c(29:35)],df20152_bf[,37:36])
names(df20152_bf2) <- INTG_names
df20152_bf3 <- merge(x = df20152_bf2, y = ep2015, by = "CCN", all.x = TRUE)
year20152 <- rep(2015,nrow(df20152))
season20152 <- rep(2,nrow(df20152))
timeindex20152 <- rep(22,nrow(df20152))
df20152_bf3$year <- year20152
df20152_bf3$season <- season20152
df20152_bf3$timeindex <- timeindex20152
data20152 <- df20152_bf3


df20153 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20153.csv",sep=',',colClasses=mytypes66_1,check.names = F,na.strings = "NotAvailable")
names(df20153) <- names66_1
setdiff(INTG_names,names66_1)
df20153_bf <- data.frame(df20153[,-c(seq(17,by=2,len=25),66)])
setdiff(INTG_names,names(df20153_bf))
df20153_bf1 <- data.frame(df20153_bf[,c(2:1)],df20153_bf[,c(3:23)],df20153_bf[,c(27:32)],df20153_bf[,c(36)],df20153_bf[,c(38:37)])
names(df20153_bf1) <- INTG_names
df20153_bf2 <- merge(x = df20153_bf1, y = ep2015, by = "CCN", all.x = TRUE)
year20153 <- rep(2015,nrow(df20153))
season20153 <- rep(3,nrow(df20153))
timeindex20153 <- rep(23,nrow(df20153))
df20153_bf2$year <- year20153
df20153_bf2$season <- season20153
df20153_bf2$timeindex <- timeindex20153
data20153 <- df20153_bf2



df20154 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20154.csv",sep=',',colClasses=mytypes66_1,check.names = F,na.strings = "NotAvailable")
names(df20154) <- names66_1
setdiff(INTG_names,names66_1)
df20154_bf <- data.frame(df20154[,-c(seq(17,by=2,len=25),66)])
setdiff(INTG_names,names(df20154_bf))
df20154_bf1 <- data.frame(df20154_bf[,c(2:1)],df20154_bf[,c(3:23)],df20154_bf[,c(27:32)],df20154_bf[,c(36)],df20154_bf[,c(38:37)])
names(df20154_bf1) <- INTG_names
df20154_bf2 <- merge(x = df20154_bf1, y = ep2015, by = "CCN", all.x = TRUE)
year20154 <- rep(2015,nrow(df20154))
season20154 <- rep(4,nrow(df20154))
timeindex20154 <- rep(24,nrow(df20154))
df20154_bf2$year <- year20154
df20154_bf2$season <- season20154
df20154_bf2$timeindex <- timeindex20154
data20154 <- df20154_bf2


df20161 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20161.csv",sep=',',colClasses=mytypes66_2,check.names = F,na.strings = "NotAvailable")
names(df20161) <- names66_2
setdiff(INTG_names,names66_2)
df20161_bf <- data.frame(df20161[,-c(seq(17,by=2,len=25),66)])
df20161_bf1 <- data.frame(df20161_bf[,c(2:1)],df20161_bf[,c(3:23)],df20161_bf[,c(27:32)],df20161_bf[,c(36:38)])
names(df20161_bf1) <- INTG_names
df20161_bf2 <- merge(x = df20161_bf1, y = ep2016, by = "CCN", all.x = TRUE)
year20161 <- rep(2016,nrow(df20161))
season20161 <- rep(1,nrow(df20161))
timeindex20161 <- rep(25,nrow(df20161))
df20161_bf2$year <- year20161
df20161_bf2$season <- season20161
df20161_bf2$timeindex <- timeindex20161
data20161 <- df20161_bf2



df20162 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20162.csv",sep=',',colClasses=mytypes66_2,check.names = F,na.strings = "NotAvailable")
names(df20162) <- names66_2
setdiff(INTG_names,names66_2)
df20162_bf <- data.frame(df20162[,-c(seq(17,by=2,len=25),66)])
df20162_bf1 <- data.frame(df20162_bf[,c(2:1)],df20162_bf[,c(3:23)],df20162_bf[,c(27:32)],df20162_bf[,c(36:38)])
names(df20162_bf1) <- INTG_names
df20162_bf2 <- merge(x = df20162_bf1, y = ep2016, by = "CCN", all.x = TRUE)
year20162 <- rep(2016,nrow(df20162))
season20162 <- rep(2,nrow(df20162))
timeindex20162 <- rep(26,nrow(df20162))
df20162_bf2$year <- year20162
df20162_bf2$season <- season20162
df20162_bf2$timeindex <- timeindex20162
data20162 <- df20162_bf2



df20163 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20163.csv",sep=',',colClasses=mytypes66_2,check.names = F,na.strings = "NotAvailable")
names(df20163) <- names66_2
setdiff(INTG_names,names66_2)
df20163_bf <- data.frame(df20163[,-c(seq(17,by=2,len=25),66)])
df20163_bf1 <- data.frame(df20163_bf[,c(2:1)],df20163_bf[,c(3:23)],df20163_bf[,c(27:32)],df20163_bf[,c(36:38)])
names(df20163_bf1) <- INTG_names
df20163_bf2 <- merge(x = df20163_bf1, y = ep2016, by = "CCN", all.x = TRUE)
year20163 <- rep(2016,nrow(df20163))
season20163 <- rep(3,nrow(df20163))
timeindex20163 <- rep(27,nrow(df20163))
df20163_bf2$year <- year20163
df20163_bf2$season <- season20163
df20163_bf2$timeindex <- timeindex20163
data20163 <- df20163_bf2



df20164 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20164.csv",sep=',',colClasses=mytypes66_2,check.names = F,na.strings = "NotAvailable")
names(df20164) <- names66_2
setdiff(INTG_names,names66_2)
df20164_bf <- data.frame(df20164[,-c(seq(17,by=2,len=25),66)])
df20164_bf1 <- data.frame(df20164_bf[,c(2:1)],df20164_bf[,c(3:23)],df20164_bf[,c(27:32)],df20164_bf[,c(36:38)])
names(df20164_bf1) <- INTG_names
df20164_bf2 <- merge(x = df20164_bf1, y = ep2016, by = "CCN", all.x = TRUE)
year20164 <- rep(2016,nrow(df20164))
season20164 <- rep(4,nrow(df20164))
timeindex20164 <- rep(28,nrow(df20164))
df20164_bf2$year <- year20164
df20164_bf2$season <- season20164
df20164_bf2$timeindex <- timeindex20164
data20164 <- df20164_bf2



df20171 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20171.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20171) <- names54
setdiff(INTG_names,names54)
df20171_bf <- data.frame(df20171[,-c(seq(17,by=2,len=19),54)])
df20171_bf1 <- data.frame(df20171_bf[,c(2:1)],df20171_bf[,c(3:32)])
names(df20171_bf1) <- INTG_names
df20171_bf2 <- merge(x = df20171_bf1, y = ep2017, by = "CCN", all.x = TRUE)
year20171 <- rep(2017,nrow(df20171))
season20171 <- rep(1,nrow(df20171))
timeindex20171 <- rep(29,nrow(df20171))
df20171_bf2$year <- year20171
df20171_bf2$season <- season20171
df20171_bf2$timeindex <- timeindex20171
data20171 <- df20171_bf2



df20172 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20172.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20172) <- names54
setdiff(INTG_names,names54)
df20172_bf <- data.frame(df20172[,-c(seq(17,by=2,len=19),54)])
df20172_bf1 <- data.frame(df20172_bf[,c(2:1)],df20172_bf[,c(3:32)])
names(df20172_bf1) <- INTG_names
df20172_bf2 <- merge(x = df20172_bf1, y = ep2017, by = "CCN", all.x = TRUE)
year20172 <- rep(2017,nrow(df20172))
season20172 <- rep(2,nrow(df20172))
timeindex20172 <- rep(30,nrow(df20172))
df20172_bf2$year <- year20172
df20172_bf2$season <- season20172
df20172_bf2$timeindex <- timeindex20172
data20172 <- df20172_bf2



df20173 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20173.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20173) <- names54
setdiff(INTG_names,names54)
df20173_bf <- data.frame(df20173[,-c(seq(17,by=2,len=19),54)])
df20173_bf1 <- data.frame(df20173_bf[,c(2:1)],df20173_bf[,c(3:32)])
names(df20173_bf1) <- INTG_names
df20173_bf2 <- merge(x = df20173_bf1, y = ep2017, by = "CCN", all.x = TRUE)
year20173 <- rep(2017,nrow(df20173))
season20173 <- rep(3,nrow(df20173))
timeindex20173 <- rep(31,nrow(df20173))
df20173_bf2$year <- year20173
df20173_bf2$season <- season20173
df20173_bf2$timeindex <- timeindex20173
data20173 <- df20173_bf2



df20174 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20174.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20174) <- names54
setdiff(INTG_names,names54)
df20174_bf <- data.frame(df20174[,-c(seq(17,by=2,len=19),54)])
df20174_bf1 <- data.frame(df20174_bf[,c(2:1)],df20174_bf[,c(3:32)])
names(df20174_bf1) <- INTG_names
df20174_bf2 <- merge(x = df20174_bf1, y = ep2017, by = "CCN", all.x = TRUE)
year20174 <- rep(2017,nrow(df20174))
season20174 <- rep(4,nrow(df20174))
timeindex20174 <- rep(32,nrow(df20174))
df20174_bf2$year <- year20174
df20174_bf2$season <- season20174
df20174_bf2$timeindex <- timeindex20174
data20174 <- df20174_bf2



df20181 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20181.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20181) <- names54
setdiff(INTG_names,names54)
df20181_bf <- data.frame(df20181[,-c(seq(17,by=2,len=19),54)])
df20181_bf1 <- data.frame(df20181_bf[,c(2:1)],df20181_bf[,c(3:32)])
names(df20181_bf1) <- INTG_names
df20181_bf2 <- merge(x = df20181_bf1, y = ep2018, by = "CCN", all.x = TRUE)
year20181 <- rep(2018,nrow(df20181))
season20181 <- rep(1,nrow(df20181))
timeindex20181 <- rep(33,nrow(df20181))
df20181_bf2$year <- year20181
df20181_bf2$season <- season20181
df20181_bf2$timeindex <- timeindex20181
data20181 <- df20181_bf2


df20182 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20182.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20182) <- names54
setdiff(INTG_names,names54)
df20182_bf <- data.frame(df20182[,-c(seq(17,by=2,len=19),54)])
df20182_bf1 <- data.frame(df20182_bf[,c(2:1)],df20182_bf[,c(3:32)])
names(df20182_bf1) <- INTG_names
df20182_bf2 <- merge(x = df20182_bf1, y = ep2018, by = "CCN", all.x = TRUE)
year20182 <- rep(2018,nrow(df20182))
season20182 <- rep(2,nrow(df20182))
timeindex20182 <- rep(34,nrow(df20182))
df20182_bf2$year <- year20182
df20182_bf2$season <- season20182
df20182_bf2$timeindex <- timeindex20182
data20182 <- df20182_bf2

test.df <- rbind(data20101,data20102,data20104,
                 data20111,data20112,data20113,data20114,
                 data20121,data20122,data20123,data20124,
                 data20131,data20132,data20133,data20134,
                 data20141,data20142,data20143,data20144,
                 data20151,data20152,data20153,data20154,
                 data20161,data20162,data20163,data20164,
                 data20171,data20172,data20173,data20174,
                 data20181,data20182)


df20183 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20183.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20183) <- names54
setdiff(INTG_names,names54)
df20183_bf <- data.frame(df20183[,-c(seq(17,by=2,len=19),54)])
df20183_bf1 <- data.frame(df20183_bf[,c(2:1)],df20183_bf[,c(3:32)])
names(df20183_bf1) <- INTG_names
df20183_bf2 <- merge(x = df20183_bf1, y = ep2018, by = "CCN", all.x = TRUE)
year20183 <- rep(2018,nrow(df20183))
season20183 <- rep(3,nrow(df20183))
timeindex20183 <- rep(35,nrow(df20183))
df20183_bf2$year <- year20183
df20183_bf2$season <- season20183
df20183_bf2$timeindex <- timeindex20183
data20183 <- df20183_bf2



df20184 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20184.csv",sep=',',colClasses=mytypes54,check.names = F)
names(df20184) <- names54
setdiff(INTG_names,names54)
df20184_bf <- data.frame(df20184[,-c(seq(17,by=2,len=19),54)])
df20184_bf1 <- data.frame(df20184_bf[,c(2:1)],df20184_bf[,c(3:32)])
names(df20184_bf1) <- INTG_names
df20184_bf2 <- merge(x = df20184_bf1, y = ep2018, by = "CCN", all.x = TRUE)
year20184 <- rep(2018,nrow(df20184))
season20184 <- rep(4,nrow(df20184))
timeindex20184 <- rep(36,nrow(df20184))
df20184_bf2$year <- year20184
df20184_bf2$season <- season20184
df20184_bf2$timeindex <- timeindex20184
data20184 <- df20184_bf2


df20191 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20191.csv",sep=',',colClasses=mytypes63,check.names = F)
names(df20191) <- names63
setdiff(INTG_names,names63)
df20191_bf <- data.frame(df20191[,-c(seq(17,by=2,len=19),54,seq(56,by=2,len=4))])
df20191_bf1 <- data.frame(df20191_bf[,c(2:1)],df20191_bf[,c(3:32)])
names(df20191_bf1) <- INTG_names
df20191_bf2 <- merge(x = df20191_bf1, y = ep2019, by = "CCN", all.x = TRUE)
year20191 <- rep(2019,nrow(df20191))
season20191 <- rep(1,nrow(df20191))
timeindex20191 <- rep(37,nrow(df20191))
df20191_bf2$year <- year20191
df20191_bf2$season <- season20191
df20191_bf2$timeindex <- timeindex20191
data20191 <- df20191_bf2


df20192 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20192.csv",sep=',',colClasses=mytypes63,check.names = F)
names(df20192) <- names63
setdiff(INTG_names,names63)
df20192_bf <- data.frame(df20192[,-c(seq(17,by=2,len=19),54,seq(56,by=2,len=4))])
df20192_bf1 <- data.frame(df20192_bf[,c(2:1)],df20192_bf[,c(3:32)])
names(df20192_bf1) <- INTG_names
df20192_bf2 <- merge(x = df20192_bf1, y = ep2019, by = "CCN", all.x = TRUE)
year20192 <- rep(2019,nrow(df20192))
season20192 <- rep(2,nrow(df20192))
timeindex20192 <- rep(38,nrow(df20192))
df20192_bf2$year <- year20192
df20192_bf2$season <- season20192
df20192_bf2$timeindex <- timeindex20192
data20192 <- df20192_bf2



df20193 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20193.csv",sep=',',colClasses=mytypes63,check.names = F)
names(df20193) <- names63
setdiff(INTG_names,names63)
df20193_bf <- data.frame(df20193[,-c(seq(17,by=2,len=19),54,seq(56,by=2,len=4))])
df20193_bf1 <- data.frame(df20193_bf[,c(2:1)],df20193_bf[,c(3:32)])
names(df20193_bf1) <- INTG_names
df20193_bf2 <- merge(x = df20193_bf1, y = ep2019, by = "CCN", all.x = TRUE)
year20193 <- rep(2019,nrow(df20193))
season20193 <- rep(3,nrow(df20193))
timeindex20193 <- rep(39,nrow(df20193))
df20193_bf2$year <- year20193
df20193_bf2$season <- season20193
df20193_bf2$timeindex <- timeindex20193
data20193 <- df20193_bf2


df20194 <- read.csv("input/data/HHAALL/ProviderData/HHC_SOCRATA_PRVDR20194.csv",sep=',',colClasses=mytypes79,check.names = F,na.strings = "NotAvailable")
names(df20194) <- names79
setdiff(INTG_names,names79)
df20194_bf <- data.frame(df20194[,-c(seq(17,by=2,len=19),54,seq(56,by=2,len=3))])
df20194_bf1 <- data.frame(df20194_bf[,c(2:1)],df20194_bf[,c(3:32)])
names(df20194_bf1) <- INTG_names
df20194_bf2 <- merge(x = df20194_bf1, y = ep2019, by = "CCN", all.x = TRUE)
year20194 <- rep(2019,nrow(df20194))
season20194 <- rep(4,nrow(df20194))
timeindex20194 <- rep(40,nrow(df20194))
df20194_bf2$year <- year20194
df20194_bf2$season <- season20194
df20194_bf2$timeindex <- timeindex20194
data20194 <- df20194_bf2

alldata <- rbind(data20101,data20102,data20104,
                 data20111,data20112,data20113,data20114,
                 data20121,data20122,data20123,data20124,
                 data20131,data20132,data20133,data20134,
                 data20141,data20142,data20143,data20144,
                 data20151,data20152,data20153,data20154,
                 data20161,data20162,data20163,data20164,
                 data20171,data20172,data20173,data20174,
                 data20181,data20182,data20183,data20184,
                 data20191,data20192,data20193,data20194)



income <- read.csv("input/data/MedianZIP-3.csv",sep=',',colClasses=c('character','numeric','numeric','numeric'),check.names = F)
names(income) <- c('Zip','median','mean','pop')
ruca <- read.csv("input/data/RUCA2006.csv",head=TRUE,sep=",",colClasses=c('factor','factor','double','double','factor'))[,c(1,3)]
names(ruca) <- c('Zip','ruca')

dim(income)
length(unique(income$Zip))
dim(ruca)
length(unique(ruca$Zip))

alldata_bf <- merge(x = alldata, y = income, by = "Zip", all.x = TRUE)
alldata_bf1 <- merge(x = alldata_bf, y = ruca, by = "Zip", all.x = TRUE)
names(alldata_bf1)

finaldata <- alldata_bf1

write.csv(finaldata, file = "input/HHA2010-2019.csv",row.names=FALSE, na="")






