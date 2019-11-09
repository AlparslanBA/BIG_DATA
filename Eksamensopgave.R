kbh <- read.csv("befkbhalderstatkode.csv")

# fjern observationer med manglende værdier
# Data uden etniske danskere
ikkeDanskData <-subset(kbh,(STATKODE !=0) & (STATKODE !=5001) & (STATKODE !=5100) & (STATKODE !=5199) & (STATKODE !=5471) & (STATKODE != 5499) & (STATKODE !=5800) & (STATKODE !=5901) & (STATKODE !=5999))

#Data med hele befolkningen i kbh
kbhdata <- subset(kbh,(STATKODE !=0) & (STATKODE !=5001) & (STATKODE !=5199) & (STATKODE !=5471) & (STATKODE != 5499) & (STATKODE !=5800) & (STATKODE !=5901) & (STATKODE !=5999))

#kun etniske danskkbh
danskData <- subset(kbh,(STATKODE == 5100))

kbhdataSub <- subset(kbh,(AAR == 2012))

#graf for 2012 lagt sammen i alder
df2012 = data.frame( kbhdataSub$ALDER, kbhdataSub$PERSONER)

nigga <- ddply(df2012,.(kbhdataSub.ALDER),summarize,sum=sum(kbhdataSub.PERSONER),number=length(kbhdataSub.ALDER))

plot(nigga$kbhdataSub.ALDER,nigga$sum)



#plotter alderen over frekvensen
plot(slogSam$kbhdataSub.ALDER, slogSam$V1)

#ounter = subset(testdataframe,(ALDER == )) 

#plot(kbhdataSub$ALDER,kbhdataSub$PERSONER,type = "1",col="red")


#Gøre det her op til alderen 100 i 10 år per diagram
######################################################################################
#danskere mellem 0-30 alderen i 2012
kbh030 <- subset(kbhdataSub,(ALDER < 30))

kbh3060 <- subset(kbhdataSub, (ALDER > 29) & (ALDER < 60))
#ikke danskere mellem 0-10 i hele datasættets forløb

kbh60100 <- subset(kbhdataSub,(ALDER > 60) & (ALDER < 100))

######################################################################################
#ikke danskere mellem 10-19 alderen
ikkeDansk919 <- subset(ikkeDanskData,(ALDER > 9) & (ALDER < 20))

#ikke danskere mellem 0-10 i hele datasættets forløb
hist(ikkeDansk919$AAR, xlab = "Årgang", main = "Mennesker mellem alderen fra 0 - 10")
######################################################################################
hist(danskData$AAR)

hist(ikkeDanskData$ALDER)

hist(ikkeDanskData$PERSONER)

#plot3d(ikkeDanskData$STATKODE,ikkeDanskData$PERSONER,ikkeDanskData$ALDER, main="Basic 3D Scatter Plot")

hist(ikkeDanskData$ALDER, xlab = "Alder", main = "Histogram af ikke danskeres aldre")
