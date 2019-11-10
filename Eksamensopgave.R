kbhbefolkning <- read.csv("befkbhalderstatkode.csv")

# fjern observationer med manglende værdier
# Data uden etniske danskere
kbhIkkeDansk <-subset(kbhbefolkning,(STATKODE !=0) & (STATKODE !=5001) & (STATKODE !=5100) & (STATKODE !=5199) & (STATKODE !=5471) & (STATKODE != 5499) & (STATKODE !=5800) & (STATKODE !=5901) & (STATKODE !=5999))

#Data med hele befolkningen i kbh
kbhUStatsløse <- subset(kbhbefolkning,(STATKODE !=0) & (STATKODE !=5001) & (STATKODE !=5199) & (STATKODE !=5471) & (STATKODE != 5499) & (STATKODE !=5800) & (STATKODE !=5901) & (STATKODE !=5999))

#kun etniske danskkbh
kbhDanskere <- subset(kbhbefolkning,(STATKODE == 5100))

kbh2012 <- subset(kbhbefolkning,(AAR == 2012))

#graf for 2012 lagt sammen i alder

df2012 = data.frame(kbh2012$BYDEL, kbh2012$ALDER, kbh2012$PERSONER)
names(df2012) <-  c('BYDEL','ALDER','PERSONER')

df2012v1 = subset(df2012,(BYDEL !=99))

names(df2012v1) <-  c('BYDEL','ALDER','PERSONER')

ss2012 <- ddply(df2012v1,.(ALDER, BYDEL),summarize,sum=sum(PERSONER),number=length(ALDER))

attach(ss2012)

plot3d(ss2012$ALDER, ss2012$BYDEL, ss2012$sum)
