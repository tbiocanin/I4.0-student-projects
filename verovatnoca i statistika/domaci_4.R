#pijanica
library(Rlab)

pijanica <- function(p){
  sim <- 1
  korak <- c(1,-1) #1 - korak od litice ; -1 korak ka litici
  broj_koraka <- 0
  repeat {
    sim <- sim + sample(korak,1,prob=c(p,1-p))
    broj_koraka <- broj_koraka +1
    if (sim < 1) {
      return (1)
    } else if (broj_koraka > 20 & sim>1) { #ako vrati 0, pijanica je preziveo posle 20 koraka
      return (0)
    }
  }
}
pijanica(0.7)
sum(replicate(1000,pijanica(0.7)))/1000 #verovatnoca da ce pijanica pasti sa litice



#simulacija kretanja pijanice ; crvema linija = litica
korak <- c(1,-1)
litica <- sample(korak, size = 20, replace = TRUE, prob=c(0.7,0.3))
plot(cumsum(litica), type = "l",
     ylim = c(-1,20), xlab = "Broj koraka", ylab = "Broj koraka ka i od litice")
abline(h = 0, col = "red") "litica"

#sa instaliranjem library (Rlab) za binomnu fiju

pijanica_v2 <- function (n){
  korak_od_litice <- rbern(n, prob = 0.7)
  return(sum(korak_od_litice))
  
}
pijanica_v2(20)

broj_koraka<- replicate(10000,pijanica_v2(20))
hist(broj_koraka, probability = T)

#ili

pijanica_v3 <- function(n,p){
  x <- sample(c(1,0), n , replace = TRUE, prob = c(p, 1-p))
  y <- sum(x)
  return(y)
}

n <- 20
p <- 0.7
uzorak <- replicate(10000, binom(n, p))

x <- 0:20
plot(x, dbinom(x, size = 20, prob = 0.7), type = "h", main = "Binomna raspodela B(20, 0.7)", xlab = "x", ylab = "binomne verovatnoce")


#zadatak 4 domaci

x <- rexp(1000,6)
h <- x^3*log(x)
1/6*mean(h)
