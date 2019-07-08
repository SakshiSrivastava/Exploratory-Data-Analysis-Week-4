plot1 <- function() {
  
# Load the NEI & SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate Emissions by Year
aggregateEmissions <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480)

barplot(
aggregateEmissions$Emissions,names.arg=aggregateEmissions$year,xlab="Year",ylab="PM2.5 Emissions",main="Total PM2.5 Emissions From all Sources"
)

dev.off()
}