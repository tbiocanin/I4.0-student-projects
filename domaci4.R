


pijanica <- function(p){
  
korak <- 1      #korak od ivice
lista_koraka <- 1   #lista koja cuva vrednosti za plot
brojac <- 0   #ne zelimo da petlja nema kraja pa ubacujem brojac

while (korak != 0 && brojac < 100){
  
  sledeci_korak <- sample(c(-1,1),size = 1,replace=T, prob=c(p,1-p))
  korak <- korak + sledeci_korak
  lista_koraka <- c(lista_koraka, korak)
  brojac <- brojac + 1
}
  
  return (lista_koraka)
}

#a)

#p je proizvoljan verovatnoca
p <- 0.5
hod_pijanice <- pijanica(p)
plot(1:length(hod_pijanice), hod_pijanice ,type = "l", xlab="Broj koraka", ylab= "Rastojanje od ivice")
abline(h = 0, col = "red")



#b)

#vrlo slicna f-ja prosloj, samo sto ova vraca 1 ukoliko je pijanica pao
#pre 20 koraka
verovatnoca_pijanice_20 <- function(p){
  
  broj_koraka <- 0
  korak <- 1
  while (broj_koraka < 21){
    sledeci_korak <- sample(c(-1,1),size = 1,replace=T, prob=c(p,1-p))
    korak <- korak + sledeci_korak
    broj_koraka <- broj_koraka + 1
    if(korak == 0){
      return (1)
    }
    
  }
  return (0)
}

ocene <- 0
for(x in 1:9){
  
  p <- x/10
  #verovatnoca suprotnog dogadjaja shodno prethodnoj funkciji
  ocena <- sum(replicate(1000,1 - verovatnoca_pijanice_20(p)))/1000 
  ocene <- c(ocene, ocena)
}

konacna_ocena <- sum(ocene)/9
print(konacna_ocena)


