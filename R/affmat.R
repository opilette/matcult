affmat <- function(x) {

  lapply(c("tidyverse"), require, character.only = TRUE)
  x <- x %>% pivot_wider(names_from = c(2), values_from = c(3))
  x[is.na(x)] <- 0
  names(x)[1] <- ""
  x <- x %>% as.data.frame()
  x <- data.frame(x[,-1], row.names=x[,1])
  bin <- x %>% mutate_if(is.numeric, ~1 * (. > 0))
  assign("affMatTot", x, envir = .GlobalEnv)
  assign("affMatBin", bin, envir = .GlobalEnv)
}
