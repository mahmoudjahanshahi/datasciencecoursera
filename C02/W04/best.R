best <- function(state, outcome) {
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
  
  ## Checking that state and outcome are valid
  valid_states <- unique(custom_data[2])
  state <- toupper(state)
  if (!state %in% valid_states[,1]) {
    stop("invalid state")
  }
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  outcome <- tolower(outcome)
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
  ## Returning hospital name in that state with lowest 30-day death rate
  index <- match(outcome,valid_outcomes)
  state_vec <- state == custom_data["State"]
  target_data_vec <- !is_na[index] & state_vec
  target_data <- custom_data[target_data_vec,c(1,index+2)]
  result_index <- match(min(target_data[2]),target_data[,2])
  result <- target_data[result_index,1]
  result <- sort(result)
  
  result[1]

}