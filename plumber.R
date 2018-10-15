library(plumber)
p <- plumb("app.R")
p$run(host = "0.0.0.0", port = 8899)