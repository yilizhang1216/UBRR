library(broman)

plot_crayons()

col1 <- brocolors("crayons")["Royal Purple"]
col2 <- brocolors("crayons")["Violet Blue"]


par(mfrow=c(2,4))

MR1 <- c(43,43)
DR1 <- c(2,3)
dat1 <- as.data.frame(rbind(MR1,DR1))
names(dat1) <- c('OncoSET','AoU')
barplot(as.matrix(dat1),main="person",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar1, MR1-5, MR1,cex=1) 
text(bar1, MR1+DR1+5, DR1,cex=1)


MR2 <- c(0,0)
DR2 <- c(0,0)
dat2 <- as.data.frame(rbind(MR2,DR2))
names(dat2) <- c('OncoSET','AoU')
barplot(as.matrix(dat2),main="observation period",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar2, MR2-5, MR2,cex=1) 
text(bar2, MR2+DR2+5, DR2,cex=1)

MR3 <-c(25,37)
DR3 <- c(3,5)
dat3 <- as.data.frame(rbind(MR3,DR3))
names(dat3) <- c('OncoSET','AoU')
barplot(as.matrix(dat3),main="visit occurrence",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar3, MR3-5, MR3,cex=1) 
text(bar3, MR3+DR3+5, DR3,cex=1)


MR4 <- c(50,17)
DR4 <- c(13,12)
dat4 <- as.data.frame(rbind(MR4,DR4))
names(dat4) <- c('OncoSET','AoU')
barplot(as.matrix(dat4),main="condition occurrence",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar4, MR4-5, MR4,cex=1) 
text(bar4, MR4+DR4+5, DR4,cex=1)


MR5 <- c(6,12)
DR5 <- c(9,10)
dat5 <- as.data.frame(rbind(MR5,DR5))
names(dat5) <- c('OncoSET','AoU')
barplot(as.matrix(dat5),main="drug exposure",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar5, MR5-2, MR5,cex=1) 
text(bar5, MR5+DR5+5, DR5,cex=1)

MR6 <- c(16,16)
DR6 <- c(33,33)
dat6 <- as.data.frame(rbind(MR6,DR6))
names(dat6) <- c('OncoSET','AoU')
barplot(as.matrix(dat6),main="procedure occurrence",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar6, MR6-5, MR6,cex=1) 
text(bar6, MR6+DR6+5, DR6,cex=1)

MR7 <- c(0,0)
DR7 <- c(0,0)
dat7 <- as.data.frame(rbind(MR7,DR7))
names(dat7) <- c('OncoSET','AoU')
barplot(as.matrix(dat7),main="measurement",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar7, MR7-5, MR7,cex=1) 
text(bar7, MR7+DR7+5, DR7,cex=1)

MR8 <- c(25,25)
DR8 <- c(0,0)
dat8 <- as.data.frame(rbind(MR8,DR8))
names(dat8) <- c('OncoSET','AoU')
barplot(as.matrix(dat8),main="observation",
        col=c(col1,col2),
        ylim=c(0,100)
)

text(bar8, MR8-5, MR8,cex=1) 
text(bar8, MR8+DR8+5, DR8,cex=1)







