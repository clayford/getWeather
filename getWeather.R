# weather underground script
# get a day's weather from a specified location

setwd("~/_statistics/weather/")

getWeather <- function(ID="KVACHARL30", day, month, year){
  URL <- paste0("http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=",ID,
"&day=",day,"&month=",month,"&year=", year, "&graphspan=day&format=1")
  
  tmp <- readLines(URL)
if(length(tmp) <=2 ) stop("no data; pick another date")
  tmp <- tmp[tmp!="<br>" & tmp!=""]
  tmp <- sub(",$","",x = tmp)
  tmp <- sub("<br>","",tmp)
  
  write(tmp, file = "wea.csv")
  
  read.csv("wea.csv", row.names = NULL)
  
}

# test
dat <- getWeather(ID="KVACHARL30", day="5",month="11",year="2014")
