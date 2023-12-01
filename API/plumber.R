library(plumber)
library(randomForest)

pr <- plumb("plumber_methods.R")
pr$run(port=8080, host = "0.0.0.0")

