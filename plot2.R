# Set working directory and read in the 2 .rds files
setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create dataframe for Baltimore
Baltimore <- NEI[NEI$fips=="24510",]

# get total emission by year
TotalBaltimore <- aggregate(Emissions ~ year, Baltimore, sum)

# Start plot and save to plot2.png
png('plot2.png')
barplot(
  (height=TotalBaltimore$Emissions),
  names.arg=TotalBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (g)",
  main="Total PM2.5 Emissions For Baltimore"
)
dev.off()
