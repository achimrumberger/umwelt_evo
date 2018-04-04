## ---- loggie-function ----

loggie <- function(x, growthoptimum) {
  c = 0.1 # experimentally found constants
  d = 0.25
  maxgrowth = 2 # in optimom conditions I want to have double growth rate
  y = maxgrowth/(1+c*exp(-(x-growthoptimum)*d))
  return(y)
}