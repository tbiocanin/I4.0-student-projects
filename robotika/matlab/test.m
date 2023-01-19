clc; clear all; close all
x0=0;
y0=0;
teta0=pi/4;
x = [x0 y0 teta0];

b=200;

sd = 0:(100+randn):10000;
sl = 0:(100+randn):10000;
n=length(sd);

izlaz = zeros(3,n);

for i = 1:n 
    kretanje = polozaj(x,sd(i),sl(i),b);
    izlaz(:,i) = transpose(kretanje);
end

axis equal
plot(izlaz(1,1:n), izlaz(2,1:n));

% for i = 1:n
%     sd = 100*i +randn;
%     sl = 100*i +randn;
%     kretanje = polozaj(x,sd,sl,b);
%     plot(kretanje(1),kretanje(2));
% end
