setwd("C:/Users/Emilie/Desktop/Coursera")
corr <- function(directory, threshold = 0) {
files_list <- list.files(directory, full.names=TRUE) #create a list of files
dat <- data.frame()
corrr = numeric()
for(i in 1:332){ #loops reading through the files; calculating nobs and binding the files together
  dat <- read.csv(files_list[i])
  nobs <-  sum(complete.cases(dat))
  if (nobs > threshold) {
    dff = dat[complete.cases(dat), ]
    corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  }
return(corrr)
}