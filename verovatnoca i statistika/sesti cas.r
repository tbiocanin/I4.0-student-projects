library(MASS)
library(fitdistrplus)
mtcars
boxplot(mtcars$mpg ~ mtcars$am)

x <-rpois(1000,3)
table(x)

Fn <- ecdf(x)
plot(Fn)
curve(ppois(x,3), from = 0, to = 10,add=TRUE, col = "red")

y <- runif(1000)
plot(ecdf(y))
curve(punif(x), from = -1, to = 2, add=TRUE, col = "green")

#zadatak 1

z <- c(0.5, 1.2, 2, 2.5, 3)
plot(ecdf(z))


#zadatak 2
#a) znamo koliko je N, ne znamo p

x <- rbinom(100,10,1/3)
p_ocena <- 1/10*mean(x)

#b) na papiru je 

#v) domaci

#g)

p <- 1/3 
x<- runif(100)
for (i in 1:100){
  if(x[i]<1/6) y[i] <- -1
  else if(x[i] >1/3) y[i]<- 0
  else y[i] <- 0
}


#drugi nacin
y <- rep(0,100)
y[x<1/6] <- -1
y[x>1/3] <- 1

  
  

    
    
    
    
    
    
  

