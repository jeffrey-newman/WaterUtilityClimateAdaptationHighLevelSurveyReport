
#Use xlsx package
require(xlsx)
# Use gglot for figures
library(ggplot2)
library(dplyr)

# read excel file
# Location of file on Jeff's macbook.
xl_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Data/IntroductionMay3/Names and Scenario Questions Collated.xlsx"
#Load the data.
introduction_df <- read.xlsx2(xl_file, sheetName="CollatedSurveyMonkeyData")

#Bar Graph the results for awareness of the WSAA CA guidelines.
guidln_aware <- introduction_df$Guidelines.Awareness
guidln_aware  <- factor(guidln_aware, levels=c('I am not aware of the guidelines', 
                                               'Aware of the guidelines, but have not read any of it', 
                                               'Aware of the guidelines, have read/skimmed parts of it', 
                                               'Aware of the guidelines, have read most of it', 
                                               'Aware of the guidelines, and use them extensively'), 
                        ordered = TRUE)
guidln_aware <- as.data.frame(table(guidln_aware))
guidln_aware_grph_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/guidln_aware.pdf"
pdf(guidln_aware_grph_file)
g <- ggplot(data=guidln_aware, aes(x=guidln_aware, y=Freq))
g <- g + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
print(g)
dev.off()


# Pi chart (eek!) Graph of whether secnarios are undertaken in the utility
scnrios_undrtkn_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/scnrios_undrtkn.pdf"
pdf(scnrios_undrtkn_file)
scnrios_undrtkn <- introduction_df$Scenario.Planning.Undertaken
scnrios_undrtkn <- factor(scnrios_undrtkn, levels=c("I'm not sure", "Not that I am aware of", "Yes"))
scnrios_undrtkn <- as.data.frame(table(scnrios_undrtkn))
g2 <- ggplot(data=scnrios_undrtkn, aes(x=factor(1), fill=scnrios_undrtkn, y=Freq))
g2 <- g2 + geom_col(width = 1) + coord_polar(theta = "y", direction = -1, start=1.963)
print(g2)
dev.off()

# Bar graph of whether scenarios are used extensivelu across the utility
applied_extnsvly_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/applied_extnsvly.pdf"
pdf(applied_extnsvly_file)
applied_extnsvly <- introduction_df$Scenarios.Applied.Extensively
applied_extnsvly <- factor(applied_extnsvly, levels=c("Future scenarios are rarely used",
                                                      "2", 
                                                      "Scenarios are used, but not across all intended areas in the business",
                                                      "4", 
                                                      "Scenarios are used extensively across all intended areas in the business"
                                                      ))
applied_extnsvly <- as.data.frame(table(applied_extnsvly))
g3 <- ggplot(data=applied_extnsvly, aes(x=applied_extnsvly, y=Freq))
g3 <- g3 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
g3 <- g3 + scale_x_discrete(labels=c("Future scenarios are rarely used" = "Future scenarios\nare rarely used", 
                                     "2" = "",
                                     "Scenarios are used, but not across all intended areas in the business" = "Scenarios are used,\nbut not across all\nintended areas in the business",
                                     "4" = "",
                                     "Scenarios are used extensively across all intended areas in the business" = "Scenarios are used\nextensively across all\nintended areas in the business"
                                     )) 
print(g3)
dev.off()

# Bar graph of whether scenarios are used consistently across the utility
applied_cnsntly_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/applied_cnsntly.pdf"
pdf(applied_cnsntly_file)
applied_cnsntly <- introduction_df$Scenarios.Applied.Consistently
applied_cnsntly <- factor(applied_cnsntly, levels=c("There is no agreed upon set of scenarios", 
                                                    "2", 
                                                    "There are agreed upon scenarios, but some business areas do not use them or develop their own", 
                                                    "4", 
                                                    "There are agreed upon scenarios that are extensively used by all intended areas in the business"
                                                    ))
applied_cnsntly <- as.data.frame(table(applied_cnsntly))
g4 <- ggplot(data=applied_cnsntly, aes(x=applied_cnsntly, y=Freq))
g4 <- g4 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
g4 <- g4 + scale_x_discrete(labels=c("There is no agreed upon set of scenarios" = "There are no agreed\nupon set of scenarios", 
                                     "2" = "",
                                     "There are agreed upon scenarios, but some business areas do not use them or develop their own" = "There are agreed upon scenarios,\nbut some business areas do not\nuse them or develop their own",
                                     "4" = "",
                                     "There are agreed upon scenarios that are extensively used by all intended areas in the business" = "There are agreed upon scenarios\nthat are extensively used by\nall intended areas in the business"
)) 
print(g4)
dev.off()

# Pi chart graph of whether respondent has been involved in developing any scenarios
involvd_devlpmnt_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/invlvd_devlpmnt.pdf"
pdf(involvd_devlpmnt_file)
involvd_devlpmnt <- introduction_df$Involved.Design.Scenarios
involvd_devlpmnt <- factor(involvd_devlpmnt, levels=c("NA", "No", "Yes"))
involvd_devlpmnt <- as.data.frame(table(involvd_devlpmnt))
g5 <- ggplot(data=involvd_devlpmnt, aes(x=factor(1), fill=involvd_devlpmnt, y=Freq))
g5 <- g5 + geom_col(width = 1) + coord_polar(theta = "y", direction = -1, start=1.963)
print(g5)
dev.off()

# Bar chart of frequency in which different factors were used in scenarios.
scnrio_factrs_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/scnrio_factrs.pdf"
pdf(scnrio_factrs_file)
scnrio_factrs <- data.frame(ClimateFctrs=introduction_df$Scenarios.Climate.Factors, 
                            PopulationFctrs=introduction_df$Scenarios.Population.Factors, 
                               WaterUseFctrs=introduction_df$Scenarios.Water.Use.Factors, 
                               LanduseFctrs=introduction_df$Scenarios.Landuse.Factors, 
                               PolicyFctrs=introduction_df$Scenarios.Policy.Factors)
scnrio_factrs <- data.frame(Factors=apply(scnrio_factrs, 2, function(x) length(which(x!=""))))
scnrio_factrs$FactorName <- c("Climate", "Population", "Water use", "Landuse", "Policy")
names(scnrio_factrs)[1] <- "Freq"
g6 <- ggplot(data=scnrio_factrs, aes(x=FactorName, y=Freq))
g6 <- g6 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
print(g6)
dev.off()

# Bar graph of whether scenarios are used consistently across the utility
scnrio_vrfied_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/scnrio_vrfied.pdf"
pdf(scnrio_vrfied_file)
scnrio_vrfied <- introduction_df$Scenarios.Evaluated
scnrio_vrfied <- factor(scnrio_vrfied, levels=c("Not validated by experts at all", 
                                                    "2", 
                                                    "3", 
                                                    "4", 
                                                    "Extensive, formal process with external experts"
))
scnrio_vrfied <- as.data.frame(table(scnrio_vrfied))
g7 <- ggplot(data=scnrio_vrfied, aes(x=scnrio_vrfied, y=Freq))
g7 <- g7 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
g7 <- g7 + scale_x_discrete(labels=c("Not validated by experts at all" = "Not validated by\nexperts at all", 
                                     "2" = "",
                                     "3" = "",
                                     "4" = "",
                                     "Extensive, formal process with external experts" = "Extensive, formal process\nwith external experts"
))
print(g7)
dev.off()

# Pi chart (eek!) Graph of whether secnarios are undertaken in the utility
used_data_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/used_data.pdf"
pdf(used_data_file)
used_data <- introduction_df$Personally.Used.Climate.Data
used_data <- factor(used_data, levels=c("No", "Yes"))
used_data <- as.data.frame(table(used_data))
g8 <- ggplot(data=used_data, aes(x=factor(1), fill=used_data, y=Freq))
g8 <- g8 + geom_col(width = 1) + coord_polar(theta = "y", direction = -1, start=3.18)
print(g8)
dev.off()

