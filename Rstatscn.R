install.packages('rstatscn')
library(rstatscn)
statscnDbs()
statscnQueryZb(dbcode='hgnd')
statscnQueryZb('A01',dbcode='hgnd')

statscnQueryData('A0101',dbcode='fsnd',moreWd=list(name='reg',value='120000'))