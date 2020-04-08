## Extract count of visits, count of patients, and designated urban-rural indicator
## For selection indexes, please refer to input/data/HHAALL/DOCUMENTATION/HCRIS/HHA_DataElements.pdf
## There are 9759 distinct HHAs in this data frame, which is smaller than HHAALL data frame
## So I did not include it at the end

library(dplyr)

numtype <-c('character','character','character','character','numeric')
names_num <- c('RPT_REC_NUM','WKSHT_CD','LINE_NUM','CLMN_NUM','size')
names_rpt <- c('RPT_REC_NUM','CCN')

num2014 <- read.csv("input/data/HHAALL/hha_2014_NMRC.CSV",sep=',',colClasses=numtype)
names(num2014) <- names_num
visit2014 <- num2014[num2014$WKSHT_CD=="S300000"&num2014$LINE_NUM=="00100"&num2014$CLMN_NUM=="0100",]
visit2014 <- visit2014[,c(-2,-3,-4)]
dim(visit2014)
patient2014 <- num2014[num2014$WKSHT_CD=="S300000"&num2014$LINE_NUM=="00100"&num2014$CLMN_NUM=="0200",]
patient2014 <- patient2014[,c(-2,-3,-4)]
dim(patient2014)
report2014 <- read.csv("input/data/HHAALL/hha_2014_RPT.CSV",sep=',')[,c(1,3)]
names(report2014) <- names_rpt
size2014 <- merge(visit2014,patient2014,by='RPT_REC_NUM')
size2014 <- merge(size2014,report2014,by='RPT_REC_NUM')
dim(size2014)
names(size2014) <- c('RPT_REC_NUM','visit','patient','CCN')
size2014 <- size2014[,c(-1)]
dim(size2014)
names(size2014)

num2015 <- read.csv("input/data/HHAALL/hha_2015_NMRC.CSV",sep=',',colClasses=numtype)
names(num2015) <- names_num
visit2015 <- num2015[num2015$WKSHT_CD=="S300000"&num2015$LINE_NUM=="00100"&num2015$CLMN_NUM=="0100",]
visit2015 <- visit2015[,c(-2,-3,-4)]
dim(visit2015)
patient2015 <- num2015[num2015$WKSHT_CD=="S300000"&num2015$LINE_NUM=="00100"&num2015$CLMN_NUM=="0200",]
patient2015 <- patient2015[,c(-2,-3,-4)]
dim(patient2015)
report2015 <- read.csv("input/data/HHAALL/hha_2015_RPT.CSV",sep=',')[,c(1,3)]
names(report2015) <- names_rpt
size2015 <- merge(visit2015,patient2015,by='RPT_REC_NUM')
size2015 <- merge(size2015,report2015,by='RPT_REC_NUM')
dim(size2015)
names(size2015) <- c('RPT_REC_NUM','visit','patient','CCN')
size2015 <- size2015[,c(-1)]
dim(size2015)
names(size2015)

num2016 <- read.csv("input/data/HHAALL/hha_2016_NMRC.CSV",sep=',',colClasses=numtype)
names(num2016) <- names_num
visit2016 <- num2016[num2016$WKSHT_CD=="S300000"&num2016$LINE_NUM=="00100"&num2016$CLMN_NUM=="0100",]
visit2016 <- visit2016[,c(-2,-3,-4)]
dim(visit2016)
patient2016 <- num2016[num2016$WKSHT_CD=="S300000"&num2016$LINE_NUM=="00100"&num2016$CLMN_NUM=="0200",]
patient2016 <- patient2016[,c(-2,-3,-4)]
dim(patient2016)
report2016 <- read.csv("input/data/HHAALL/hha_2016_RPT.CSV",sep=',')[,c(1,3)]
names(report2016) <- names_rpt
size2016 <- merge(visit2016,patient2016,by='RPT_REC_NUM')
size2016 <- merge(size2016,report2016,by='RPT_REC_NUM')
dim(size2016)
names(size2016) <- c('RPT_REC_NUM','visit','patient','CCN')
size2016 <- size2016[,c(-1)]
dim(size2016)
names(size2016)

num2017 <- read.csv("input/data/HHAALL/hha_2017_NMRC.CSV",sep=',',colClasses=numtype)
names(num2017) <- names_num
visit2017 <- num2017[num2017$WKSHT_CD=="S300000"&num2017$LINE_NUM=="00100"&num2017$CLMN_NUM=="0100",]
visit2017 <- visit2017[,c(-2,-3,-4)]
dim(visit2017)
patient2017 <- num2017[num2017$WKSHT_CD=="S300000"&num2017$LINE_NUM=="00100"&num2017$CLMN_NUM=="0200",]
patient2017 <- patient2017[,c(-2,-3,-4)]
dim(patient2017)
report2017 <- read.csv("input/data/HHAALL/hha_2017_RPT.CSV",sep=',')[,c(1,3)]
names(report2017) <- names_rpt
size2017 <- merge(visit2017,patient2017,by='RPT_REC_NUM')
size2017 <- merge(size2017,report2017,by='RPT_REC_NUM')
dim(size2017)
names(size2017) <- c('RPT_REC_NUM','visit','patient','CCN')
size2017 <- size2017[,c(-1)]
dim(size2017)
names(size2017)

num2018 <- read.csv("input/data/HHAALL/hha_2018_NMRC.CSV",sep=',',colClasses=numtype)
names(num2018) <- names_num
visit2018 <- num2018[num2018$WKSHT_CD=="S300000"&num2018$LINE_NUM=="00100"&num2018$CLMN_NUM=="0100",]
visit2018 <- visit2018[,c(-2,-3,-4)]
dim(visit2018)
patient2018 <- num2018[num2018$WKSHT_CD=="S300000"&num2018$LINE_NUM=="00100"&num2018$CLMN_NUM=="0200",]
patient2018 <- patient2018[,c(-2,-3,-4)]
dim(patient2018)
report2018 <- read.csv("input/data/HHAALL/hha_2018_RPT.CSV",sep=',')[,c(1,3)]
names(report2018) <- names_rpt
size2018 <- merge(visit2018,patient2018,by='RPT_REC_NUM')
size2018 <- merge(size2018,report2018,by='RPT_REC_NUM')
dim(size2018)
names(size2018) <- c('RPT_REC_NUM','visit','patient','CCN')
size2018 <- size2018[,c(-1)]
dim(size2018)
names(size2018)

num2019 <- read.csv("input/data/HHAALL/hha_2019_NMRC.CSV",sep=',',colClasses=numtype)
names(num2019) <- names_num
visit2019 <- num2019[num2019$WKSHT_CD=="S300000"&num2019$LINE_NUM=="00100"&num2019$CLMN_NUM=="0100",]
visit2019 <- visit2019[,c(-2,-3,-4)]
dim(visit2019)
patient2019 <- num2019[num2019$WKSHT_CD=="S300000"&num2019$LINE_NUM=="00100"&num2019$CLMN_NUM=="0200",]
patient2019 <- patient2019[,c(-2,-3,-4)]
dim(patient2019)
report2019 <- read.csv("input/data/HHAALL/hha_2019_RPT.CSV",sep=',')[,c(1,3)]
names(report2019) <- names_rpt
size2019 <- merge(visit2019,patient2019,by='RPT_REC_NUM')
size2019 <- merge(size2019,report2019,by='RPT_REC_NUM')
dim(size2019)
names(size2019) <- c('RPT_REC_NUM','visit','patient','CCN')
size2019 <- size2019[,c(-1)]
dim(size2019)
names(size2019)

size <- bind_rows(size2014,size2015,size2016,size2017,size2018,size2019)
dim(size)
length(unique(size$CCN))
dfall <- read.csv("input/HHA2014-2018(nosize).csv",sep=',')
names(dfall)
length(unique(dfall$CCN))


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