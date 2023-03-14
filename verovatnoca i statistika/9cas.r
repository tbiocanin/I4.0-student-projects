#1.
x <- c(5.6884562,  2.0308148, -0.2508697, -2.5062107,  5.1422191,  1.1849337,  3.6343267,
       4.6528487,  1.5760364,  5.1431170,  1.8864374,  4.4475159,  3.5619849,  4.7377123,
       -1.2994996,  2.4134766,  0.2744983,  5.2431267, -0.1152874,  0.8769407,  2.1222095,
       1.8561701,  3.0470218,  0.4738757,  2.1079643,  2.5249362, -2.2613439,  1.0116844,
       2.1796532,  1.6629011,  0.6026096,  3.0568876,  0.1365397, -5.0585758,  2.3148987,
       4.0924715, -0.9189906,  7.6984261, -1.9539183,  2.7631545,  5.5492733, -1.5838495,
       -2.3246922,  0.7752239,  1.3790237, -1.1731306,  4.8165865,  2.9824243,  6.0295380,
       0.1998773,  9.0725547, -1.2977859,  1.9417684, -3.5287460,  2.5369642, -1.3349065,
       -1.7820453,  4.2251318,  2.9737008,  1.8158107)
(n <- length(x))
(Xn <- mean(x))
(sigma <- sqrt(10))
(alfa <- 0.05)
#a
(t_kapa <- (Xn-2)/sigma*sqrt(n))
(c <- qnorm(1-alfa))
t_kapa > c
# t_kapa NE pripada W => prihvatimo H0
#b
(c <- qnorm(1-alfa/2))
abs(t_kapa) > c
# t_kapa NE pripada W => prihvatimo H0
#v
#install.packages("BSDA")
library(BSDA)
?z.test
z.test(x, sigma.x=sqrt(10), mu=2, alternative = "greater") 
# p>0.05 => prihvatimo H0
z.test(x, sigma.x=sqrt(10), mu=2, alternative = "two.sided")
# p>0.05 => prihvatimo H0
#g
# racunamo p vrednost
1-pnorm(t_kapa)
(p <- 2*(1-pt(abs(t_kapa), n-1))  )
#d
nadji_moc <- function(c, donja_granica, gornja_granica, korak){
  t <- seq(donja_granica, gornja_granica, korak)
  rezultat <- 1 - pnorm(c + (2-t)/sqrt(10)*sqrt(60))
  return(rezultat)
}
nadji_moc(qnorm(1 - 0.05), 2, 3.5, 0.01)


#2.
(alfa <- 0.05)
(c <- qnorm(1-alfa) )
(2.842-2)/1.7*5 > c
# odbacujemo H0

#3.a
t.test(x, mu=2, alternative = "two.sided") 
#p>0.05 =>  prihvatimo H0
# ILI
(n <- length(x))
(t_kapa <- (mean(x) - 2)/sqrt(var(x)) * sqrt(n))
(p <- 2*(1-pt(abs(t_kapa), n-1)))
#p>0.05 =>  prihvatimo H0


#3.b
(alfa <- 0.1)
(Sn <- sd(x))
(t_kapa <- 59*Sn^2/8)
(c <- qchisq(alfa, n-1))
t_kapa < c
# prihvatamo H0
# ILI
#install.packages("EnvStats")
library(EnvStats)
varTest(x, alternative = "less", sigma.squared = 8, conf.level = 0.9) #!!!
# p>0.1 => prihvatamo H0


#4.
# Prvo testiramo hipotezu o jednakosti disperzija
(F_kapa <- 1600/625)
(c1 <- qf(0.1/2, 24, 24))
(c2 <- qf(1-0.1/2, 24, 24))
F_kapa < c1 | F_kapa > c2 
# F_kapa jeste u kriticnoj oblasti => odbacujemo H0
# Disperzije nisu jednake
(Q <- (1600/25 + 625/25)^2/((1600/25)^2/24+(625/25)^2/24)) #stepeni slobode
# Q>30, pa mozemo aproksimirati normalnom, inace bismo imali qt(0.05, df=Q)
(c <- qnorm(0.05))
(t_kapa <- (570-600)/sqrt(1600/25 + 625/25))
t_kapa < c
# odbacujemo H0 tj. bolje je da uzme rezim rada B


#5.
A <- c(200,220,320,450,500,550,550,550,600,670,700,1000,1200,1200)
B <-c(230,230,300,300,300,400,450,450,500,500,500,800,800,800,1000,1000,1000,1500,1500,1500,1500)
# Prvo testiramo hipotezu o jednakosti disperzija
var.test(A, B, ratio = 1,alternative = "two.sided")
# p>0.05, pa mozemo smatrati da su disperzije jednake
t.test(A, B, mu = 0, var.equal = TRUE)
# p>0.05 => ne odbacujemo H0
# nema znacajnih razlika izmedju prosecnih plata u te dve firme 


#6.
(xa <- 1500)
(xb <- 1600)
(t_kapa <- (xa-xb)/sqrt(9/25+16/25))
(c <- qnorm(0.05))
t_kapa < c
# Odbacujemo H0


#7.
(t_kapa <- 0.045/sqrt(0.0084)*sqrt(20))
(alfa <- 0.05)
(c <- qt(1-alfa, 19))
t_kapa > c    
# realizovana vrednost T upada u kriticnu oblast => odbacujemo H0


#8.
prvi <- c(3.4, 5.1, 3.5, 7.2, 7.5)
drugi <- c(2.8, 5.4, 3.3, 7.2, 7.8)
# pravimo uzorak razlika
d <- prvi - drugi
t.test(d, mu=0, alternative = "greater") # t.test za jedan uzorak
# drugi nacin:
t.test(prvi, drugi, mu=0, paired = TRUE, alternative = "greater") 
# t.test za dva uzorka ali sa parametrom paired=TRUE sto sugerise na uparene podatke, 
# p>0.05 => prihvatamo H0 
# nema razlika izmedju srednjih vrednosti cena u dva supermarketa


