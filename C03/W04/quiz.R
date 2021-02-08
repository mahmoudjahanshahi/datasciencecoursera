#Q01
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filePath <- "./C03/W04/src/communities.csv"
download.file(fileURL, destfile = filePath ,method = "curl")

df <- read.csv(filePath)
strsplit(names(df), "wgtp")[123]

#Q02
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
filePath <- "./C03/W04/src/gdp.csv"
download.file(fileURL, destfile = filePath ,method = "curl")

library(dplyr)
library(readr)
gdp <- read.csv(filePath, skip = 3)
gdp <- gdp %>% select(X, Ranking, Economy, US.dollars.) %>% 
  rename(code = X, country = Economy, gdp = US.dollars.)
gdp <- gdp[2:191,] %>% mutate(Ranking = parse_number(as.character(Ranking)))

mean(parse_number(gsub(",", "", gdp$gdp)))

#Q03
grep("^United",gdp$country)

#Q04
file1URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file1Path <- "./C03/W04/src/gdp.csv"
file2URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
file2Path <- "./C03/W04/src/educational.csv"
download.file(file1URL, destfile = file1Path ,method = "curl")
download.file(file2URL, destfile = file2Path ,method = "curl")

edu <- read.csv(file2Path)
gdp <- read.csv(file1Path, skip = 3)
gdp <- gdp %>% select(X, Ranking, Economy) %>% 
  rename(code = X, country = Economy)
gdp <- gdp[2:191,] %>% mutate(Ranking = parse_number(as.character(Ranking)))
merged <- merge(gdp, edu, by.x = "code", by.y = "CountryCode", all = FALSE) %>% 
  select(code, Ranking, country, Special.Notes) %>% arrange(desc(Ranking))
grep("Fiscal year end: June",merged$Special.Notes, value = TRUE)

#Q05
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

sample2012 <- sampleTimes[year(sampleTimes) == 2012]
length(sample2012)
length(sample2012[wday(sample2012) == 2])
