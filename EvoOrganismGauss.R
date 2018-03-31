## ---- evo-org-gauss ----

library("R6")
source("gaussie.R")
EvoOrganismGauss <- R6Class(
  "EvoOrganismGauss",
  inherit = EvoOrganism,
  
  private = list(
    determineTempParam = function() {
      tx <- super$get_envTemperature()
      tmw <- super$get_tempOpt()
      tsd <- 10
      if (tx > 0.001) {
        t0 <- gaussie(tx, tmw, tsd)
        cat(paste0("gaussie: ", t0, ".\n"))
        t1 <- t0 * 100
        return(t1)
      }
      else{
        return(0)
      }
    }
  )
  
)
