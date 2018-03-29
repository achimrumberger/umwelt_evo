library(testthat)
library(R6)

source("EvoOrganism.R")

context('evoOrg function correctly')
evoOrg1 <- EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1)
evoOrg1$set_envNutrient(20)
evoOrg1$set_envTemperature(20)
evoOrg1$determineGrowthrate()
evoOrg1$determineOrgCount()
test_that('org count correct', {
  expect_equal(evoOrg1$orgCount, 2)
  expect_equal(evoOrg1$growthrate, 2)
})


evoOrg2 <- EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1)
evoOrg2$set_envNutrient(20)
evoOrg2$set_envTemperature(10)
evoOrg2$determineGrowthrate()
evoOrg2$determineOrgCount()
test_that('org count correct', {
  expect_equal(evoOrg2$orgCount, 1.5)
  expect_equal(evoOrg2$growthrate, 1.5)
})

#multiple runs
evoOrg3 <- EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1)
evoOrg3$set_envNutrient(20)
evoOrg3$set_envTemperature(20)
evoOrg3$determineGrowthrate()
evoOrg3$determineOrgCount()
evoOrg3$determineGrowthrate()
evoOrg3$determineOrgCount()
test_that('org count correct with multiple runs', {
  expect_equal(evoOrg3$orgCount, 4)
  expect_equal(evoOrg3$growthrate, 2)
})

