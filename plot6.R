plot6 <- function() {
  
  # Load the NEI & SCC data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEISCC <- merge(NEI, SCC, by="SCC")
  
  library(ggplot2)
  subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
  
  aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
  aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
  aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
  
  png("plot6.png", width=1040, height=480)
  g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
  g <- g + facet_grid(. ~ fips)
  g <- g + geom_bar(stat="identity")  +xlab("year") +ylab("Total PM 2.5 Emissions") +ggtitle("PM 2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
  print(g)
  dev.off()
}