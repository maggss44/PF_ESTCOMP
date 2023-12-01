library(plumber)
library(randomForest)

pr <- plumb("random_forest_model.R")
pr$run(port=8080, host = "0.0.0.0")

