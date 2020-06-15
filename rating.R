library(rpart)
library(rpart.plot)
library('scales')
library(tree)


mytypes <- c('character','factor',rep('character',2),'factor',rep('character',2),rep('factor',7),'character',rep('numeric',17))
mynames <- c('CCN','state','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','timely','taughtdrugs','checkfall','checkdepression','flushot','pnumococcal','taughtfootcare','betterwalking','betterbed','betterbathing','lesspain','betterbreathing','betterheal','betterdrug','admitted','ER')



mytypes <- c('factor',rep('character',3),'factor',rep('character',2),rep('factor',7),'character',rep(c('numeric','character'),17),rep(c('factor','character'),2),'character')
df <- read.csv("input/HHA2016-2019.csv",sep=',',colClasses=mytypes)
names(df) <- c('state','CCN','name','address','city','Zip','phone','type','off.nursing','off.physical','off.occupational','off.speech','off.medical','off.hha','date','rating','note-rating','timely','note-timely','taughtdrugs','note-taughtdrugs','checkfall','note-checkfall','checkdepression','note-checkdepression','flushot','note-flushot','pnumococcal','note-pnumococcal','taughtfootcare','note-tautfootcare','betterwalking','note-betterwalking','betterbed','note-betterbed','betterbathing','note-betterbathing','lesspain','note-lesspain','betterbreathing','note-betterbreathing','betterheal','note-betterheal','betterdrug','note-betterdrug','admitted','note-admitted','ER','note-ER','readmit','note-readmit','emergency','note-emergency','note')

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

data <- merg[,c(-7:-4,-2,-1,-15,-17,-19,-21,-23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-49,-51,-53,-54)]

fulldata <- na.omit(data)
fulldata <- data
dim(fulldata)


tree.model <- rpart(formula= rating ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
                + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                + admitted + ER 
                + readmit + emergency +RUCA
                + flushot + pnumococcal
                ,
                data =fulldata,
                cp=0.01)

summary(tree.model)
rpart.plot(tree.model,digits=4,fallen.leaves=TRUE,type=4,extra=1)



lm.model <- lm(rating ~ type + off.physical + off.occupational + off.speech + off.medical + off.hha 
                    + timely + taughtdrugs + checkfall + checkdepression + taughtfootcare 
                    + betterwalking + betterbed + betterbathing + lesspain + betterbreathing + betterheal + betterdrug 
                    + admitted + ER 
                    #+ readmit + emergency +RUCA
                    #+ flushot + pnumococcal
                    ,
                    data =fulldata)
summary(lm.model)
