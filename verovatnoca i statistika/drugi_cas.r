#drugi cas
#4. zad monthy hall problem

monty.hall <- function(){
  doors <- c("1","2","3")
  cars <- sample(doors,1) #vrata iza kojih je auto
  pick <- sample(doors,1) #otvara uvek prva ako bi bilo sample (doors)[1], ovako otvara jedna random
  open <- sample(doors [doors!=cars & doors!=pick],1) #otvara vrata iza kojih nije auto, i vrata koja nismo izabrali
  switchyes <- doors[doors!=pick & doors!=open]
  ifelse(cars==switchyes,return(1), return(0))
  
}
sum(replicate(10000,monty.hall()))/10000

#indikator dogadjaja, da li se slucaj realizova ili ne 

indikator <- function (p) {
sample(c(0,1), prob=c(1-p,p),size=100,replace=T)
}
sum(indikator(0.7))

#binomna raspodela, zadatak 5.
# broj pitanja je n=10 broj ponavljanja

pbinom                                                       #pbinom -p=probability (funkcija raspodele )
dbinom                                                       #vraca samo p{X=x} d=density
qbinom                                                       #inverz pbinoma
rbinom                                                       #random raspodelu
#a
sum(dbinom(7:10,10,1/2))
1-pbinom(6,10,1/2)
#b 
1-pbinom(2,10,1/2)


#6 zadatak,R broji neuspehe, ne do prvog uspeha zato ide uvek jedan manji
pgeom #geometrijska raspodela

#a
1-pgeom(4,0.7) #od petog, uvek jedna manja

#b
sum(dgeom(2:6,0.7)) #uvek jedan manji imamo izmedju 3 i 7 pa zato 2 i 6

#7 zadatakaj, pausonova raspodela

1-ppois(1,2)





