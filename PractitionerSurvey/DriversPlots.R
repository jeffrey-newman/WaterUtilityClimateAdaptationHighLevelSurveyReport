
#Use xlsx package
require(xlsx)
# Use gglot for figures
library(ggplot2)
library(dplyr)

# read excel file
# Location of file on Jeff's macbook.
xl_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Data/GapAnalysisMay9/DriversConsidered.xlsx"
#Load the data.
drivers_df <- read.xlsx(xl_file, sheetName="collatedCounts")

drvrs_inc <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/proportion_drivers_included.pdf"
pdf(drvrs_inc)
p <- ggplot(drivers_df, aes(factor(1), Proportion.Included))
p <- p + geom_boxplot()
print(p)
dev.off()

drvrs_addn <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/additional_drivers_included.pdf"
pdf(drvrs_addn)
p2 <- ggplot(drivers_df, aes(factor(1), Unaligned.count))
p2 <- p2 + geom_boxplot()
print(p2)
dev.off()