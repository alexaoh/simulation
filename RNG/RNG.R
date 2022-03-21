# My solution to implementing a RNG in lecture 21.03.22.

RNG <- function(seed, n){
  z <- rep(NA, n)
  z[1] <- seed
  # Parameters given by the lecturer. 
  a <- 22695477
  b <- 1
  m <- 2^32
  for (i in 2:n){
    z[i] <- (a*z[i-1]+b) %% m 
  }
  return(z/m)
}

z <- RNG(123456, 10000)
hist(z)
mean(z) # Approx. 0.5
var(z) # Approx. 1/12
