clc, clear all, close all

pocetno=[0 0 pi/4];
b = 200;
R = 100;
alfa = -2*pi/180;
delta_s_levo = ones(1, 100) * (R - b/2)*alfa; %+ randn(1, 100)
delta_s_desno = ones(1, 100) * (R + b/2)*alfa; %+ randn(1, 100)

izlaz = zeros(3,100);
for i = 1:100 
    izlaz(:,i) = polozaj(pocetno,delta_s_desno(i),delta_s_levo(i),b);
end

axis equal
plot(izlaz(1,1:100),izlaz(2,1:100))