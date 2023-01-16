#ovde se pravi pristup tako da se prave podaci, dok bi bilo korisno kada bih ovde nasao 
#neke gotove podatke i iskoristio ih u svrhe demonstracije
#TODO: takodje, testovi podataka i analiza

library(ggplot2)

set.seed(1)

df <- data.frame(hours = runif(50, 5, 15), score = 50)
df$score = df$score + df$hours^3/150 + df$hours*runif(50, 1, 2)

head(df)

ggplot(df, aes(x=hours, y=score)) + geom_point()

#analiza modela
best = lm(score ~ poly(hours, 2, raw = T), data = df)

#pregled najboljeg modela
summary(best)


ggplot(df, aes(x=hours, y=score)) + 
  geom_point() +
  stat_smooth(method='lm', formula = y ~ poly(x,2), size = 1) + 
  xlab('Hours Studied') +
  ylab('Score')

#TODO: poredjenja radi, dodaj i linearnu regresiju na ovakav model kako bi se videle
#razlike u fitovanju i zakljucak koji bi bio bolji za ovakav UC