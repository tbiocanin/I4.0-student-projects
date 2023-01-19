#domaci zadatak br2. zadatak 6 v)

kosarkas <- function() {
  sim <- 0
  bacanje <- c(1,0)
  broj_pokusaja <- 0
  repeat {
    sim <- sample(bacanje,1,prob=c(0.7,0.3))
    broj_pokusaja <- broj_pokusaja +1
    if (sim[1]==1) break
  }
  if (broj_pokusaja %%2 == 0) return (1)
  else
    return (0)
}

sum(replicate(10000, kosarkas()))/10000
