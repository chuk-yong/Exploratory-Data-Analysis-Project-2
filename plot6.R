# Set working directory and read in the 2 .rds files
setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get dataframe of Baltimore city (fips=24510) and Los Angeles (fips= 06037),Emission by Vehicales SCC (type=ON-ROAD)
BaltimoreVeh <- NEI[NEI$type == "ON-ROAD" & NEI$fips == "24510",]
LAVeh <- NEI[NEI$type == "ON-ROAD" & NEI$fips == "06037",]

# Total Emission by year
TotalVehBal <- aggregate(Emissions ~ year, BaltimoreVeh, sum)
TotalVehLA <- aggregate(Emissions ~ year, LAVeh, sum)

#plot
library(ggplot2)
png("plot6.png")
g <- ggplot()+geom_line(data=TotalVehBal, aes(year, Emissions, color = "Baltimore"))+geom_point(data = TotalVehBal,aes(year, Emissions))
g <- g+ geom_line(data = TotalVehLA, aes(year, Emissions, color = "Los Angeles")) + geom_point(data = TotalVehLA,aes(year, Emissions))
g <- g+ scale_colour_manual(name="",values = c("Baltimore"= "green","Los Angeles"= "red"))
g <- g+ xlab("Year") + ylab("Total PM'[2.5] Emissions") + ggtitle("Baltimore vs Los Angeles Vehicle Emissions")
print(g)
dev.off()

