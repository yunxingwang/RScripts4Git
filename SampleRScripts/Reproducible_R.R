install.packages(c("apsrtable", "brew", "countrycode",
"devtools", "digest", "formatR", "gdata",
"ggplot2", "googleVis", "httr", "knitcitations",
"knitr", "markdown", "openair", "plyr",
"quantmod", "repmis", "reshape2",
"RCurl", "rjson", "RJSONIO", "stargazer",
"texreg", "tools", "treebase",
"twitteR", "WDI", "XML",
"xtable", "Zelig"))

install.packages("ZeligBayesian",
repos = "http://r.iq.harvard.edu/",
type = "source"
)
# Load devtools
library(devtools)
# Install slidify and ancillary libraries
install_github("slidify", "ramnathv")
install_github("slidifyLibraries", "ramnathv")
# Print R session info
sessionInfo()

# A complete comment line
2 + 2 # A comment after R code

Number<-10
Number

World<-"Hello World!"
World

NumericVect <- c(2.8, 2, 14.8)
# Show NumericVect!s contents
NumericVect

CharacterVect <- c("Albania", "Botswana", "Cambodia")
# Show CharacterVect!s contents
CharacterVect

StringNumObject <- cbind(CharacterVect, NumericVect)

# Show StringNumObject!s contents
StringNumObject

StringNumObject <- data.frame(CharacterVect, NumericVect)
# Display contents of StringNumObject data frame
StringNumObject

names(StringNumObject)

# Reassign row.names
row.names(StringNumObject) <- c("First", "Second", "Third")
# Display new row.names
row.names(StringNumObject)

# Display contents of StringNumObject data frame
StringNumObject
