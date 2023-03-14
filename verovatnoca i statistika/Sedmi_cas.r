ocene <- function(n, teta){
  x <- runif(n, teta, 0)
  teta1 <- (n+1)/n*min(x)
  teta2 <- 2*mean(x)
  return(c(teta1,teta2))
}
o <- replicate(10000, ocene(100,-2))
hist(o[1,], prob=TRUE, main="Raspodela ocene1", xlab = "x")
hist(o[2,], prob=TRUE, main="Raspodela ocene2", xlab="x")
odstupanje <- function(teta, N, n){
  o <- replicate(N, ocene(n,-2))
  teta1_ocenjeno <- o[1,]
  teta2_ocenjeno <- o[2,]
  return(c(mean((teta1_ocenjeno-teta)^2), mean((teta2_ocenjeno-teta)^2)))
}
n <- 10:100
sk1 <- c()
sk2 <- c()
for(i in 1:length(n)){
  sk1[i] <- odstupanje(-2, 1000, n[i])[1]
  sk2[i] <- odstupanje(-2, 1000, n[i])[2]
}
plot(n, sk1, type="b", col="red", ylim=c(0,max(sk1)), pch=10, ylab ="SK")
plot(n, sk2, type="b", col="blue",pch=10)
