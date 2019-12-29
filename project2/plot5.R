setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")
#Load emission data
Emission_Data <- readRDS("summarySCC_PM25.rds")

#Load Source classification file
SourceClass <- readRDS("Source_Classification_Code.rds")
View(Emission_Data)
View(SourceClass)
SCC
table(Emission_Data$year)

sub_em_data <- subset(Emission_Data,fips=="24510")

table(SourceClass$SCC.Level.Two)
sourcevehicle=grepl("vehicle", SorCla[,"SCC.Level.Two"], ignore.case = T)
vehicleSCC=SorCla[sourcevehicle==T, "SCC"]
SourceVehicleData=sub_em_data$SCC %in% vehicleSCC

sub_em_data$VehicleSCC=SourceVehicleData
VehicleSubset=subset(sub_em_data,SourceVehicleData==T)

ggplot(data = VehicleSubset, aes(x=factor(year), y=Emissions))+
  geom_bar(stat = 'identity', position = 'dodge', fill=rgb(1,0.2,0.8, alpha = 0.8))+
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

