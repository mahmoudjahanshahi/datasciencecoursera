corr <- function(directory, threshold = 0) {
  complete <- complete(directory)
  tmp <- complete[,2] > threshold
  id <- complete[tmp,1]
  
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
  
  result <- c()
  for(i in id){
    tmp <- data["ID"] == i
    subdata <- data[tmp,]
    tmp2 <- !is.na(subdata[,2]) & !is.na(subdata[,3])
    subdata2 <- subdata[tmp2,]
    corr <- cor(subdata2[,2],subdata2[,3])
    result <- append(result,corr)
  }
  
  result
}