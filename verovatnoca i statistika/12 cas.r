
#predavanje

library(SenSrivastava)
attach(E1.1)
model <- lm(SPEED~DENSITY, data = E1.1)
model

plot(E1.1)
abline(model)
hist(E1.1)

summary(model) #estimate - ocene parametara, density- ocena beta 1         p-vrednost - vrednost p testa, Pr - vrednost tog testa

par(mfrow=c(2,2))
plot(model)


#1
# broj sati ucenja
x <- c(4,9, 10, 14, 4, 7, 12, 22, 1, 3, 8, 11, 5, 6, 10, 11, 16, 13, 13, 10)
# rezultati testa.
y <- c(390, 580, 650, 730, 410, 530, 600, 790, 350, 400, 590, 640,450, 520, 690, 690, 770, 700, 730, 640)
model <- lm(y~x)
summary(model)
plot(x, y)
# regresiona prava
a <- 25.326
b <- 353.165
abline(b,a, col="red")
abline(model)
reziduali <- model$residuals # zelimo da ovo pripada nekoj normalnoj raspodeli.
hist(reziduali, probability = T)
353.165+25.326*15 # predvidjanje
par(mfrow=c(2,2))
plot(model)
par(mfrow=c(1,1))

# 2.
obim <- c(30, 87, 129, 148, 168, 174, 177)
starost <- c(177, 484, 664, 1004, 1231, 1372, 1582)
plot(starost, obim)
model2 <- lm(obim~starost)
summary(model2)
par(mfrow=c(2,2))
plot(model2)
par(mfrow=c(1,1))
model3 <- lm(obim ~ log(starost)) 
summary(model3)
par(mfrow=c(2,2))
plot(model3)
par(mfrow=c(1,1))
plot(starost, obim)
abline(model2)
lines(starost, -336.417 + 70.317*log(starost), col = "blue")
curve(-336.417 + 70.317*log(x),add=T,col="red")

#3.
set.seed(12)
x <- runif(20,0,4)
eps <- rnorm(20,0,0.5)  #epsilon tj reziduali
y <- 2*x+eps
# dodajemo autlajere
y1 <- c(y,-1)
x1 <- c(x,3)
y2 <- c(y,-1)
x2 <- c(x,1)
plot(x, y, pch=16, ylim=c(-1.5,7))  #pch=16 oblik tacaka
points(3,-1, pch=15, col='red')
points(1.5,-1, pch=8, col='blue')
model <- lm(y~x)  #samo crne tacke
abline(model)
model1 <- lm(y1~x1)   #model kad su ukljucene crne i crvena, vidimo da je crveni outlijer pravi outlier 
abline(model1, lty=3)
model2 <- lm(y2~x2)   #model kad su ukljucene crne i plava
abline(model2, lty=5)   #lty je line type
plot(model, which = 5)
plot(model1, which = 5)
plot(model2, which = 5)
#4.


# ??????


#5.
podaci <- read.csv("D:/R.studio/Verovatnoca.i.statistika/podaci12ned.txt", sep="")
attach(podaci12ned)
pol <- factor(podaci12ned$Pol)
plot(Stat ~ Mat, pch = 16)
boxplot(Stat~pol)
model <- lm(Stat~pol+Mat)
summary(model)  #pol ne utice na poene iz statistike pa ga izbacujemo
par(mfrow=c(2,2))
plot(model)
model1 <- lm(Stat~Mat)
summary(model1)
anova(model1,model) #vidimo da je p vrednost velika prilikom uporedjivanja modela, tkd uzimamo prvi

#6.
head(stackloss)
attach(stackloss)
vmodel1 <- lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.)
summary(vmodel1)
vmodel2 <- lm(stack.loss ~ Air.Flow + Water.Temp)
summary(vmodel2)
anova(vmodel1, vmodel2) #Acid.Conc.ne utice na stack.loss, nije bitan redosled modela (vmodel1, vmodel2), nulta hipoteza je 
#da se bira JEDNOSTAVNIJI model tj onaj sa manje parametara
# predvidjanje
newdata <- data.frame(Air.Flow=72, Water.Temp=20)
newdata1 <- data.frame(Air.Flow=c(72,65,55), Water.Temp=c(20,11,22))
predict(vmodel2, newdata)
predict(vmodel2,newdata1)




