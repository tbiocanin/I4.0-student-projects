clc, clear all, close all

x0=0;
y0=0;
teta0=0;

x=-10:0.01:10;
y=0.5*sin(x)-cos(x/2);
z=0.5*sin(x);
q=-cos(x/2);
b=20;
r=atan(y);

ulaz = [x0 y0 teta0];

n = length(x);
ukupne = zeros(3,n);
w=zeros(1,n);

for i = 1:n
    w(i)=(z(i))/(q(i));
end
   
sd = zeros(1,n);
sl = zeros(1,n);
for i = 1:n
    sd(i) = x(i)+abs(atan(y(i)));      %da nam dy tj y(i) = (sd +sl)/2 valjda
    sl(i) = x(i);
    ulaz = polozaj(ulaz, sd(i), sl(i),b);
    ukupne(:,i) = transpose(ulaz);
end
% axis equal
% plot(x,y);
plot(ukupne(1,1:n),ukupne(2,1:n));
