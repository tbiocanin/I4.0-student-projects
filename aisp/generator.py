# random generator for a project - Introduction to manufacturing processes 

import random 

delovi = ["Prirubnica", "Vratilo", "Caura"]
radijusi = ["200", "250", "300", "350", "400"]
cena = ["200", "300", "100", "400", "500"]
masa = ["250", "350", "450", "550", "650"]
dimenzije1 = ["100", "150", "200", "250", "300"]
celici = ["Č6880", "Č4580", "Č4144", "Č4150"]
kombinacije_radijusi = []
kombinacije_cena_masa = []
kombinacije_dimenzije = []
kombinacije_celici = []

for i in range(1, 10):
    kombinacije_radijusi.append(random.choice(delovi) + random.choice(radijusi))
    kombinacije_cena_masa.append(random.choice(cena) + " " + random.choice(masa))
    kombinacije_dimenzije.append(random.choice(dimenzije1) + "x" + random.choice(dimenzije1) + "x" + random.choice(dimenzije1)) 
    kombinacije_celici.append(random.choice(celici))


print(kombinacije_celici)
print(kombinacije_cena_masa)