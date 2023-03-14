function [trenutni_polozaj] = polozaj(x,DSdesno,DSlevo,b)

x1 = ((DSdesno+DSlevo)/2).*cos(x(3) +(DSdesno-DSlevo)/(2.*b));
y1 = ((DSdesno+DSlevo)/2).*sin(x(3) +(DSdesno-DSlevo)/(2.*b));
teta1 = (DSdesno-DSlevo)/b;
trenutni_polozaj = x + [x1 y1 teta1];
end

