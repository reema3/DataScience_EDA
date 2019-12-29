setwd("C:\\Users\\Saurav Singla\\Documents\\Reema")
#Load emission data
Emission_Data <- readRDS("summarySCC_PM25.rds")
EmDat=as.data.frame(Emission_Data)
#Load Source classification file
SourceClass <- readRDS("Source_Classification_Code.rds")
SorCla=as.data.frame(SourceClass)
View(SourceClass)

sourcecombustion=grepl("comb", SorCla[,"SCC.Level.One"], ignore.case = T)
sourcecoal=grepl("coal", SorCla[,"SCC.Level.Four"], ignore.case = T)
coalcomb=SorCla[sourcecoal&sourcecombustion, "SCC"]
SourceSubData=EmDat$SCC %in% coalcomb

Emission_Data$SourceCoalComb=SourceSubData
NewSubset=subset(Emission_Data, SourceCoalComb==T)
attach(NewSubset)
ggplot(data = NewSubset, aes(y= Emissions/10^3, x=factor(year)))+
  geom_bar(stat = 'identity',position = "dodge", fill=rgb(1,0.6,0.4))+
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission ('000 Tons)")) + 
  theme_minimal()+
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

