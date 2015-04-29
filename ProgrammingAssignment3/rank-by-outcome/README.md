```R
> source("rankhospital.R")
> rankhospital("MD","heart failure",5)
[1] "SAINT AGNES HOSPITAL"
> rankhospital("TX","heart failure",4)
[1] "DETAR HOSPITAL NAVARRO"
> rankhospital("MD","heart attack","worst")
[1] "HARFORD MEMORIAL HOSPITAL"
> rankhospital("MN","heart attack",5000)
[1] NA
```
