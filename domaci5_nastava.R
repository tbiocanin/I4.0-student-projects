#n je argument za vektor

uzoracka_sredina <- function(n) {
  
  zbir <- 0
  for (i in n){
    
    zbir <- zbir + i
    
  }
  
  return (zbir/length(n))
  
}

medijana <- function(n){
  
  if(length(n) %% 2 == 0){
    
    return (n[length(n) / 2])
    
  }
  
  else {
    
    prvi_clas <- n[(length(n) - 1) / 2]
    drugi_clan <- n[(length(n) - 1) / 2]
    
    return ((prvi_clas + drugi_clan)/2.0)
  }
  
  return (0)
}

moda <- function(n){
  
  max_brojac <- 0
  index <- 1
  
  for (i in n){
    
    brojac <- 0
    for (k in n) {
      
    
     if(k == i){
        brojac <- brojac + 1
        
      }
    }
    brojac <- brojac - 1 #jer smo racunali svaki put u petlji jednakost istog elementa
    
    if(brojac > max_brojac){
      max_brojac <- brojac
      index <- i
    }
    
    
  }
  
  return (n[index])
}



