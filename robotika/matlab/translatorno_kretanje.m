clc; clear all; close all
x0=0;
y0=0;
teta0=pi/4;
x = [x0 y0 teta0];

n=100;
b=200;

sd = zeros(1,n);
sl = zeros(1,n);
izlaz =zeros(3,n);

for i = 1:n
    
    sd(:,i) = 100*i + randn; 
    sl(:,i) = 100*i + randn; 
    kretanje = polozaj(x,sd(i),sl(i),b);
    izlaz(:,i) = transpose(kretanje);

end

plot(izlaz(1,1:n),izlaz(2,1:n))







