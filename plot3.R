plot3 <- function() {
  
  # Load the NEI & SCC data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  library(ggplot2)
  
  # Baltimore City Subsetting
  BaltimoreNEI <- subset(NEI, fips == "24510")
  
  # Aggregate Emissions by Year only for Baltimore City
  aggregateEmissions <- aggregate(Emissions ~ year + type,NEI, sum)
  
  png("plot3.png",width=480,height=480)
  
  g <- ggplot(aggregateEmissions, aes(year, Emissions, color = type))
  g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
  print(g)
  dev.off()
}