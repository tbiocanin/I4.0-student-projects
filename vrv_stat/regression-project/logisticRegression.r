data <- ISLR::Default
summary(data)
nrow(data)

set.seed(1)

#taking 70% for training
sample <- sample(c(TRUE, FALSE), nrow(data), replace = TRUE, prob = c(0.7, 0.3))
train <- data[sample, ]
test <- data[!sample, ]

#pravljenje modela sada sa poznatim podacima
model <- glm(default~student+balance+income, family = "binomial"(link = "logit"), data = train)

summary(model)

#sada kada imamo modedl, mozemo da pravimo predikcije sa nekim konkretnim vrednostima
#ili da koristimo test set podataka kako bismo verifikovali vrednosti

#1) kada prosledimo neke ad hok vrednosti i vidimo koja je verovatnoca da su studenti ili ne
new <- data.frame(balance = 1400, income = 2000, student = c("Yes", "No"))

#predvidjanje da je osoba student i da ima 1400 neke valute, a da mu je prihod 2000
predict(model, new, type = "response")

#predvidjanje za svaku promenljivu u test setu podataka
predicted <- predict(model, test, type = "response")
plot(predicted)
#sortiranje tako da krajnji izlazi budu zaista binarne vrednosti
for(i in 1:length(predicted)){
  if(predicted[i] > 0.7) {
    predicted[i] = 1
  } else {
    predicted[i] = 0
  }
}
plot(model)

