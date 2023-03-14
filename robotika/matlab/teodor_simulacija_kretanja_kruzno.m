clc, clear all, close all
x_pocetno=[0 0 0];
b = 200;
R = 100;
alfa = 4*pi/180;
delta_s_levo = ones(1, 100) * (R - b/2)*alfa; + randn(1, 100);
delta_s_desno = ones(1, 100) * (R + b/2)*alfa; + randn(1, 100);

delta_s_desno_1=zeros(1,100);
delta_s_levo_1=zeros(1,100);

for i=2:100
    delta_s_desno_1(:,i) = delta_s_desno_1(:,i-1) +delta_s_desno(i);
    delta_s_levo_1(:,i) = delta_s_levo_1(:,i-1)+delta_s_levo(i);
end


delta_s = (delta_s_levo + delta_s_desno)/2;
x_novo = zeros(3, 100);
x_novo(1:3, 1) = x_pocetno;

for i = 2:100
    x_novo(:, i) = x_novo(:, i-1) + [(delta_s(1, i) * cos( x_novo(3, i-1) + ( delta_s_desno(1, i) - delta_s_levo(1, i) )/( 2 * b ) ));
    (delta_s(1, i) * sin( x_novo(3, i-1) + (delta_s_desno(1, i) - delta_s_levo(1, i))/( 2 * b ) ) );
    (delta_s_desno(1, i) - delta_s_levo(1, i))/b];
%     plot(x_novo(1, 1:i), x_novo(2, 1:i))
        
end

x_translatorno = x_novo(1, :);
y_translatorno = x_novo(2, :);
teta_izlaz = x_novo(3, :);
% plot(x_translatorno, y_translatorno)
% axis equal
    
% Initialise input vectors
i1 = x_translatorno;
i2 = y_translatorno;
i3 = teta_izlaz;
i = [i1 ;i2 ;i3];

% Initialise output vectors
o1 = delta_s_levo_1;
o2 = delta_s_desno_1;
o=[o1; o2];

% Define the structure of feedforward neural network
net = newff(i,o,[9,6],{'purelin','purelin'},'traingdx'); %net je samo naziv mreze, tj promenljive
%newff = new feed forward [10 8] broj neurona u skrivenim slojevima
%prvi sloj ima 10 neurona drugi ima 8 logsin su
%aktivacione funkcije za slojeve, trainlm je algoritam ucenja (levenberg
%markeov), moze i tansin itd..default je logsin
                                                        

% Training parameters
net.trainParam.show = 1000;
% net.trainParam.lr = 0.5; % ne vazi za 'trainlm' learning rate
net.trainParam.mu = 0.01; % parametar ucenja
net.trainParam.epochs = 1000; %maksimalni br. operacija posle kog se zavrsava obucavanje
net.trainParam.goal = 1e-5; %zadata greska, ako nama greska bude manja, obucavanje se zavrsava

net.divideParam.trainRatio =0.7; %koristimo 100% podataka za trening
net.divideParam.valRatio = 0.15; %ovo je za validaciju
net.divideParam.testRatio =0.15; %ovo je za trening
net.trainParam.max_fail = 998;

% Initialise training
net = train(net,i,o);
% View training results


TRENING = sim(net,i(:,:));
