pollutantmean <- function(directory, pollutant, id = 1:332) {
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
  if(pollutant == "sulfate"){
    mean <- mean(data[,2],na.rm = TRUE)
  } else if (pollutant == "nitrate"){
    mean <- mean(data[,3],na.rm = TRUE)
  } else {
    print("No such Pollutant!")
  }
  mean
}