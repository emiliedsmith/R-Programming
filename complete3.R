complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE) #create a list of files
  dat <- data.frame()
  for(i in id){ #loops reading through the files
    dat <- read.csv(files_list[i])
    nobs = c(nobs, sum(complete.cases(dat)))
  }
  return(data.frame(id, nobs))
}