#Load emission data
Emission_Data <- readRDS("summarySCC_PM25.rds")

#Load Source classification file
SourceClass <- readRDS("Source_Classification_Code.rds")
View(Emission_Data)
View(SourceClass)
table(Emission_Data$year)
attach(Emission_Data)
Agr=aggregate(Emissions, by=list(year), FUN='sum')
barplot(Agr$x,Agr$Group.1, names = Agr$Group.1,
        xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
