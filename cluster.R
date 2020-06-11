library("cluster")
library("factoextra")
library("magrittr")
library(fpc)
library(NbClust)

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

names(data)

fulldata <- na.omit(data)

df <- fulldata[,10:25]

###vector memory exhausted (limit reached?)
# # Elbow method
# fviz_nbclust(df, kmeans, method = "wss") +
#   geom_vline(xintercept = 4, linetype = 2)+
#   labs(subtitle = "Elbow method")
#
###long vectors (argument 1) are not supported in .C
# # Silhouette method
# fviz_nbclust(df, kmeans, method = "silhouette")+
#   labs(subtitle = "Silhouette method")

# Gap statistic
# nboot = 50 to keep the function speedy. 
# recommended value: nboot= 500 for your analysis.
# Use verbose = FALSE to hide computing progression.
set.seed(123)
fviz_nbclust(df, kmeans, nstart = 25,  method = "gap_stat", nboot = 50)+
  labs(subtitle = "Gap statistic method")



set.seed(1)
fit <- kmeans(fulldata[,10:25], 4, nstart = 25)
print(fit)

dd <- cbind(fulldata, cluster = fit$cluster)

# Centroid Plot against 1st 2 discriminant functions
plotcluster(fulldata[,10:25], fit$cluster)






