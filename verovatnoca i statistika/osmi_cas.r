#1.
n <- 64
xn <- 118
sigma2 <- 100
c1 <- qnorm (0.975)
c1
interval_poverenja <- c(xn - c1*sqrt(sigma2/n) , xn + c1*sqrt(sigma2/n))
interval_poverenja
#2. 
n <- 25  
sn2 <- 170.36 
xn <- 2.6 
beta <- 0.95 
c1 <- qt((1+beta)/2, 24)
c1
interval_poverenja <- c(xn - c1*sqrt(sn2/n) , xn + c1*sqrt(sn2/n))
interval_poverenja
#3.
n <- 20
sn2 <- 21.12 
beta <- 0.99
c1 <- qchisq( (1-beta)/2, 19)
c2 <- qchisq( (1+beta)/2, 19)
interval_poverenja <- c((n-1)*sn2/c2, (n-1)*sn2/c1)
interval_poverenja
#4.
n <- 20
sn2 <- 21.12
beta <- 0.99
d <- qchisq(0.99, n-1) 
gornji_interval <- c((n-1)*sn2/d, Inf)
gornji_interval
f <- qchisq(0.01, n-1)
donji_interval <- c(0, (n-1)*sn2/f)
donji_interval
#5.
cene <- c(1.22, 1.37, 1.27, 1.20, 1.42, 1.41, 1.22, 1.24,
          1.28, 1.42, 1.48, 1.32, 1.40, 1.26, 1.39, 1.45,
          1.44, 1.49, 1.47, 1.47, 1.24, 1.34, 1.27, 1.35,
          1.34, 1.45, 1.49, 1.45, 1.23, 1.20, 1.42, 1.34,
          1.43, 1.21, 1.49, 1.36, 1.24, 1.20, 1.45,
          1.23, 1.25, 1.24, 1.35, 1.23, 1.39, 1.38,
          1.46, 1.48, 1.26, 1.36, 1.22, 1.46, 1.39,
          1.22, 1.29, 1.47, 1.24, 1.35, 1.21, 1.21)
cene
xn <- mean(cene)
sn2 <- var(cene)
n <- length(cene)
beta1 <- 0.95
beta2 <- 0.97
c1 <- qt(beta1+(1-beta1)/2, df=n-1) 
int.pov.m <- c(xn-c1*sqrt(sn2)/sqrt(n), xn+ c1*sqrt(sn2)/sqrt(n) )
int.pov.m
c2 <- qchisq(beta2, df=n-1)
int.pov.sigma2 <- c((n-1)*sn2/c2, Inf)
int.pov.sigma2
int.pov.sigma <- c(sqrt((n-1)*sn2/c2), Inf)
int.pov.sigma
#6.
n <- 25
xn <- 20/25
c <- qnorm (0.975)
sigma2 <- xn*(1-xn)
interval_poverenja <- c(xn - c*sqrt(sigma2/n), xn + c*sqrt(sigma2/n))
interval_poverenja
#7.
# Domaci