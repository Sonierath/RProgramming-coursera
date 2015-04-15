pollutantmean <- function(directory, pollutant, id=1:332) {
  ## AIM
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## SOLUTION
  
  meowFile <- function(directory,meow) {
    if(meow<10) {
      filename = paste(directory, "/", "00", meow, ".csv", sep="")
    } else if(meow >= 10 && meow < 100) {
      filename=paste(directory,"/","0",meow,".csv",sep="")
    } else {
      filename=paste(directory,"/",meow,".csv",sep="")
    }
  }
  specdata <- numeric()
  ## id
  for(i in id) {
    ## directory
    filename <- meowFile(directory,i)
    data <- read.csv(filename)
    ##pollutant
    if(pollutant=="sulfate") {
      specdata <- c(specdata, data$sulfate)
    } else if(pollutant=="nitrate") {
      specdata <- c(specdata,data$nitrate)
    }
  }
  mean(specdata,na.rm=TRUE)
}
