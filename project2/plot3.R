setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")
#Load emission data
Emission_Data <- readRDS("summarySCC_PM25.rds")

#Load Source classification file
SourceClass <- readRDS("Source_Classification_Code.rds")
View(Emission_Data)
View(SourceClass)
table(Emission_Data$year)
detach(Emission_Data)
sub_em_data <- subset(Emission_Data,fips=="24510")
attach(sub_em_data)
library(ggplot2)
ASDFM=as.data.frame(sub_em_data)
ASDFM[type="POINT"]

ggplot(data=sub_em_data, aes(x=factor(year), y=Emissions, fill=type))+
  geom_bar(stat = 'identity')+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
  guides(fill=FALSE)+theme_grey()
