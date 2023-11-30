library(plumber)
library(randomForest)

pr <- plumb("plumber.R")
pr$run(port=8000)

