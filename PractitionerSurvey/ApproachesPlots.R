
#Use xlsx package
require(xlsx)
# Use gglot for figures
library(ggplot2)
library(dplyr)
library(tidyr)

# read excel file
# Location of file on Jeff's macbook.
xl_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Data/GapAnalysisMay9/ApproachesUsed.xlsx"
#Load the data.
approaches_df <- read.xlsx(xl_file, sheetName="Sheet1")
approaches_df <- gather(approaches_df, approach, useCount, Modelling:Other)
approaches_df$approach <- factor(approaches_df$approach, levels = c("Other", "Office.meetings.and.conversations", "Expert.engagement", "Workshops", "Analogue", "Historical.extrapolation", "Modelling"))
colnames(approaches_df)[1] <- "coreArea"

# Pi chart (eek!) Graph of whether secnarios are undertaken in the utility
approaches_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/approaches.pdf"
pdf(approaches_file)
g <- ggplot(data=approaches_df, aes(x=approach, fill=coreArea, y=useCount))
g <- g + geom_col() + coord_flip() + scale_x_discrete(labels=c("Other" = "Other", 
                                                             "Office.meetings.and.conversations" = "Office meetings and conversations",
                                                             "Expert.engagement" = "Expert engagement",
                                                             "Workshops" = "Workshops",
                                                             "Analogue" = "System analogues",
                                                             "Historical.extrapolation" = "Historical extrapolation", 
                                                             "Modelling" = "Modelling"))
print(g)
dev.off()

