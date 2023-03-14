options(scipen=999, digits = 4) #scipen = 999 iskljuci scientific notation

#zadatak 1

x <- rexp(1000, rate = 1/2)
y <- exp(-2*x)
mean(y) #1/5 teorijska
var(y) #disperzija 1/9 teorijska

#zadatak 2

x <- rnorm(1000,mean=2, sd=sqrt(2))
y <- 3*x+1
mean(y)
var(y)

#3 zadatak
x <- runif(1000,0,2)
h <- exp(-x*x/2)
2*mean(h)
integral <- 
integrate(integral, lower = 0, upper = 2) #racuna integrale
sqrt(2*pi)*(pnorm(2)-pnorm(0))


#5 zasdatak
1-pnorm(20)
h <- function (t){
  u <- runif(1000,-1/t,0)
  h <- exp(-1/(2*u^2))/sqrt(2*pi)
  return(mean(h)/t)
}

mean(h(20)) #ovo je fi(20)


#6 zadatak
s_n <- function(n) {
  x <- rexp(n, rate =2)
  return(sum(x))
}

s_n(100)

n <- 1000
s <- replicate(10000,s_n(n))
hist(s, probability = T) #prob=T prebacuje visine u verovatnoce i povrsina svega je 1

EX <- 1/2
DX <- 14

s.z <- (s-n*EX)/sqrt(n*DX) #nesto sam okinuo visina ne treba da bude veca od 1
hist(s.z,probability = T)

binom <- function (n, p) {
  x <- sample(c(0,1),n, replace=TRUE, prob=c(1-p.p))
  b<-sum(x)
  return(b)
  
  
}
n <- 250
p<-(0.4) #imaces na sajtu

#7 zad.

2-2*pnorm(1.34)
qnorm(0.9)



















