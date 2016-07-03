# Set working directory and read in the 2 .rds files
setwd(paste(getwd(),"/NEI_data",sep=""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find (Grep) the SCC codes corresponding to Coal in SCC
SCC_Coal <- SCC[grep("coal | Coal", SCC$Short.Name),]

# Find in NEI matching SCC codes corresponding to Coal
NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal$SCC,]

# Total by year of all coal sources
TotalCoal <- aggregate(Emissions ~ year, NEI_Coal, sum)

#plot
library(ggplot2)
png("plot4.png")
g <- ggplot(TotalCoal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab("Total PM'[2.5] Emissions") +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()