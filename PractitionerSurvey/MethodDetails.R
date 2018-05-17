#Use xlsx package
require(xlsx)
# Use gglot for figures
library(ggplot2)
library(dplyr)
library(tidyr)

# read excel file
# Location of file on Jeff's macbook.
xl_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Data/MethodologiesCollatedData.xlsx"
#Load the data.
method_details_df <- read.xlsx(xl_file, sheetName="Data", startRow = 3, header = TRUE)

#Generic vs system specific.
generic_specific_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/specific_vs_generic.pdf"
pdf(generic_specific_file)
g1 <- ggplot(data = method_details_df[!is.na(method_details_df$Generic.vs.system.specific.2),], mapping = aes(Generic.vs.system.specific.2))
g1 <- g1 + geom_bar() + coord_flip()
print(g1)
dev.off()

#Climate scenarios used
clim_sc_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/climate_scenarios_used.pdf"
pdf(clim_sc_file)
scnrio_used <- data.frame(RCP2.6=method_details_df$Scenarios.RCP2.6, 
                            RCP4.5=method_details_df$Scenarios.RCP4.5, 
                            RCP8.5=method_details_df$Scenarios.RCP8.5, 
                            A1=method_details_df$Scenarios.SRES.A1, 
                            A2=method_details_df$Scenarios.SRES.A2,
                            B1=method_details_df$Scenarios.SRES.B1,
                            B2=method_details_df$Scenarios.SRES.B2,
                            inc=method_details_df$Scenarios.Incremental,
                            oth=method_details_df$Scenarios.Others
                            )
scnrio_used <- data.frame(Factors=apply(scnrio_used, 2, function(x) length(which(x!=""))))
scnrio_used$FactorName <- c("RCP2.6", "RCP4.5", "RCP8.5", "SRES A1", "SRES A2", "SRES B1", "SRES B2", "Incremental", "Other")
names(scnrio_used)[1] <- "Freq"
g2 <- ggplot(data=scnrio_used, aes(x=FactorName, y=Freq))
g2 <- g2 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
print(g2)
dev.off()

time_horizons_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/time_horizons.pdf"
pdf(clim_sc_file)
time_horizns <- data.frame(t.1..4.years=method_details_df$Time.horizons.1.4.year, 
                           t.5..9.years=method_details_df$Time.horizons.5.9.years, 
                           t.10..50.years=method_details_df$Time.horizons.10.50.years, 
                           t.50..100.years=method_details_df$Time.horizons.50.100.years, 
                           t.not.sure=method_details_df$Time.horizons.Not.sure
                          )
time_horizns <- data.frame(Factors=apply(time_horizns, 2, function(x) length(which(x!=""))))
time_horizns$FactorName <- c("1-4 years", "5-9 years", "10-50 years", "50-100 years", "Not sure")
names(time_horizns)[1] <- "Freq"
g2 <- ggplot(data=time_horizns, aes(x=FactorName, y=Freq))
g2 <- g2 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
print(g2)
dev.off()

# Data checking -- 
# 1. Not assessed, 2, 3. Assessed to some extent, but undocumented, 4, 5. Extensive formal assessment. - also NA
# Data suitability
# 1. Not sure, 2. Unsuitable, 3. , 4. Some, but not all characteristics of the data made it suitable, 5., 6. Very suitable.
suitablty_assessed_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/suitability_assessed.pdf"
pdf(suitablty_assessed_file)
suitablty_assessed <- method_details_df$Suitability.Checked
suitablty_assessed <- factor(suitablty_assessed, levels=c("Not assessed", 
                                                    "2", 
                                                    "Assessed to some extent, but undocumented", 
                                                    "4", 
                                                    "Extensive formal assessment"
))
suitablty_assessed <- as.data.frame(table(suitablty_assessed))
g3 <- ggplot(data=suitablty_assessed, aes(x=suitablty_assessed, y=Freq))
g3 <- g3 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
g3 <- g3 + scale_x_discrete(labels=c("Not assessed" = "Not assessed", 
                                     "2" = "",
                                     "Assessed to some extent, but undocumented" = "Assessed to some extent, but undocumented",
                                     "4" = "",
                                     "Extensive formal assessment" = "Extensive formal assessment"
)) 
print(g3)
dev.off()

suitablty_score_file <- "/Users/a1091793/Dropbox (WaterSystems)/Projects/Climate Adaptation/Phase 1 - Decision Survey/Results/Released Survey/Figures/suitability_score.pdf"
pdf(suitablty_score_file)
suitablty_score <- method_details_df$Suitability.Rating
suitablty_score <- factor(suitablty_score, levels=c("Not sure",
                                                    "Unsuitable",
                                                          "3", 
                                                          "Some, but not all characteristics of the data made it suitable", 
                                                          "5", 
                                                          "Very suitable"
))
suitablty_score <- as.data.frame(table(suitablty_score))
g3 <- ggplot(data=suitablty_score, aes(x=suitablty_score, y=Freq))
g3 <- g3 + geom_col() + coord_flip() + ylab("Frequency of response") + theme(axis.title.y=element_blank())
g3 <- g3 + scale_x_discrete(labels=c("Not assessed" = "Not assessed", 
                                     "2" = "",
                                     "Assessed to some extent, but undocumented" = "Assessed to some extent, but undocumented",
                                     "4" = "",
                                     "Extensive formal assessment" = "Extensive formal assessment"
)) 
print(g3)
dev.off()




