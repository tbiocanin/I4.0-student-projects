x_pocetak = [0; 0; 0];

%[x_izlaz, y_izlaz, teta_izlaz] = simulacija_kretanja_kruzno(x_pocetak)

%test 
[x_izlaz, y_izlaz, teta_izlaz, delta_s_levo, delta_s_desno] = simulacija_kretanje_funkcija(x_pocetak);

%verifikacija funkcije
x_test = 0:1000;
y = 2*cos(x_test) + cos(x_test/2 + pi/2) + 10;
%plot(x_test, y)
plot(x_izlaz, y_izlaz)
