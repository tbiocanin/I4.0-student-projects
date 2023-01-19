clc, clear all, close all
x = 0;
y = 0;
teta = 0;
ulaz = [x y teta];
n = 100;
b = 200;

sd = 100 + randn(n,1);
sl = 100 + randn(n,1);

ukupne = zeros(3,n);
for i = 1:n
   
    
    ulaz = kretanje_modela(ulaz, sd(i), sl(i), b);
    %disp(ulaz(2));
    ukupne(:,i) = transpose(ulaz);
    
end

axis equal

plot(ukupne(1,1:n),ukupne(2,1:n));