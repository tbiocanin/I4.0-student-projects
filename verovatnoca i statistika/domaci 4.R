#pijanica

pijanica <- function(p){
  sim <- 1
  korak <- c(1,-1)
  broj_koraka <- 0
  repeat {
    sim <- sim + sample(korak,1,prob=c(p,1-p))
    broj_koraka <- broj_koraka +1
    if (sim < 1) {
      return (1)
    } else if (broj_koraka > 20 & sim>1) {
      return (0)
    }
  }
}
pijanica(0.4)
sum(replicate(1000,pijanica(0.9)))/1000


#zadatak 4 domaci

x <- rexp(1000,6)
h <- x^3*log(x)
1/6*mean(h)



