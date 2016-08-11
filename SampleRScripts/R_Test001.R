require(downloader)
library(dplyr)
library(sqldf)
library(data.table)
library(ggplot2)
library(compare)
library(plotrix)
try.error = function(url)
{
  try_error = tryCatch(download(url,dest="data.zip"), error=function(e) e)
  if (!inherits(try_error, "error")){
    download(url,dest="data.zip")
    unzip ("data.zip")
  }
  else if (inherits(try_error, "error")){
    cat(url,"not foundn")
  }
}
year_start=2013
year_last=year(Sys.time()) 
for (i in year_start:year_last){ 
  j=c(1:4) 
  for (m in j){
    url1<-paste0("http://www.nber.org/fda/faers/",i,"/demo",i,"q",m,".csv.zip") 
    url2<-paste0("http://www.nber.org/fda/faers/",i,"/drug",i,"q",m,".csv.zip") 
    url3<-paste0("http://www.nber.org/fda/faers/",i,"/reac",i,"q",m,".csv.zip") 
    url4<-paste0("http://www.nber.org/fda/faers/",i,"/outc",i,"q",m,".csv.zip") 
    url5<-paste0("http://www.nber.org/fda/faers/",i,"/indi",i,"q",m,".csv.zip") 
    try.error(url1) 
    try.error(url2) 
    try.error(url3) 
    try.error(url4) 
    try.error(url5)
  } 
}