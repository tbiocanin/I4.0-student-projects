
#7) zadatak 8-cas

simulacija <- function(n,beta,k){
  brojac = 0
  podaci <- replicate(k,rnorm(20,3,1))
  for (i in 1:k) {
    xn = mean(podaci[1:20,i])
    sn2 = var(podaci[1:20,i])
    c <- qt((1+beta)/2,19)
    interval_poverenja <- c(xn -c*sqrt(sn2/n),xn +c*sqrt(sn2/n))
    if (findInterval(3,interval_poverenja)==1){
      brojac = brojac +1
    }
  }
  return(brojac)
}
simulacija(20,0.93,10000)/10000


#5) zadatak 9-cas

A <- c(200,220,320,450,500,550,550,550,600,670,700,1000,1200,1200)
B <-c(230,230,300,300,300,400,450,450,500,500,500,800,800,800,1000,1000,1000,1500,1500,1500,1500)

#prvo testiramo hipotezu o jednakosti disperzija
alfa <- 0.05
sn1 <- var(A)
sn2 <- var(B)
n1 <- length(A)
n2 <- length(B)

c1 <- qf((1/2)*alfa,n1-1,n2-1)    #trazimo levu granicu fiserove raspodele
c2 <- qf(1-(1/2)*alfa,n1-1,n2-1)  #trazimo desnu granicu fiserove raspodele
W <- c(c1,c2)                     #kriticna oblast
TN <- (sn1)/(sn2)                 #ako TN upadne izmedju c1 i c2 upada u kriticnu oblast
TN < c1 | TN > c2                 #ako je true onda upada u kriticnu oblast i odbacujemo H0 tj. nama je FALSE pa su disperzije jednake

TN1 <- (mean(A) - mean(B))/(sqrt(sn1/length(A) + sn2/length(B)))    #ako upadne u kriticnu oblast odbacujemo H0, tj da su prosecne plate jednake
Q <- (sn1/length(A) + sn2/length(B))^2/((sn1/length(A))^2/(length(A)-1)+(sn2/length(B))^2/(length(B)-1))  #stepeni slobode
c <- qt((1/2)*alfa,Q)
abs(TN1) < c                      #ne upada u kriticnu oblast. Prosecne plate su jednake, tj ne odbacujemo H0
