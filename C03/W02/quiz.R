#Q01
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
index <- jsonData$name == "datasharing"
created_at <- jsonData$created_at
created_at[index]

#Q02
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./C03/W02/src/data2.csv", method = "curl")
acs <- read.table(file = "./C03/W02/src/data2.csv", header = TRUE, sep = ",")
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

#Q03
sqldf("select distinct AGEP from acs")

#Q04
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
result <- c(nchar(htmlCode[10]),nchar(htmlCode[20]),nchar(htmlCode[30]),
            nchar(htmlCode[100]))

#Q05
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
filePath <- "./C03/W02/src/data5.for"
download.file(fileURL, filePath, method = "curl")
mydata <- read.fwf(filePath,widths=c(-28,4),skip=4)
sum(mydata)
