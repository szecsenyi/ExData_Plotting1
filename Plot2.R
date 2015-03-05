## load and subset data
x<-read.table("household_power_consumption.txt", 
              dec=".", sep=";", header=TRUE, na.strings="?", 
              stringsAsFactors=FALSE, nrows=69516)
x<-x[66637:69516,]
x$Date2<-as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
x$Global_active_power<-as.numeric(x$Global_active_power)
x$Global_reactive_power<-as.numeric(x$Global_reactive_power)
x$Voltage<-as.numeric(x$Voltage)
x$Global_intensity<-as.numeric(x$Global_intensity)
x$Sub_metering_1<-as.numeric(x$Sub_metering_1)
x$Sub_metering_2<-as.numeric(x$Sub_metering_2)
x$Sub_metering_3<-as.numeric(x$Sub_metering_3)

## make plot
png("plot2.png")
plot(x$Date2, x$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()