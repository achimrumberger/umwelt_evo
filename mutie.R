## ---- mutie-function ----

mutie <- function(mw) {
  p <- c(0.01, 0.05, 0.88, 0.05, 0.01)
  upper_limit = mw + 2
  lower_limit = mw - 2
  return(sample(lower_limit:upper_limit, 1, replace = T, prob = p))
}