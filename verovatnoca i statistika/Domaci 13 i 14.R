
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
  else
    return(0)
  
}

sum(replicate(1000,igraStoni(q=0.6)))/1000
    
