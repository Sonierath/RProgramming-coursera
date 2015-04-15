## GIVEN
## 'directory' is a character vector of length 1 indicating the location of the CSV files
## 'threshold' is a numeric vector of length 1 indicating the number of completely observed observations (on all variables) required to compute the correlation between nitrate and sulfate)
## the default is 0

## AIM
## Return a numeric vector of correlations

## SOLUTION

corr <- function(directory,threshold=0){
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
  ## Adding complete observations
  complete <- function(directory,id=1:332) {
    ## Adding meowFile again
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
  ## Adding Correlation Observations
  ## IG ## IG ## IG ## IG
  ## Meow Meow (^_^)
  ig <- complete(directory,1:332)
  meowResult <- c()
  ## for-looping IG =P
  for(i in ig$id[ig$nobs>threshold]) {
    ## add filename
    filename <- meowFile(directory,i)
    data <- read.csv(filename,sep=",")
    ## Meow Filter
    meowFilter <- data[complete.cases(data),];
    ## Display result
    meowResult <- c(meowResult,cor(meowFilter$sulfate,meowFilter$nitrate))
  }
  return(meowResult)
}
