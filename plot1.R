setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(
  (height=TotalByYear$Emissions)/10^6,
  names.arg=TotalByYear$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Metric Ton)",
  main="Total PM2.5 Emissions From All US Sources"
)
dev.off()