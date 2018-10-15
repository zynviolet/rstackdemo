library(redux)
library(plumber)
library(magrittr)

#' Echo number of times it has been called
#' @get /hello
function() {
    # connect to Redis here
    cfg <- redis_config(url = "some-redis", port=  6379)
    r <- hiredis(cfg)
    nm <- Sys.info()[['nodename']]
    # increase counter
    r$INCR(nm)
    # message
    paste("I have been called", r$GET(nm), "times.")
}
