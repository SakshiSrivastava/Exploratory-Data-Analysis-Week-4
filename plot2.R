plot2 <- function() {
  
  # Load the NEI & SCC data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # Baltimore City Subsetting
  BaltimoreNEI <- subset(NEI, fips == "24510")
  
  # Aggregate Emissions by Year only for Baltimore City
  aggregateEmissions <- aggregate(Emissions ~ year,NEI, sum)
  
  png("plot2.png",width=480,height=480)
  
  barplot(
    aggregateEmissions$Emissions,names.arg=aggregateEmissions$year,xlab="Year",ylab="PM2.5 Emissions",main="Total PM2.5 Emissions for Baltimore City"
  )
  
  dev.off()
}