setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")
#Load emission data
Emission_Data <- readRDS("summarySCC_PM25.rds")

#Load Source classification file
SourceClass <- readRDS("Source_Classification_Code.rds")
View(Emission_Data)
View(SourceClass)

sub_em_data2 <- subset(Emission_Data,fips=="24510"| fips=="06037")

sourcevehicle=grepl("vehicle", SorCla[,"SCC.Level.Two"], ignore.case = T)
vehicleSCC=SorCla[sourcevehicle==T, "SCC"]
SourceVehicleData=sub_em_data2$SCC %in% vehicleSCC

sub_em_data2$VehicleSCC=SourceVehicleData
VehicleSubset=subset(sub_em_data2,SourceVehicleData==T)

City=list("06037"= "Los Angeles County", "24510"="Baltimore City")
City_labeller <- function(variable,value){
  return(City[value])
}

ggplot(data = VehicleSubset, aes(x=factor(year), y=Emissions))+
  geom_bar(stat = 'identity', position = 'dodge')+
  facet_grid(cols=vars(fips), scales = 'free', space = 'free_y', labeller = City_labeller)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))+
  theme_minimal()
?facet_grid
