# DOMACI SA PREDAVANJA
bacanje_kamena_u_vodu <- function(beta,n){
  razdaljina <- rnorm(n,10)                     #generisemo broj bacanja kamena u vodu sa standardnom raspodelom (n,10)
  Xn <- mean(razdaljina)                        #srednja vrednost tj. Xn nadvuceno
  sigma <- 10                                   #sigma, tj koren od disperzije
  Ln <- Xn - (qnorm((1+beta)/2))*sigma/sqrt(n)    #leva granica intervala
  Un <- Xn + (qnorm((1+beta)/2))*sigma/sqrt(n)    #desna granica intervala
  interval <- c(Ln,Un)
  
  brojac <- 0
  
  for(i in 1:n){
    if (razdaljina[i] > Ln) {
      if (razdaljina[i] < Un) {
        brojac <- brojac + 1
      }
    }
  }
  print(interval)     #interval
  return(brojac/n)    #verovatnoca da nam se broj nasao u intervalu za zadato p i n
}
p=0.1
p=0.3
p=0.5
p=0.7
p=0.9

n=10
n=20
n=30
n=40
n=50
n=100

bacanje_kamena_u_vodu(p,n)

################
#DOMACI SA VEZBI

ocena <- function(n, p){
  p1 <- (n-(sum(rbinom(1,n,p))))/(2*n)
  return(p1)
}
ocena(100,1/2)

o <- replicate(10000, ocena(100,1/2))
hist(o, prob=TRUE, main="Raspodela ocene", xlab = "x")

odstupanje <- function(p, N, n){
  p1_ocenjeno <- replicate(N, ocena(n,1/2))
  return(mean(p1_ocenjeno-p)^2)
}
odstupanje(1/2,1000,100)

n <- 10:100
sk1 <- c()
for(i in 1:length(n)){
  sk1[i] <- odstupanje(1/2, 1000, n[i])
}
plot(n, sk1, type="b", col="red", ylim=c(0,max(sk1)), pch=10, ylab ="SK")

