plot5 <- function() {
  
  # Load the NEI & SCC data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEISCC <- merge(NEI, SCC, by="SCC")
  
  library(ggplot2)
  
  subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
  
  aggregatedTotal <- aggregate(Emissions ~ year, subsetNEI, sum)
  
  png("plot5.png", width=840, height=480)
  g <- ggplot(aggregatedTotal, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") +xlab("year") +ylab("Total PM2.5 Emissions") +ggtitle('Total Emissions from motor vehicle in Baltimore City from 1999 to 2008')
  print(g)
  dev.off()
}