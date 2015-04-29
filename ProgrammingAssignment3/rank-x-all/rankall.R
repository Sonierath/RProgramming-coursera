rankall <- function(outcome,num="best") {
  outcomeCol <- function(outcome) {
    ## Return hospital name in that state with lowest 30-day death
    if(outcome=="heart attack") {
      outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if(outcome=="heart failure") {
      outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if(outcome=="pneumonia") {
      outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else {
      stop("invalid outcome")
    }
  }
  ## rate
  outcome <- outcomeCol(outcome)
  data <- read.csv("outcome-of-care-measures.csv",  colClasses="character")
  data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
  data <- data[order(data$"State", data[outcome], data$"Hospital.Name", na.last=NA),]
  data <- data[!is.na(outcome)]
  
  ig <- split(data[,c("Hospital.Name")],data$State)
  rankHospitals <- function(meow,num) {
    if(num=="best") {
      head(meow,1)
    } else if(num=="worst") {
      tail(meow,1)
    } else {
      meow[num]
    }
  }
  result <- lapply(ig,rankHospitals,num)
  data.frame(hospital=unlist(result),state=names(result),row.names=names(result))
}
