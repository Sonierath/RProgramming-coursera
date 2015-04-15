## GIVEN
## 'directory' is a character vector of length 1 indicating the location of the CSV files
## 'id' is an integer vector indicating the monitor ID numbers to be used
## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where,
##'id' => monitor ID number
##'nobs' => number of complete cases

## SOLUTION

complete <- function(directory,id=1:332) {
  ## Adding meowFile
  meowFile <- function(directory,meow) {
    if(meow<10) {
      filename = paste(directory, "/", "00", meow, ".csv", sep="")
    } else if(meow >= 10 && meow < 100) {
      filename=paste(directory,"/","0",meow,".csv",sep="")
    } else {
      filename=paste(directory,"/",meow,".csv",sep="")
    }
  }
  ## defining id and nobs
  MeowMeow <- data.frame(id=numeric(),nobs=numeric())
  for(i in id){
    filename <- meowFile(directory,i)
    data <- read.csv(filename)
    MeowMeow <- rbind(MeowMeow,data.frame(id=i,nobs=nrow(data[complete.cases(data),])))
  }
  MeowMeow
}
