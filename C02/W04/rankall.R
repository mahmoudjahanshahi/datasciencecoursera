rankall <- function(outcome, num = "best") {
  ## Reading outcome data
  base_data <- read.csv("../src/W04_outcome-of-care-measures.csv", colClasses = "character")
  custom_data <- base_data[,c(2,7,11,17,23)]
  for (i in c(3:5)) {
    custom_data[,i] <- suppressWarnings(as.numeric(custom_data[,i]))
  }
  n <- dim(custom_data)[1]
  is_na <- data.frame(logical(n),logical(n),logical(n))
  for (i in c(3:5)) {
    is_na[,i-2] <- is.na(custom_data[i])
  }
  
  ## Checking that outcome is valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  outcome <- tolower(outcome)
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df <- data.frame(hospital=character(),state=character())
  
  states <- unique(custom_data[2])
  states <- states[order(states[,1]),]
  for (state in states) {
    index <- match(outcome,valid_outcomes)
    state_vec <- state == custom_data["State"]
    target_data_vec <- !is_na[index] & state_vec
    target_data <- custom_data[target_data_vec,c(1,index+2)]
    target <- target_data[order(target_data[,2],target_data[,1]),]
    if (tolower(num) == "best") {
      tmpnum <- 1
    }
    else if (tolower(num) == "worst") {
      tmpnum <- length(target[,1])
    }
    else {
      tmpnum <- num
    }
    result <- data.frame(hospital=target[tmpnum,1],state=state)
    df <- rbind(df,result)
  }
  
  df
}