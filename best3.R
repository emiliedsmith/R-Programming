best <- function(state,outcome){
  data <- read.csv("outcome-of-care-measures.csv")
  state_filter <- data$State==state
  state_data <- data[state_filter,]
  if(sum(state_filter) <= 0)
  {
    stop("invalid state")
  }
  
  if(outcome =="heart attack") column = 11
  else if(outcome =="heart failure") column = 17
  else if(outcome =="pneumonia") column = 23
  else stop("invalid outcome")
  
  state_data[,column] <- as.numeric(as.character(state_data[,column]))
  filtered <- complete.cases(state_data[,column])
  filtered_data <- state_data[filtered,]
  ranking <- as.vector(filtered_data[
    order(filtered_data[,column], filtered_data[,2])
    ,2])
  
  return(ranking[1])
}