## ---- evo-org ----

EvoOrganism <- R6Class("EvoOrganism",
                       public = list(
                         tempOpt=NULL,
                         nutrientMin=NULL,
                         orgCount=NULL,
                         growthrate=NULL,
                         envNutrient = NULL,
                         envTemperature = NULL,
                         initialize=function(tempOpt=NA,nutrientMin=NA,orgCount=NA,growthrate=NA, envTemperature=NA,envNutrient=NA){
                           self$tempOpt <- tempOpt
                           self$nutrientMin <- nutrientMin
                           self$orgCount <- orgCount
                           self$growthrate <- growthrate
                           self$tempOpt <- tempOpt
                           self$nutrientMin <- nutrientMin
                           self$envTemperature <- envTemperature
                           self$envNutrient <- envNutrient
                         },
                         set_orgCount=function(val) {
                           self$orgCount <- val
                         },
                         set_tempOpt=function(val) {
                           self$tempOpt <- val
                         },
                         set_nutrientMin=function(val) {
                           self$nutrientMin <- val
                         },
                         set_growthrate=function(val) {
                           self$growthrate <- val
                         },
                         set_envTemperature=function(val) {
                           self$envTemperature <- val
                         },
                         set_envNutrient=function(val) {
                           self$envNutrient <- val
                         },
                         determineGrowthrate = function() {
                           paramTemp <-  private$determineTempParam()
                           paramNutrie <- private$determineNutrientParam()
                           
                           
                           self$growthrate <- paramTemp * paramNutrie + 1
                           cat(paste0("paramtemp: ",paramTemp, " paramNutrie: ",paramNutrie,".\n"))
                         },
                         determineOrgCount = function() {
                           self$orgCount = self$orgCount * self$growthrate
                           cat(paste0("orgCount: ",self$orgCount, ".\n"))
                         }
                       ),
                       private = list(
                         determineTempParam = function() {
                           if(self$envNutrient > 0){
                             t1 <- abs(self$envTemperature/self$tempOpt)
                             return(t1)
                           }
                           else{
                             return(0)
                           }
                         },
                         determineNutrientParam = function() {
                           if(self$envNutrient > self$nutrientMin-1) {
                             return(abs(self$envNutrient/self$nutrientMin))
                           } else {
                             return(0)
                           }
                         }
                       )
                       
                       
                       
                       
)