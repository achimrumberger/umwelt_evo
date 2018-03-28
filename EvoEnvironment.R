EvoEnvironment <- R6Class("EvoEnvironment",
                          public = list(
                            temperature = NULL,
                            nutrients = NULL,
                            initialize = function(temperature = NA, nutrients = NA) {
                              self$temperature <- temperature
                              self$nutrients <- nutrients
                            },
                            set_temperature = function(val) {
                              self$temperature <- val
                            },
                            set_nutrients = function(val) {
                              self$nutrients <- val
                            }
                          )
)