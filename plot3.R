# Set working directory and read in the 2 .rds files
setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create dataframe for Baltimore
Baltimore <- NEI[NEI$fips=="24510",]

# get total emission in Baltimore by year and type
BaltimoreYT <- aggregate(Emissions ~ year + type, Baltimore, sum)

# Start plot
library(ggplot2)
png("plot3.png")
g <- ggplot(BaltimoreYT, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab("PM2.5 Emissions")
g <- g + ggtitle("Baltimore, Maryland, Total PM2.5 Emission by Types of Sources")
print(g)
dev.off()