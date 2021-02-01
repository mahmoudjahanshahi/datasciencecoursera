#Q01
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filePath <- "./C03/W03/src/communities.csv"
download.file(fileURL, destfile = filePath ,method = "curl")

df <- read.csv(filePath)
agricultureLogical <- df$ACR == 3 & df$AGS == 6
which(agricultureLogical)

#Q2
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
filePath <- "./C03/W03/src/picture.jpg"
download.file(fileURL, destfile = filePath ,method = "curl")

library(jpeg)
picture <- readJPEG(filePath, native =TRUE)
quantile(picture, probs = c(0.3,0.8))

#Q03
file1URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file1Path <- "./C03/W03/src/gdp.csv"
file2URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
file2Path <- "./C03/W03/src/educational.csv"
download.file(file1URL, destfile = file1Path ,method = "curl")
download.file(file2URL, destfile = file2Path ,method = "curl")

edu <- read.csv(file2Path)
gdp <- read.csv(file1Path, skip = 3)
gdp <- gdp %>% select(X, Ranking, Economy) %>% 
              rename(code = X, country = Economy)
gdp <- gdp[2:191,] %>% mutate(Ranking = parse_number(as.character(Ranking)))
merged <- merge(gdp, edu, by.x = "code", by.y = "CountryCode", all = FALSE) %>% 
              select(code, Ranking, country, Income.Group) %>% arrange(desc(Ranking))

#Q04
merged %>% group_by(Income.Group) %>% summarize(avg = mean(Ranking))

#Q05
result <- merged %>% mutate(qnt = cut(Ranking, breaks = 5)) %>% 
              group_by(qnt, Income.Group) %>% summarize(n()) %>%
              filter(Income.Group == "Lower middle income")
