# simuliranje bacanja novcica
coin <- c("Heads", "Tales")
sim <- sample(c("Heads", "Tales"), size = 100, replace = T, prob=c(1/3, 2/3))
sim
sum(sim=="Heads")/1000
sum(sim=="Tales")/1000
# simuliranje bacanje kockice za igru
kockica <- 1:6
sim_kockica <- sample(kockica, size=100, replace = T)
sum(sim_kockica == 6)/1000
sum(sim_kockica<5)/1000
# kockica, opet, ali je verovatnoca nekog broja proporcionalna broju tacaka
sim_kockica2 <- sample(kockica, size = 100, replace = T, prob = (1:6)/21)
sum(sim_kockica2 %% 2 == 0)/1000
# 12. fer igra, p > 0.5
fer_igra <- function(p) {
  
  sim <- sample(c("G", "P"), replace = T, prob = c(1-p, p), size = 2)
  if(sim[1]=="G" & sim[2] == "P")
    return(1)
  else if (sim[1] == "P" & sim[2] == "G")
    return(2)
  else 
    return(0)
}
sum(replicate(1000, fer_igra(p=0.6))==1)
sum(replicate(1000, fer_igra(p=0.6))==2)

#druga nedelja, zadaci
#1. kockica
kocke <- function(n) {
  brojac1 = 0;
  brojac2 = 0;
  sim1 = sample(1:6, replace = T)
  sim2 = sample(1:6, replace = T)
  
  for(i in 1:6){
    if(sim1[i] + sim2[i] <= 4){
      brojac2 = brojac2 + 1
      if((sim1[i]+sim2[i]) %% 2 == 1){
        brojac1 = brojac1 + 1
      }
    }
  }
  return(brojac1/brojac2)
}

sum(replicate(1000, kocke(2)), na.rm = T)/1000

#5 zadatak
sum(dbinom(7:10,10,1/2))
1-pbinom(6,10,1/2)
1-dbinom(6,10,1/2)
1-pbinom(2,10,1/2)
#treca nedelja
kosarkas3 <- function(n) {
  return(mean(rgeom(n, prob=0.3)))
}
kosarkas3(1000) + 1
kosarkas3(1000)
#drugi zadatak
ocekivanje <- function(n){
  sim = sample(1:n, size = 2)
  return(max(sim))
}
mean(replicate(1000, ocekivanje(100)))


#peti zadatak
x <- rexp(100, 2)
z <- 1 - exp(-2*x)
y <- abs(1-x)
mean(z>1/2)
mean(y>1)
#cetvrti zadatak
mean(rbinom(1000, 3, 0.7) + rbinom(1000, 3, 0.6))
#sesti zadatak
b_stanica <- function() {
  dolasci <- 0
  benzin <- 0
  
  while(sum(dolasci) < 8) {
    dolasci <- c(dolasci, rexp(n=1, rate = 4))
    benzin <- c(benzin, runif(1, 10, 70))
  }
  
  return(rbind(cumsum(dolasci), benzin))
}

b_stanica()
mean(replicate(1000, length(b_stanica()/8)))
mean(replicate(1000, sum(b_stanica()[2, ])/8 * 1.7))
mean(replicate(1000, sum(b_stanica()[2, ])/8 > 150))
#cetvrta nedelja

#3. 
x = runif(1000, 0, 2)
h = exp(-x^2/2)
2*mean(h)
integrate(h)

x2 = rexp(1000, rate = 6)
h2 = x2^3 * log(x)
mean(h2)

x <- rexp(1000, rate = 0.5)
y = exp(-2*x)
mean(y)
var(y)
#sesti zadatak
Sn <- function(n) {
  
  return(sum(rexp(n, 2)))
}

s = replicate(1000, Sn(1000))
hist(s, prob=T)