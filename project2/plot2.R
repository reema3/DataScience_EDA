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
Agr=aggregate(Emissions, by=list(year), FUN='sum')
barplot(Agr$x,Agr$Group.1, names = Agr$Group.1,
        xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
