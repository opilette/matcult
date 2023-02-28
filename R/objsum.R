objsum <- function(x){

  if (!requireNamespace("tidyverse", quietly = TRUE)) {
    install.packages("tidyverse")
    library(tidyverse)
  } else {
    library(tidyverse)
  }
  a <- readline(prompt="Archaeological sites column title : ")
  b <- readline(prompt="Objects column title : ")
  c  <- readline(prompt="Quantity column title :")
  val <- c(a, b, c)
  x <- select(x, all_of(val)) %>% na.omit()
  x[,3] <- as.numeric(as.character(x[,3]))
  x[,1] <- paste(x[,1], x[,2], sep=" ")
  x <- select(x, c(1, 3))
  x <- aggregate(x[,2], list(x[,1]), FUN=sum)
  x <- separate(x, col = 1, into = c("c1", "c2"), sep = " ")
  colnames(x) <- val
  assign("objsum", x, envir = .GlobalEnv)

}
