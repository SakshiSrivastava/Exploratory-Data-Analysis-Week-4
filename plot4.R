plot4 <- function() {
  
  # Load the NEI & SCC data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  NEISCC <- merge(NEI, SCC, by="SCC")
  
  library(ggplot2)
  
  coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
  subsetNEISCC <- NEISCC[coalMatches, ]
  
  # Aggregate Emissions by Year only for Baltimore City
  aggregatedTotal <- aggregate(Emissions ~ year, subsetNEISCC, sum)
  
  
  
  png("plot4.png", width=640, height=480)
  g <- ggplot(aggregatedTotal, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") + xlab("year") +ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')
  print(g)
  dev.off()
}