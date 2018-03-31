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