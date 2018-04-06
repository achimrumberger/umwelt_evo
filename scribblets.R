x1 <- runif(100, min = 0, max = 100)
hist(x1)

x2 <- rnorm(400, mean = 50, sd = 10)
hist(x2)

EnvList[[1]]$temperature

x3 <- lapply(EnvList, function(x){return(x$temperature) })
x4 <- unlist(x3)
hist(x4)

x5 <- lapply(EnvList, function(x){return(x$nutrients) })
x6 <- unlist(x5)
hist(x6)


library(ggplot2)
qplot(x4, geom="histogram", xlab = 'number of organismis in one environment', main = 'Organism Growth', binwidth = 0.5) + theme(plot.title = element_text(hjust = 0.5))

########
x <- seq(0, 100, by = .1)

# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 50, sd = 20)

plot(x,y)



gaussie <- function(x, mw, sd) {
  y = (1/(sd*sqrt(2*pi)))*exp(-((x-mw)^2/sd^2))
  return(y)
}

x = 50
mw = 50
sd = 10

gaussie(x, mw, sd)


log_func <- function(k) {
  c = 0.1
  d = 0.25
  mw = 40
  maxgrowth = 2
  y = maxgrowth/(1+c*exp(-(k-mw)*d))
  return(y)
}

xx <- seq(0,60, 0.01)
yy <- sapply(xx, log_func)
plot(xx, yy)


# vector of probabilities
pnorm(c(60,65), mean=72, sd=15.2, lower.tail=TRUE) 

#nested lists
l <- list(list(1:3), list(5:8))             
str(l)
l[[1]] <- c(l[[1]], list(100:103))
str(l)
l[[1]][[1]]
l[[1]][[2]]
l[[1]][[1]][[2]]

#nested R6 lists
OrgList <- list()

for (j in 1:10 ) {
  OrgList[[j]] <- list(EvoOrganism$new(tempOpt = 20, nutrientMin = 20, orgCount = 1))
}
OrgList[[1]] <- c(OrgList[[1]], list(EvoOrganism$new(tempOpt = 30, nutrientMin = 30, orgCount = 1)))
OrgList[[1]] 
OrgList[[1]][[1]]
OrgList[[1]][[2]]
