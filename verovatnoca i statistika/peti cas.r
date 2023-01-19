#peti cas


brojevi <- 1:12
slova <- letters[1:12]
d <- data.frame(brojevi,slova)  #pravimo matricu sa ovim podacima
d

d1 <- data.frame(br=brojevi, sl=slova)  #imenujemo kolone
d1

d1$br    #pristupamo koloni iz baze d1

d[1,2]    #1 - red ; 2 - kolona 
d$brojevi[1]  #drugi nacin kad direktno uzimamo iz kolone
d[1, ] #celu kolonu
d[ , 1] #ceo red


d[d$brojevi<10, ] #logicki vektor koji vraca samo za ispunjen uslov

sleep             #ugradjena baza podataka

cbind(sleep, seq(20,1,-1))   #cbind prilepili smo jednu kolonu od 20 do 1


InsectSprays

data(InsectSprays)
summary(InsectSprays)     #sumarna statistika
head(InsectSprays)        #vrati prvih 6 elemenata baze, da bi videli imena headera


par(mfrow = c(1,2)) # platno se deli na jednu vrstu i dve kolone (dva grafika jedan pored drugog)
x<- c(2,51,2,42)
y<- c(1,2,6,8)

plot(x,y)
plot(y,x)

x1 <- rnorm(20) #  Grafici uzorka normalne raspodele
par(mfrow = c(2,2)) 
plot(x1, type = "p", main = "points", ylab = "y-osa", xlab = "x-osa", col = "red")
plot(x1, type = "l", main = "lines", ylab = "y-osa", xlab = "x-osa", col = "orange")
plot(x1, type = "b", main = "both", ylab = "y-osa", xlab = "x-osa", col = "blue")
plot(x1, type = "o", main = "both overplot", ylab = "y-osa", xlab = "x-osa", col = "green")



mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)
summary(mtcars)


table(mtcars$carb)
table(mtcars$am, mtcars$cyl)
table(mtcars$carb, mtcars$cyl)


barplot(table(mtcars$carb), col = "deepskyblue", main = "Broj karburatora")



#Zadatak 1 sa sajta

hist(replicate(1000,mean(rexp(20, rate=1))), prob=T)    #br uzoraka je 20
curve(dnorm(x,mean=1,sd=1/sqrt(20)),lwd=2,add=T,col="purple")          #menjaj samo sd

hist(replicate(1000,mean(rexp(50, rate=1))), prob=T)    #br uzoraka je 50

hist(replicate(1000,mean(rexp(100, rate=1))), prob=T)    #br uzoraka je 100

#lici na normalnu raspodelu 












