 #Reading Data
 setwd('D:/Rwd')
 pcdf<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')
 
 #Data Preparation
 pcdf$DateTime<-paste(pcdf$Date,pcdf$Time)
 pcdf$DateTime<-strptime(pcdf$DateTime,"%d/%m/%Y %H:%M:%S")
 pcdf_ss<-pcdf[ which (pcdf$DateTime >= '2007-02-01' & pcdf$DateTime < '2007-02-03'),c(3:10)]
 
 #Histogram Plot1
  hist(pcdf_ss$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
  
 
 
 
 

