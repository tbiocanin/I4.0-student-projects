#10. zadatak: Simulirati bacanje regularne kockice za igru. 
#Izracunati frekvenciju pojavljivanja 6 u 1000 izvodjenja 
#eksperimenta, kao i frekvenciju pojavljivanja brojeva 
#manjih od 5 u 1000 izvodjenja eksperimenta

kockica <- c(1:6)
s1 <- sample(kockica,size=1000,replace = T)
sum(s1==6)
sum(s1<5)


#11. kockica za igru je napravljenja da je verovatnoca padanja nekog broja proporcionalna kolicini
# tackica na toj strani. Odrediti verovatnocu da padne paran broj.

s2 <- sample(kockica,size=1000,replace = T, prob = 1:6/21)
sum(s2%%2==0)/length(s2)


#12. Dat je falican novcic, gde je verovatnoca da padne pismo p>0.5. Osmisliti fer igru sa dva igraca, 
#tj. igru u kojoj je jednako verovatno da pobedi svaki od igraca. Proveriti eksperimentalno da li je igra fer

coin <- c("Heads","Tails")
igra <- function(p) {
  sim <- sample(coin, size = 2, replace = T, prob=c(p, 1-p))
  if (sim[1]=="Heads" & sim[2]=="Tails") return(1)
  else if (sim[1]=="Tails"& sim[2]=="Heads") return(2)
  else 
    return(0)
  
}

sum(replicate(1000, igra(p=0.6))==1)
sum(replicate(1000, igra(p=0.6))==2)

#13. Na turniru treba odigrati tri partije stonog tenisa protiv sampiona A i nesto slabijeg igraca B po jednoj 
# od sema A-B-A ili B-A-B. Nagrada se dobija ako se pobedi u bar dve partije uzastopno. Koju semu izabrati?

#Sema A-B-A
igracA <- c("Loss", "Win")
igracB <- c("Loss", "Win")
igraStoni <- function(q) {
  simStoniA <- sample(igracA,size = 1,replace=T, prob=c(q,1-q))
  simStoniB <- sample(igracB,size=1,replace=T, prob=c(0.6,0.4))
  simStoniC <- sample(igracA, size =1,replace=T, prob=c(q,1-q))
  if (simStoniA[1]=="Win" & simStoniB[1]=="Win") return(1)
  else if (simStoniA[1]=="Loss" & simStoniB[1]=="Win" & simStoniC[1]=="Win") return(1)
  else if (simStoniA[1]=="Win" & simStoniB[1]=="Loss" & simStoniC[1]=="Win") return(1)
  else
    return(0)
    
}
sum(replicate(1000,igraStoni(q=0.9)))/1000

#Sema B-A-B
igracA <- c("Loss", "Win")
igracB <- c("Loss", "Win")
igraStoni <- function(q) {
  simStoniA <- sample(igracA,size = 1,replace=T, prob=c(q,1-q))
  simStoniB <- sample(igracB,size=1,replace=T, prob=c(0.9,0.1))
  simStoniC <- sample(igracA, size =1,replace=T, prob=c(q,1-q))
  if (simStoniA[1]=="Win" & simStoniB[1]=="Win") return(1)
  else if (simStoniA[1]=="Loss" & simStoniB[1]=="Win" & simStoniC[1]=="Win") return(1)
  else if (simStoniA[1]=="Win" & simStoniB[1]=="Loss" & simStoniC[1]=="Win") return(1)
  else
    return(0)
  
}

sum(replicate(1000,igraStoni(q=0.6)))/1000
    
