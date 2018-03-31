## ---- gauss-function ----

gaussie <- function(x, mw, sd) {
  y = (1/(sd*sqrt(2*pi)))*exp(-((x-mw)^2/sd^2))
  return(y)
}