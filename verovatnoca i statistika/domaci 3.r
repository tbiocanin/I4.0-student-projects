#zadatak 4 prvi nacin

igra <- function(){
  igrac_A <- c(1,0)
  broj_pogodaka_A <- sample(igrac_A, 3, replace=TRUE, prob=c(0.7,0.3))
  broj_pogodaka_B <- sample(igrac_A, 3, replace=TRUE, prob=c(0.6,0.4))
  ukupni_pogodci <- sum(broj_pogodaka_A + broj_pogodaka_B)
  return(ukupni_pogodci)
    
}

mean(replicate(1000,igra()))

#zadatak 4 drugi nacin 

mean(rbinom(1000,3,0.7)+rbinom(1000,3,0.6))


#5 zadatak Y deo je za domaci

x <- rexp(1000,2)
z <- 1-exp(-2*x)
mean(z>1/2)
y <- abs(1-x)
mean(y>1)
