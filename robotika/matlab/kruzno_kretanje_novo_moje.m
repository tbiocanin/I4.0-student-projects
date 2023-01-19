clc, clear all, close all

x=[0 0 0];

n=100;
b=200;
n=100;
r=100;
alfa = 4*pi/180;

sd = zeros(1,n);
sl = zeros(1,n);
izlaz =zeros(3,n);

for i=1:n
    sl(:,i) = (r-b/2)*alfa + randn;
    sd(:,i) = (r+b/2)*alfa + randn;
    kretanje = polozaj(x,sl(i),sd(i),b);
    izlaz(:,i) = transpose(kretanje);
end

plot(izlaz(1,1:n),izlaz(2,1:n))