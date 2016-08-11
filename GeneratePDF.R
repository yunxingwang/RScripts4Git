# Set working directory
setwd("/BatchReports")
#### Download Data ####
# Load repmis
library(repmis)
# Download data
MainData <- source_data("http://bit.ly/V0ldsf")
# Create vector of country names
COUNTRY <- as.character(unique(MainData$country))
#### Create BatchReports Function ####
BatchReports <- function(Name){
# Create file names for individual reports
## Remove white space in country names
CountryNoWhite <- gsub(" ", "", x = Name)
KnitFile <- paste(CountryNoWhite, ".Rnw", sep = "")
# Subset data
Large LaTeX Documents: Theses, Books, & Batch Reports 235
SubData <- subset(MainData, country == Name)
# Create vector of the country!s fertilizer consumption
FC <- SubData$FertilizerConsumption
# Brew and Knit
brew::brew("Template/BrewTemplate.Rnw", KnitFile)
knitr::knit2pdf(KnitFile)
}
#### Run function and clean up ####
plyr::l_ply(COUNTRY, BatchReports)
# Keep only pdf reports
unlink(c("*.aux", "*.log", "*.Rnw", "*.tex"))