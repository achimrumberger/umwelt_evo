library(testthat)
source("EvoOrganism.R")
context('evoOrg function correctly')
evoOrg1 <- EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1)
evoOrg1$set_envNutrient(20)
evoOrg1$set_envTemperature(20)
evoOrg1$determineGrowthrate()
evoOrg1$determineOrgCount()
test_that('org count correct', {
  expect_equal(evoOrg1$orgCount, 2)
  expect_equal(evoOrg1$growthrate, 1)
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


