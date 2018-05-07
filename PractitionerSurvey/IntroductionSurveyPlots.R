
#Use xlsx package
require(xlsx)
# Use gglot for figures
library(ggplot2)

# read excel file
# Location of file on Jeff's macbook.
xl_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Data/IntroductionMay3/Names and Scenario Questions Collated.xlsx"
#Load the data.
introduction_df <- read.xlsx2(xl_file, sheetName="CollatedSurveyMonkeyData")

# Graph the results for awareness of the WSAA CA guidelines.
guidln_aware <- introduction_df$Guidelines.Awareness
guidln_aware  <- factor(guidln_aware, levels=c('I am not aware of the guidelines', 'Aware of the guidelines, but have not read any of it', 'Aware of the guidelines, have read/skimmed parts of it', 'Aware of the guidelines, have read most of it', 'Aware of the guidelines, and use them extensively'), ordered = TRUE)
guidln_aware <- as.data.frame(table(guidln_aware))

#Location to save figure on Jeff's macbook
guidln_aware_grph_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/guidln_aware.pdf"
pdf(guidln_aware_grph_file)
g <- ggplot(data=guidln_aware, aes(x=guidln_aware, y=Freq))
g <- g + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
print(g)
dev.off()
# +  coord_flip() + scale_x_discrete(labels=c('I am not aware of the guidelines', 'Aware of the guidelines, but have not read any of it', 'Aware of the guidelines, have read/skimmed parts of it', 'Aware of the guidelines, have read most of it', 'Aware of the guidelines, and use them extensively'))

