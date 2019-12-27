library("data.table")
setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")

#Load the data set
electricity <- read.csv("Data1.csv")

#Create Time Series field dateTime

electricity$dateTime = as.POSIXct(paste(Date, Time), format = "%d-%m-%Y %H:%M:%S")
attach(electricity)
#Give the name and dimensions to your plot
png("plot3.png", width=480, height=480)

#Plot the time series
par(mfrow=c(2,2))
plot(x = dateTime
     , y = electricity$Global_active_power
     , type="l", xlab="", ylab="Global Active Power")
plot(x = dateTime
     , y = electricity$Voltage
     , type="l", xlab="datetime", ylab="Voltage")
plot(x = dateTime
     , y = electricity$Sub_metering_1
     , type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, Sub_metering_2,col="red")
lines(dateTime, Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5)
plot(x = dateTime
     , y = electricity$Global_reactive_power
     , type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()
