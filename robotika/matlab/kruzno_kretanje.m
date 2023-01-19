clc; clear all; close all
x0=0;
y0=0;
teta0=0;
x = [x0 y0 teta0];

b=2;
r=10;
teta1 = 0:abs((0.01*randn)):1.8;
izlaz = zeros(3,length(teta1));
n=length(teta1);
sd = ones(1,n);
sl = ones(1,n);

for i = 1:length(teta1)
    sd(i) = cos(teta1(i))*(r+b/2);
    sl(i) = sin(teta1(i))*(r-b/2);
    izlaz(:,i) = polozaj(x,sd(i),sl(i),b);
end

axis equal
 plot(izlaz(1,1:n), izlaz(2,1:n));


