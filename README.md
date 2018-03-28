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
source("EvoEnvironment.R")
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
source("EvoOrganism.R")
```
