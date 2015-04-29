rankhospital <- function(state,outcome,num="best") {
  best <- function(state,outcome) {
    ## Reading the outcome data
    sortHospitalsByOutcome <- function(state,outcome) {
      ## Checking that state and outcome are valid
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
      data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors=FALSE)
      if(!state %in% data$State) {
        stop("invalid state")
      }
      data <- data[data$State==state,]
      data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
      data <- data[order(data[outcome],data$"Hospital.Name"),]
      as.character(data$"Hospital.Name"[!is.na(data[outcome])])
    }
    head(sortHospitalsByOutcome(state,outcome),1)
  }
  sortHospitalsByOutcome <- function(state,outcome) {
    ## Checking that state and outcome are valid
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
    data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors=FALSE)
    if(!state %in% data$State) {
      stop("invalid state")
    }
    data <- data[data$State==state,]
    data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
    data <- data[order(data[outcome],data$"Hospital.Name"),]
    as.character(data$"Hospital.Name"[!is.na(data[outcome])])
  }
  if(num=="best") {
    best(state,outcome)
  } else if(num=="worst") {
    tail(sortHospitalsByOutcome(state,outcome),1)
  } else {
    sortHospitalsByOutcome(state,outcome)[num]
  }
}
