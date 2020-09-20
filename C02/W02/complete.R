complete <- function(directory, id = 1:332) {
  data <- data.frame(Date=character(),sulfate=numeric(), nitrate=numeric(), ID=integer())
  for(i in id){
    if (i<10) {
      data <- rbind(data,read.csv(paste(directory,"\\","00",i,".CSV",sep="")))
    } else if (i < 100) {
      data <- rbind(data,read.csv(paste(directory,"\\","0",i,".CSV",sep="")))
    } else {
      data <- rbind(data,read.csv(paste(directory,"\\",i,".CSV",sep="")))
    }
  }
  result <- data.frame(id=integer(),nobs=integer())
  for(i in id){
    tmp <- data["ID"] == i
    subdata <- data[tmp,]
    sum <- sum(!is.na(subdata[,2]) & !is.na(subdata[,3]))
    result <- rbind(result,data.frame(id=i,nobs=sum))
  }
  result
}