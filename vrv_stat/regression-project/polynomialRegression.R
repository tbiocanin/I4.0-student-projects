#TODO: takodje, testovi podataka i analiza - завршено
#TODO: pokusati da uradis rucnu implementaciju gradijentalnog pristupa kao gratis 
# za samu prezentaciju

library(ggplot2)

set.seed(1)

df <- data.frame(hours = runif(50, 5, 15), score = 50)
df$score = df$score + df$hours^3/150 + df$hours*runif(50, 1, 2)
summary(df)
df
head(df)

ggplot(df, aes(x=hours, y=score)) + geom_point()

#analiza modela
best = lm(score ~ poly(hours, 2, raw = T), data = df)
best2 = lm(score ~ hours, data = df)

#pregled najboljeg modela
summary(best)
summary(best2)

plot(df$hours, df$score, xlab = "Hours studied", ylab = "Score")
abline(best2)
plot(best)
ggplot(df, aes(x=hours, y=score)) + 
  geom_point() +
  stat_smooth(method='lm', formula = y ~ poly(x,2), size = 1) + 
  xlab('Hours Studied') +
  ylab('Score')

#TODO: poredjenja radi, dodaj i linearnu regresiju na ovakav model kako bi se videle
#razlike u fitovanju i zakljucak koji bi bio bolji za ovakav UC - завршено