clc; clear all; close all
x0=0;
y0=0;
teta0=pi/4;
x = [x0 y0 teta0];

b=200;

sd = 0:(100+abs(randn)):10000;
sl = 0:(100+abs(randn)):10000;
n=min(length(sd),length(sl));

izlaz = zeros(3,n);

for i = 1:n 
    kretanje = polozaj(x,sd(i),sl(i),b);
    izlaz(:,i) = transpose(kretanje);
end

axis equal
plot(izlaz(1,1:n), izlaz(2,1:n));
