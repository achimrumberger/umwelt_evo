README
================

Evolution in R
==============

Introduction
------------

We want to create a simple evolution simulation in R. We will create a very rudumentary environment, with temperature and food, in which a 'organism' will live and reproduce. The organism reproductive success will depend on the adaptation to the enviromental parameters.

Setup
-----

Create Environment Model Class
------------------------------

We want to use R6 classes to represent out environment

``` r
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
```

Create environment
------------------

Up to now there seems to be no way, to create data.frames or matrixes with custom S4 or R6 objects.

``` r
#sample(100, 1, replace = TRUE)
#env2 <- EvoEnvironment$new(sample(40, 1, replace = TRUE), sample(100, 1, replace = TRUE))
EnvList <- list()

for(i in 1:100) {
 EnvList[[i]] <- EvoEnvironment$new(sample(40, 1, replace = TRUE), sample(100, 1, replace = TRUE))
}
```

Create our first organism
-------------------------

The first organism has growth rate dependent on the temperature and nutrients of the environment. In this first try, nutrients will not be depleted by the organism

``` r
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
```

Our first live cycle
--------------------

### Create list of organism. The length of this list is the same as that of the environment list.

``` r
OrgList <- list()

for (j in 1:length(EnvList) ) {
  OrgList[[j]] <- EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1)
}
```

### Read the envirnonment data

Read the environment data and let the organism grow

### first Evaluation - a frequency distribution of organism counts

``` r
x3 <- lapply(OrgList, function(x){return(x$orgCount) })
x4 <- unlist(x3)
qplot(x4, geom="histogram", xlab = 'number of organismis in one environment', main = 'Organism Growth') 
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](README_files/figure-markdown_github/unnamed-chunk-4-1.png)
