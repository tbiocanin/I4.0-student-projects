#peti domaci

#uzoracka sredina
vektor_brojeva <- c(0.5,1,2,3,3.5,4,4.5,6,6,28,28,28,32,100,102,103)

uzoracka_sredina_funkcija <- function(){
  uzoracka_sredina <- sum(vektor_brojeva)/length(vektor_brojeva)
  print(uzoracka_sredina)
}
uzoracka_sredina_funkcija()
mean(vektor_brojeva) #provera


medijan_funkcija <- function(){
  sredina <- length(vektor_brojeva)/2
  medijan <- (vektor_brojeva[sredina]+vektor_brojeva[sredina+1])/2
  print(medijan)
}
medijan_funkcija()
median(vektor_brojeva) #provera



unikat <-  unique(vektor_brojeva) #vraca vektor bez duplikata
match(vektor_brojeva,unikat) # vraca indekse uzastopno vecih brojeva, gde su duplikati takodje duplikati u ovom vektoru
tabulate(match(vektor_brojeva,unikat)) #broj ponavljanja brojeva u prethodnom vektoru
which.max(tabulate(match(vektor_brojeva,unikat))) #indeks broja koji se ponavlja najvise puta
unikat[which.max(tabulate(match(vektor_brojeva,unikat)))] #ubacujemo indeks u nas vektor bez duplikata

moda <- function(){
  unikat_2 <- unique(vektor_brojeva)
  unikat_2[which.max(tabulate(match(vektor_brojeva,unikat)))]
}
moda()

#nisam imao ideju kako sam da uradim pa sam nasao objasnjen primer na internetu




set.seed(100)
uzorak_1000 <- rexp(1000)

uzorak_20 <- sample(uzorak_1000,20)
uzorak_50 <- sample(uzorak_1000,50)
uzorak_100 <- sample(uzorak_1000,100)

mean(uzorak_20)
mean(uzorak_50)
mean(uzorak_100)

hist(uzorak_50, main = "Histogram apsolutnih frekvencija", col = "lightblue")
hist(uzorak_50, prob=T, main = "Histogram relativnih frekvencija (gustina)", col = "turquoise")  

hist(uzorak_100, main = "Histogram apsolutnih frekvencija", col = "lightblue")
hist(uzorak_100, prob=T, main = "Histogram relativnih frekvencija (gustina)", col = "turquoise") 

hist(uzorak_20, main = "Histogram apsolutnih frekvencija", col = "lightblue")
hist(uzorak_20, prob=T, main = "Histogram relativnih frekvencija (gustina)", col = "turquoise")  

iris
iris[iris$Petal.Length > 5, ] #logicki vektor koji vraca samo za ispunjen uslov, u nasem slucaj petal length > 5 
iris[iris$Petal.Width < 2, ]

sum(tabulate(iris[3][iris$Petal.Length >5, ])) #ima ovaj br cveca sa petal.length >5 
sum(tabulate(iris[4][iris$Petal.Width < 2, ])) #ima ovaj br cveca sa petal.width <2 


srednja_verdnost_sepal <- sum(iris[2])/nrow(iris[2]) #prosecna vrednost sepal.width

Above_average <- iris$Sepal.Width < srednja_verdnost_sepal #napravili smo vektor sa true/false kad je sepal veci od srednje vrednosti
cbind(iris, Above_average) #napravili smo novu kolonu koja kaze da l je sepal width veci od srednje vrednosti

