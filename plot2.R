library("data.table")

#Load the data set
electricity <- read.csv("Data1.csv")

#Create Time Series field dateTime
attach(electricity)
electricity$dateTime = as.POSIXct(paste(Date, Time), format = "%d-%m-%Y %H:%M:%S")

#Give the name and dimensions to your plot
png("plot2.png", width=480, height=480)

#Plot the histogram
plot(x = dateTime
     , y = Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
