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
