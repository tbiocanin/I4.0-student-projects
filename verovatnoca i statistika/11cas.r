#1.
x <- c(13, 12.5, 13.5, 14.2, 11.5, 12.5, 15, 15.5, 13.5, 13, 16, 15.5, 13.7, 12, 14.5)
(T.hat <- sum(x>14))  # broj elemenata koji su veci od 14
(n <- length(x)) # obim uzorka 
(C <- qbinom(0.05,15,1/2))
T.hat <- C
(p.hat <- pbinom(6, n, 0.5)) # p-vrednost veca od 0.05, pa prihvatamo H0
library(BSDA)
SIGN.test(x, md=14, alternative = "less")


#2.
x <- c(4.4, 3.9, 5.2, 4.6, 4.3, 3.6, 4.4)
y <- c(3.4, 3.2, 2.2, 2.8, 3.1, 2.6, 3.2)
d <- x-y
sum(d>0)
qbinom(size = 7,p = 1/2,prob = 0.9)
SIGN.test(x,y,md=0,alternative = "greater")
SIGN.test(d,md=0,alternative = "greater")
# odbacujemo H0


#3. 
x <- c(4.19, 2.86, 3.93, 4.64, 6.22, 1.99, 3.52, 4.41, 3.89, 4.54, 3.86, 1.62)
# test znakova
SIGN.test(x, md = 2, alternative = "two.sided")
# wilcox test 
wilcox.test(x, mu = 2)


#4. dva uzorka
A <- c(1.5, 1.4, 1.4, 1, 1.1, 0.9, 1.3, 1.2, 1.1, 0.9, 0.7, 1.8)
B <- c(2, 1.8, 0.7, 1.3, 1.2, 1.5, 1.1, 0.9, 1.5, 1.7, 0.9, 0.9)
# test znakova
SIGN.test(A-B, md = 0, alternative = "less")
# test rankova
wilcox.test(A-B,mu = 0, alternative = "less")
# velika p-vrednost, pa prihvatamo H0


#5.
x <- cars$speed
#Kolmogorov Smirnov
ks.test(x, "pnorm", mean = 15, sd = 5)
# prihvatamo H0
# Kramer fon Mizes
library(goftest)
cvm.test(x, "pnorm", mean = 15, sd = 5)
# prihvatamo H0
# Andersen-Darling
ad.test(x, "pnorm", mean = 15, sd = 5)
# prihvatamo H0


#6.
x <- c(10,30,50,70,90)   # sredine intervala
F0 <- punif(x, min = 0, max = 100)  
Fnx <- 1/50*c(1,6,16.5,31.5,45)   # empirijska funkcija raspodele u sredinama intervala
Fnx_ <- c(0,Fnx[-5])              # empirijska funkcija raspodele levo od sredine intervala,
# obe izracunate sa pretpostavkom da je pola elemenata bilo pre sredine a pola posle
dn <- c(abs(F0-Fnx),abs(F0-Fnx_))   # apsolutne razlike
(Dn <- max(dn))      
Dn > 0.226 # iz tablica Kolmogorove raspodele
#  odbacujemo nultu hipotezu


#7.
uzorak <- c( 0.02 ,0.45, 1.32, 2.89, 2.86, 0.25, 0.10, 1.01, 0.21, 0.13, 0.37, 0.79, 0.34, 0.64, 0.18, 0.23, 0.00, 0.22, 0.60, 0.04)
lambda.hat <- round(1/mean(uzorak),2)  # zaokruzujem na dve decimalne 
ks.test(uzorak, "pexp", lambda.hat)
# privatamo H0


#8.
# Treba da testiramo da li kockica ima diskretnu ravnomernu raspodelu, odnosno da li je verovatnoca za svaki od brojeva 1,2,3,4,5,6 jednaka 1/6.
# Prvo simuliramo bacanje kockice da dobijemo neki uzorak. Pravimo uzorak kockice koja jeste homogena
set.seed(9)
x <- sample(6, 60, replace = T)  # uzorak od 60 ishoda bacanja kokcice
x
M <- table(x)   # broj elemenata po kategorijama 
M
r <- length(M) # broj kategorija
# Svaka od verovatnoca je pk=1/6, pa su vrednosti npk:
np <- length(x)*1/6
np   
chi.0 <- sum((M-np) ^ 2 / np)  # vrednost statistike chi0
#  Raspisite ovu sumu na papiru!
alpha <- 0.05  # nivo znacajnosti
c <- qchisq(1 - alpha, df = r - 1)  # kvantil chi kvadrat raspodele 
chi.0 > c 
# prihvamo H0
# Drugi nacin
chisq.test(c(12,9,16,6,7,10), p=rep(1/6,6)) # zavisi od simulacije
# p-vrednost je 0.25>0.05 pa se prihvata H0
1-pchisq(6.6, 5) # p vrednost


# 9. 
M <- c(23, 26, 23, 28) # broj elemenata po kategorijama (Mk)
r <- 4                 # broj kategorija
np <- 1/4*sum(M)   # obim uzorka je zbir svih elemanta 
np
chi.0 <- sum((M - np) ^ 2 / np)
chi.0
alpha <- 0.02
c1 <- qchisq(1 - alpha, r - 1)
c1
chi.0 > c1
# ne odbacujemo H0
p <- 1 - pchisq(chi.0, r - 1) # p- vrednost testa 
p < alpha
# Drugi nacin 
chisq.test(c(23,26,23,28), p=rep(1/4,4))
# p vrednost je > 0.02 pa prihvatamo H0


#10.
M <- c(45,30,15,6,2,2,0)
N <- sum(M)
# Racunamo verovatnoce pk
pk <- c(dgeom(0:5, 0.5), 1 - sum(dgeom(0:5, 0.5))) # podsetite se funkcije dgeom() 
N*pk
# Spajamo poslednje 3 kategorije, zbog uslova Npk>5
M <- c(45,30,15,6,4)
pk <- c(pk[1:4],sum(pk[5:7]))
pk
np <- N*pk
chi.0 <- sum((M-np)^2/np)
chi.0
alpha <- 0.05
c1 <- qchisq(1-alpha,5-1)
c1
chi.0 > c1 
# prihvatamo H0


#11.
M <- c(42,34,16,8)   # broj elemenata po kategorijama
N <- sum(M)          # obim uzorka
x.sr <- sum(c(0.5,1.5,2.5,3.5)*M)/N  # srednja vrednost
lambda.hat <- 1/x.sr                 # ocena za lambda
lambda.hat
pk <- pexp(1:4,lambda.hat)-pexp(0:3,lambda.hat)  # pexp je funkcija raspodele za E(lambda)
pk
pk <- c(pk,1-sum(pk))     #
pk
M <- c(M,0)    # dodajemo nulu za poslednju kategoriju
np <- N*pk
np
# Imamo jedan ocenjeni parametar i 5 kategorija, pa je br stepeni slobode 5-1-1=3
alpha <- 0.01
c1 <- qchisq(1-alpha, 5-1-1)  # kvantil hi kvadrat raspodele
c1
chi.0 <- sum((M - np) ^ 2 / np)  # realizovana vrednost test statistike
chi.0 > c1                       # provera da li upada u kriticnu oblast
# Upada pa se odbacuje se nulta hipoteza, odnosno X nema eksponencijalnu raspodelu
##### Modifikacija resenja:
# Smatra se korektnijom procedura nalazenja vrednosti parametra za koji se test statistika minimizira, 
# te testiranje saglasnosti sa raspodelom koja ima bas tu vrednost parametra. 
# To se u R-u sprovodi koristenjem funkcije optim 

#?????

# 12.
podaci <- c(23,7,18,13)
podaci <- matrix(podaci, ncol = 2, byrow = TRUE)
podaci
chisq.test(podaci)
#### ?????