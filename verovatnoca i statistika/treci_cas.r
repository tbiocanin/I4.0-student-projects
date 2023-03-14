#treci cas

#srednja vrednost u Ru je mean(x) - x je vektor podataka (visina itd...), je ocena teorijske E(X)
#D(x) disperzija je ocekivanje od E(X-EX)^2
#ocena disperzije tj disperzija je var(x)

#1 zadatak
mean(rgeom(1000,0.3))  #ovo je E(x) 1000 puta smo ponovili sa verovatnocom 0.3, on gleda za 1 manji, i brojeve koje ispise su brojevi 
                       # do uspeha BEZ uspeha; GEOMETRIJSKI NIZ JE DO USPEHA
mean(rgeom(1000,0.3))+1  # ovo je E(Y) ovo je sa uspehom


#2 zadatak

skup <- function(n) {
  prvi_broj <- sample(1:n, size = 2, replace = FALSE)     #po defaultu je false
  drugi_broj <- max(prvi_broj)                            #biramo 2 broja ; size = 2, max(prvi_broj) bira veci od ta 2 
  return (drugi_broj)
}
mean(replicate(1000,skup(100)))

#3 zadatak

1-pbinom(5,100,0.02)     #suprotan slucaj od dbinom, 5 je br defektnij (1 manji je samo za geometrijski), 100 ponavljanja, tj 
                          #100 artikla sa vrv 0.02

mean(rbinom(1000,100,0.02)) #EX rbinom random je 1 defektan, u 1000 ponavljanja u 100 clanova sa vrv od 0.02

#4 zadatak DOMACI odrediti == na papiru; BINOMNA RASPODELA

#primer u svesci

1-punif(1.5,1,3)    #1 i 3 su min i max 

punif(2,1,3) - punif(1,1,3)

#5 zadatak Y deo je za domaci

x <- rexp(1000,2)
z <- 1-exp(-2*x)
mean(z>1/2)





