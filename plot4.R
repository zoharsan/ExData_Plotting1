#Reading Data
 setwd('D:/Rwd')
 pcdf<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')
 
 #Data Preparation
 pcdf$DateTime<-paste(pcdf$Date,pcdf$Time)
 pcdf$DateTime<-strptime(pcdf$DateTime,"%d/%m/%Y %H:%M:%S")
 pcdf_ss<-pcdf[ which (pcdf$DateTime >= '2007-02-01' & pcdf$DateTime < '2007-02-03'),c(3:10)]
 
 #Plot 4
 par(mfrow=c(2,2))
 plot(pcdf_ss$DateTime,pcdf_ss$Global_active_power,type="l",ylab="Global Active Power",xlab="")
 plot(pcdf_ss$DateTime,pcdf_ss$Voltage,type="l",ylab="Voltage",xlab="datetime")
 plot(pcdf_ss$DateTime,pcdf_ss$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
 lines(pcdf_ss$DateTime,pcdf_ss$Sub_metering_2,col="red")
 lines(pcdf_ss$DateTime,pcdf_ss$Sub_metering_3,col="blue")
 legend("topright",lty=1,lwd=1, bty="n",col = c("black","red","blue"),legend = c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "))
 plot(pcdf_ss$DateTime,pcdf_ss$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
 
 dev.copy(png,"plot4.png",width=480,height=480)
 dev.off()
