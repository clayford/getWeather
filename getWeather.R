# weather underground script
# get a day's weather from a specified location

setwd("~/_statistics/weather/")

# http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KVACHARL47&day=2&month=3&year=2015&graphspan=day&format=1
URL <- "http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KVACHARL47&day=2&month=3&year=2015&graphspan=day&format=1"

tmp <- readLines(URL)
tmp <- tmp[tmp!="<br>" & tmp!=""]
tmp <- sub(",$","",x = tmp)
tmp <- sub("<br>","",tmp)

write(tmp, file = "wea.csv")

dat <- read.csv("wea.csv", row.names = NULL)

getWeather <- function(ID="KVACHARL30", day, month, year){
  URL <- paste0("http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=",ID,
"&day=",day,"&month=",month,"&year=", year, "&graphspan=day&format=1")
  
  tmp <- readLines(URL)
  tmp <- tmp[tmp!="<br>" & tmp!=""]
  tmp <- sub(",$","",x = tmp)
  tmp <- sub("<br>","",tmp)
  
  write(tmp, file = "wea.csv")
  
  read.csv("wea.csv", row.names = NULL)
  
}

dat <- getWeather(ID="KVACHARL30", day="5",month="11",year="2014")
