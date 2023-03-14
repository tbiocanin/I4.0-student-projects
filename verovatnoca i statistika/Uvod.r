2+2


3+6 # SABIRANJE 
(x <- 9)
x<- T 
v <- c(2,3,4,4)
v
1:1000
v[3]
sum(v)
sum(v,na.rm=T)
x <- 1:10
x
sample(x)

coin <- c("Heads", "Tails")
sim <- sample(coin,size = 100,replace = T, prob=c(1/3,2/3))
sum(sim=="Heads")

# 10. 
s <- sample(1:6,size = 1000,replace = T)
sum(s==6)/1000
sum(s<5)/1000
# 11.
s1 <- sample(1:6, size =  1000, replace = T, prob = 1:6/21)
sum(s1%%2==0)/length(s1)
#12.
igra <- function(p){
  sim <- sample(c("G", "P"), replace = T, prob=c(p,1-p),size = 2)
  if (sim[1]=="G" & sim[2]=="P") return(1)
  else if (sim[1]=="P" & sim[2]=="G") return(2)
  else
    return(0)
}
sum(replicate(1000,igra(p=0.9))==1)
sum(replicate(1000,igra(p=0.9))==2)

