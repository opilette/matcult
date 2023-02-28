affmat <- function(x) {
  
  lapply(c("tidyverse"), require, character.only = TRUE)
  x <- x %>% pivot_wider(names_from = c(2), values_from = c(3))
  x[is.na(x)] <- 0
  x <- tibble::column_to_rownames(x, "site")
  bin <- x %>% mutate_if(is.numeric, ~1 * (. > 0))
  assign("affMatTot", x, envir = .GlobalEnv)
  assign("affMatBin", bin, envir = .GlobalEnv)
}