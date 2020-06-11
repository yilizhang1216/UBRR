type_RPT <- c(rep('character',3),'numeric',rep('character',14))
name_RPT <- c('RPT_REC_NUM','PRVDR_CTRL_TYPE_CD','PRVDR_NUM','NPI','RPT_STUS_CD','FY_BGN_DT','FY_END_DT','PROC_DT','INITL_RPT_SW','LAST_RPT_SW','TRNSMTL_NUM','FI_NUM','ADR_VNDR_CD','FI_CREAT_DT','UTIL_CD','NPR_DT','SPEC_IND','FI_RCPT_DT')
type_NMRC <- c(rep('character',4),'numeric')
name_NMRC <- c('RPT_REC_NUM','WKSHT_CD','LINE_NUM','CLMN_NUM','ITM_VAL_NUM')

rpt2010 <- read.csv("input/data/HHAALL/EpisodeData/hha_2010_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2010) <- name_RPT
dim(rpt2010)
nmrc2010 <- read.csv("input/data/HHAALL/EpisodeData/hha_2010_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2010) <- name_NMRC
dim(nmrc2010)
nmrc2010_ext <- nmrc2010[which( nmrc2010$WKSHT_CD=='S300000' 
                                & nmrc2010$LINE_NUM=='04500'
                                & (nmrc2010$CLMN_NUM == '0100' | nmrc2010$CLMN_NUM == '0200' | nmrc2010$CLMN_NUM == '0300' | nmrc2010$CLMN_NUM == '0400' | nmrc2010$CLMN_NUM == '0500' | nmrc2010$CLMN_NUM == '0600')
                         ),]
dim(nmrc2010_ext)
table(nmrc2010_ext$WKSHT_CD)
table(nmrc2010_ext$LINE_NUM)
table(nmrc2010_ext$CLMN_NUM)
episode2010_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2010_ext, sum)
dim(episode2010_ext)
episode2010 <- merge(rpt2010,episode2010_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2010) <- c('CCN','episode')
dim(episode2010)
write.csv(episode2010, file = "input/data/HHAALL/EpisodeData/Episode2010.csv",row.names=FALSE, na="")


rpt2011 <- read.csv("input/data/HHAALL/EpisodeData/hha_2011_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2011) <- name_RPT
dim(rpt2011)
nmrc2011 <- read.csv("input/data/HHAALL/EpisodeData/hha_2011_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2011) <- name_NMRC
dim(nmrc2011)
nmrc2011_ext <- nmrc2011[which( nmrc2011$WKSHT_CD=='S300000' 
                                & nmrc2011$LINE_NUM=='04500'
                                & (nmrc2011$CLMN_NUM == '0100' | nmrc2011$CLMN_NUM == '0200' | nmrc2011$CLMN_NUM == '0300' | nmrc2011$CLMN_NUM == '0400' | nmrc2011$CLMN_NUM == '0500' | nmrc2011$CLMN_NUM == '0600')
),]
dim(nmrc2011_ext)
table(nmrc2011_ext$WKSHT_CD)
table(nmrc2011_ext$LINE_NUM)
table(nmrc2011_ext$CLMN_NUM)
episode2011_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2011_ext, sum)
dim(episode2011_ext)
episode2011 <- merge(rpt2011,episode2011_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2011) <- c('CCN','episode')
dim(episode2011)
write.csv(episode2011, file = "input/data/HHAALL/EpisodeData/Episode2011.csv",row.names=FALSE, na="")


rpt2012 <- read.csv("input/data/HHAALL/EpisodeData/hha_2012_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2012) <- name_RPT
dim(rpt2012)
nmrc2012 <- read.csv("input/data/HHAALL/EpisodeData/hha_2012_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2012) <- name_NMRC
dim(nmrc2012)
nmrc2012_ext <- nmrc2012[which( nmrc2012$WKSHT_CD=='S300000' 
                                & nmrc2012$LINE_NUM=='04500'
                                & (nmrc2012$CLMN_NUM == '0100' | nmrc2012$CLMN_NUM == '0200' | nmrc2012$CLMN_NUM == '0300' | nmrc2012$CLMN_NUM == '0400' | nmrc2012$CLMN_NUM == '0500' | nmrc2012$CLMN_NUM == '0600')
),]
dim(nmrc2012_ext)
table(nmrc2012_ext$WKSHT_CD)
table(nmrc2012_ext$LINE_NUM)
table(nmrc2012_ext$CLMN_NUM)
episode2012_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2012_ext, sum)
dim(episode2012_ext)
episode2012 <- merge(rpt2012,episode2012_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2012) <- c('CCN','episode')
dim(episode2012)
write.csv(episode2012, file = "input/data/HHAALL/EpisodeData/Episode2012.csv",row.names=FALSE, na="")



rpt2013 <- read.csv("input/data/HHAALL/EpisodeData/hha_2013_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2013) <- name_RPT
dim(rpt2013)
nmrc2013 <- read.csv("input/data/HHAALL/EpisodeData/hha_2013_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2013) <- name_NMRC
dim(nmrc2013)
nmrc2013_ext <- nmrc2013[which( nmrc2013$WKSHT_CD=='S300000' 
                                & nmrc2013$LINE_NUM=='04500'
                                & (nmrc2013$CLMN_NUM == '0100' | nmrc2013$CLMN_NUM == '0200' | nmrc2013$CLMN_NUM == '0300' | nmrc2013$CLMN_NUM == '0400' | nmrc2013$CLMN_NUM == '0500' | nmrc2013$CLMN_NUM == '0600')
),]
dim(nmrc2013_ext)
table(nmrc2013_ext$WKSHT_CD)
table(nmrc2013_ext$LINE_NUM)
table(nmrc2013_ext$CLMN_NUM)
episode2013_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2013_ext, sum)
dim(episode2013_ext)
episode2013 <- merge(rpt2013,episode2013_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2013) <- c('CCN','episode')
dim(episode2013)
write.csv(episode2013, file = "input/data/HHAALL/EpisodeData/Episode2013.csv",row.names=FALSE, na="")



rpt2014 <- read.csv("input/data/HHAALL/EpisodeData/hha_2014_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2014) <- name_RPT
dim(rpt2014)
nmrc2014 <- read.csv("input/data/HHAALL/EpisodeData/hha_2014_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2014) <- name_NMRC
dim(nmrc2014)
nmrc2014_ext <- nmrc2014[which( nmrc2014$WKSHT_CD=='S300000' 
                                & nmrc2014$LINE_NUM=='04500'
                                & (nmrc2014$CLMN_NUM == '0100' | nmrc2014$CLMN_NUM == '0200' | nmrc2014$CLMN_NUM == '0300' | nmrc2014$CLMN_NUM == '0400' | nmrc2014$CLMN_NUM == '0500' | nmrc2014$CLMN_NUM == '0600')
),]
dim(nmrc2014_ext)
table(nmrc2014_ext$WKSHT_CD)
table(nmrc2014_ext$LINE_NUM)
table(nmrc2014_ext$CLMN_NUM)
episode2014_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2014_ext, sum)
dim(episode2014_ext)
episode2014 <- merge(rpt2014,episode2014_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2014) <- c('CCN','episode')
dim(episode2014)
write.csv(episode2014, file = "input/data/HHAALL/EpisodeData/Episode2014.csv",row.names=FALSE, na="")


rpt2015 <- read.csv("input/data/HHAALL/EpisodeData/hha_2015_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2015) <- name_RPT
dim(rpt2015)
nmrc2015 <- read.csv("input/data/HHAALL/EpisodeData/hha_2015_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2015) <- name_NMRC
dim(nmrc2015)
nmrc2015_ext <- nmrc2015[which( nmrc2015$WKSHT_CD=='S300000' 
                                & nmrc2015$LINE_NUM=='04500'
                                & (nmrc2015$CLMN_NUM == '0100' | nmrc2015$CLMN_NUM == '0200' | nmrc2015$CLMN_NUM == '0300' | nmrc2015$CLMN_NUM == '0400' | nmrc2015$CLMN_NUM == '0500' | nmrc2015$CLMN_NUM == '0600')
),]
dim(nmrc2015_ext)
table(nmrc2015_ext$WKSHT_CD)
table(nmrc2015_ext$LINE_NUM)
table(nmrc2015_ext$CLMN_NUM)
episode2015_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2015_ext, sum)
dim(episode2015_ext)
episode2015 <- merge(rpt2015,episode2015_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2015) <- c('CCN','episode')
dim(episode2015)
write.csv(episode2015, file = "input/data/HHAALL/EpisodeData/Episode2015.csv",row.names=FALSE, na="")



rpt2016 <- read.csv("input/data/HHAALL/EpisodeData/hha_2016_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2016) <- name_RPT
dim(rpt2016)
nmrc2016 <- read.csv("input/data/HHAALL/EpisodeData/hha_2016_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2016) <- name_NMRC
dim(nmrc2016)
nmrc2016_ext <- nmrc2016[which( nmrc2016$WKSHT_CD=='S300000' 
                                & nmrc2016$LINE_NUM=='04500'
                                & (nmrc2016$CLMN_NUM == '0100' | nmrc2016$CLMN_NUM == '0200' | nmrc2016$CLMN_NUM == '0300' | nmrc2016$CLMN_NUM == '0400' | nmrc2016$CLMN_NUM == '0500' | nmrc2016$CLMN_NUM == '0600')
),]
dim(nmrc2016_ext)
table(nmrc2016_ext$WKSHT_CD)
table(nmrc2016_ext$LINE_NUM)
table(nmrc2016_ext$CLMN_NUM)
episode2016_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2016_ext, sum)
dim(episode2016_ext)
episode2016 <- merge(rpt2016,episode2016_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2016) <- c('CCN','episode')
dim(episode2016)
write.csv(episode2016, file = "input/data/HHAALL/EpisodeData/Episode2016.csv",row.names=FALSE, na="")


rpt2016 <- read.csv("input/data/HHAALL/EpisodeData/hha_2016_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2016) <- name_RPT
dim(rpt2016)
nmrc2016 <- read.csv("input/data/HHAALL/EpisodeData/hha_2016_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2016) <- name_NMRC
dim(nmrc2016)
nmrc2016_ext <- nmrc2016[which( nmrc2016$WKSHT_CD=='S300000' 
                                & nmrc2016$LINE_NUM=='04500'
                                & (nmrc2016$CLMN_NUM == '0100' | nmrc2016$CLMN_NUM == '0200' | nmrc2016$CLMN_NUM == '0300' | nmrc2016$CLMN_NUM == '0400' | nmrc2016$CLMN_NUM == '0500' | nmrc2016$CLMN_NUM == '0600')
),]
dim(nmrc2016_ext)
table(nmrc2016_ext$WKSHT_CD)
table(nmrc2016_ext$LINE_NUM)
table(nmrc2016_ext$CLMN_NUM)
episode2016_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2016_ext, sum)
dim(episode2016_ext)
episode2016 <- merge(rpt2016,episode2016_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2016) <- c('CCN','episode')
dim(episode2016)
write.csv(episode2016, file = "input/data/HHAALL/EpisodeData/Episode2016.csv",row.names=FALSE, na="")


rpt2017 <- read.csv("input/data/HHAALL/EpisodeData/hha_2017_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2017) <- name_RPT
dim(rpt2017)
nmrc2017 <- read.csv("input/data/HHAALL/EpisodeData/hha_2017_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2017) <- name_NMRC
dim(nmrc2017)
nmrc2017_ext <- nmrc2017[which( nmrc2017$WKSHT_CD=='S300000' 
                                & nmrc2017$LINE_NUM=='04500'
                                & (nmrc2017$CLMN_NUM == '0100' | nmrc2017$CLMN_NUM == '0200' | nmrc2017$CLMN_NUM == '0300' | nmrc2017$CLMN_NUM == '0400' | nmrc2017$CLMN_NUM == '0500' | nmrc2017$CLMN_NUM == '0600')
),]
dim(nmrc2017_ext)
table(nmrc2017_ext$WKSHT_CD)
table(nmrc2017_ext$LINE_NUM)
table(nmrc2017_ext$CLMN_NUM)
episode2017_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2017_ext, sum)
dim(episode2017_ext)
episode2017 <- merge(rpt2017,episode2017_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2017) <- c('CCN','episode')
dim(episode2017)
write.csv(episode2017, file = "input/data/HHAALL/EpisodeData/Episode2017.csv",row.names=FALSE, na="")


rpt2018 <- read.csv("input/data/HHAALL/EpisodeData/hha_2018_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2018) <- name_RPT
dim(rpt2018)
nmrc2018 <- read.csv("input/data/HHAALL/EpisodeData/hha_2018_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2018) <- name_NMRC
dim(nmrc2018)
nmrc2018_ext <- nmrc2018[which( nmrc2018$WKSHT_CD=='S300000' 
                                & nmrc2018$LINE_NUM=='04500'
                                & (nmrc2018$CLMN_NUM == '0100' | nmrc2018$CLMN_NUM == '0200' | nmrc2018$CLMN_NUM == '0300' | nmrc2018$CLMN_NUM == '0400' | nmrc2018$CLMN_NUM == '0500' | nmrc2018$CLMN_NUM == '0600')
),]
dim(nmrc2018_ext)
table(nmrc2018_ext$WKSHT_CD)
table(nmrc2018_ext$LINE_NUM)
table(nmrc2018_ext$CLMN_NUM)
episode2018_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2018_ext, sum)
dim(episode2018_ext)
episode2018 <- merge(rpt2018,episode2018_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2018) <- c('CCN','episode')
dim(episode2018)
write.csv(episode2018, file = "input/data/HHAALL/EpisodeData/Episode2018.csv",row.names=FALSE, na="")


rpt2019 <- read.csv("input/data/HHAALL/EpisodeData/hha_2019_RPT.csv",sep=',',colClasses=type_RPT,check.names = F)
names(rpt2019) <- name_RPT
dim(rpt2019)
nmrc2019 <- read.csv("input/data/HHAALL/EpisodeData/hha_2019_NMRC.csv",sep=',',colClasses=type_NMRC,check.names = F)
names(nmrc2019) <- name_NMRC
dim(nmrc2019)
nmrc2019_ext <- nmrc2019[which( nmrc2019$WKSHT_CD=='S300000' 
                                & nmrc2019$LINE_NUM=='04500'
                                & (nmrc2019$CLMN_NUM == '0100' | nmrc2019$CLMN_NUM == '0200' | nmrc2019$CLMN_NUM == '0300' | nmrc2019$CLMN_NUM == '0400' | nmrc2019$CLMN_NUM == '0500' | nmrc2019$CLMN_NUM == '0600')
),]
dim(nmrc2019_ext)
table(nmrc2019_ext$WKSHT_CD)
table(nmrc2019_ext$LINE_NUM)
table(nmrc2019_ext$CLMN_NUM)
episode2019_ext <- aggregate( ITM_VAL_NUM ~ RPT_REC_NUM, nmrc2019_ext, sum)
dim(episode2019_ext)
episode2019 <- merge(rpt2019,episode2019_ext,by='RPT_REC_NUM')[,c(3,19)]
names(episode2019) <- c('CCN','episode')
dim(episode2019)
write.csv(episode2019, file = "input/data/HHAALL/EpisodeData/Episode2019.csv",row.names=FALSE, na="")





