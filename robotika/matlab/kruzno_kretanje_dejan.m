x = 0;
y = 0;
teta = 0;
b = 2;
R = 10;
n = 180;

%konstante

ulaz = [x y teta];

sd =  ones(1,n) * (R + b/2) * 2*pi/180 + 0.01 * randn(n,1);
sl =  ones(1,n) * (R - b/2) * 2*pi/180 + 0.01 * randn(n,1);

ukupne = zeros(3,n);

for i = 1:n
    
    ulaz = kretanje_modela(ulaz, sd(i), sl(i), b);
    ukupne(:,i) = transpose(ulaz);
    
end

plot(ukupne(1,1:n),ukupne(2,1:n));