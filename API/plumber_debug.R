if (!require("plumber")) install.packages("plumber")
if (!require("randomForest")) install.packages("randomForest")

library(plumber)
library(randomForest)

pr <- plumb("plumber.R")
pr$run(port=8000)