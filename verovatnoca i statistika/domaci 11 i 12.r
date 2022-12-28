#11 zadatak optimize

hi2 <- function(lambda,a,Y){
  r<-length(a)
  n<-sum(Y)
  E<-(pexp(a[3:r],lambda) - pexp(a[2:(r-1)],lambda))*n
  E<-c(n-sum(E),E)
  hi2<-sum((Y-E)^2/E)
  return(hi2)
}


a <- c(0,1,2,3,4,Inf)
Y <- c(42,34,16,8,0)
optimize(f=hi2, c(0,4),tol=0.0001, a=a, Y=Y)$minimum


#4 zadatak napravi lm 

library(PASWR)
head(Kinder)

plot(Kinder$wt, Kinder$ht)

model1 <- lm(Kinder$wt ~ Kinder$ht)
summary(model1)
par(mfrow=c(2,2))
plot(model1)
par(mfrow=c(1,1))

Y= -68.228 + 2.559 * wt #ne znam da li su podaci u metrickom ili imperijskom sistemu
