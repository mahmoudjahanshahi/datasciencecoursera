#Q01
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./C03/W01/src/Housing.csv", method = "curl")
housingData <- read.table(file = "./C03/W01/src/Housing.csv", header = TRUE, sep = ",")
library(data.table)
DThousing <- data.table(housingData)
DThousing[,Q01:=VAL==24][,.N,by=Q01]

#Q03
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "./C03/W01/src/Gas.xlsx", method = "curl")
library(xlsx)
Q03dat <- read.xlsx("./C03/W01/src/Gas.xlsx", sheetIndex=1, colIndex=c(7:15), rowIndex=c(18:23))
sum(Q03dat$Zip*Q03dat$Ext,na.rm=T)

#Q04
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
restaurants <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNode <- xmlRoot(restaurants)
sum(xpathSApply(rootNode,"//zipcode",xmlValue)=="21231")
