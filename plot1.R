setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")

#Load the data set
electricity <- read.csv("Data1.csv")

#Give the name and dimensions to your plot
png("plot1.png", width=480, height=480)

#Plot the histogram
hist(electricity$Global_active_power,xlab = "Global Active Power (kilowatts)",
     col = "red",main="Global Active Power",width=480, height=480)
dev.off()

