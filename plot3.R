library("data.table")

#Load the data set
electricity <- read.csv("Data1.csv")

#Create Time Series field dateTime

electricity$dateTime = as.POSIXct(paste(Date, Time), format = "%d-%m-%Y %H:%M:%S")
attach(electricity)
#Give the name and dimensions to your plot
png("plot3.png", width=480, height=480)

#Plot the histogram
plot(x = dateTime
     , y = Sub_metering_1
     , type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, Sub_metering_2,col="red")
lines(dateTime, Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
