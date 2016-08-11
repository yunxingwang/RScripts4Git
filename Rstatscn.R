#install.packages('rstatscn')
#install.packages("knitr", dependencies = TRUE)
#```
#library(rstatscn)
#library(knitr)
#```
packageVersion("knitr")
# if not the latest version, run
update.packages()
setwd()


str(cars)
kable(head(mtcars[, 1:6]))
statscnDbs()
statscnQueryZb(dbcode='hgnd')
statscnQueryZb('A01',dbcode='hgnd')

statscnQueryData('A0101',dbcode='fsnd',moreWd=list(name='reg',value='120000'))


set.seed(1213) # for reproducibility of random numbers
x <- cumsum(rnorm(100))
plot(x, type = "l", ylab = "$x_{i+1}=x_i+\\epsilon_{i+1}$",xlab = "step")

setwd()



if (!require("shiny")) install.packages("shiny")
demo("notebook", package = "knitr")