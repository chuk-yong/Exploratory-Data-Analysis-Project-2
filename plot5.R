# Set working directory and read in the 2 .rds files
setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get dataframe of Baltimore city (fips=24510) and Emission by Vehicales SCC (type=ON-ROAD)
BaltimoreVeh <- NEI[NEI$type == "ON-ROAD" & NEI$fips == "24510",]

# Total Emission by year
TotalVeh <- aggregate(Emissions ~ year, BaltimoreVeh, sum)

# plot
library(ggplot2)
png("plot5.png")
g<- ggplot(TotalVeh, aes(as.factor(year), Emissions, group=1))
g<- g + geom_line() + geom_point() + xlab("Year")+ ylab("Total PM'[2.5] Emissions")
g<- g+ ggtitle("Baltimore Vehicle Emissions")
print(g)
dev.off()