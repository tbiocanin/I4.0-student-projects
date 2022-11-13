d <- data.frame(iris)
d1 <- d[d$Petal.Length > 5 & d$Petal.Width < 2,]
d1


#ukupno u matrici ima ovoliko elemenata
print("ukupno u matrici ima ovoliko elemenata:")
ncol(d1) * nrow(d1)

print("dok u svakoj koloni ima ovoliko elemenata:")
nrow(d1)

d2 <- transform(d1, vece = (d1$Sepal.Width > mean(d1$Sepal.Width)))
d2