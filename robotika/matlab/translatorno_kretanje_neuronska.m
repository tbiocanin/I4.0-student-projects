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
% hold on
% plot(izlaz(1,1:n),izlaz(2,1:n))
% xlabel('predjeni put u x-osi');
% ylabel('predjeni put u y-osi')
% legend('translatorna trajektorija')
% title('predjeni put translatornog kretanja')
% hold off


x_koord = zeros(1,n);
y_koord = zeros(1,n);
teta_koord = zeros(1,n);

for i = 1:n 
    x_koord(:,i) = izlaz(1,i);
    y_koord(:,i) = izlaz(2,i);
    teta_koord(:,i) = izlaz(3,i);
end

% x1=zeros(1,n);
% y1=zeros(1,n);
% teta1=zeros(1,n);

% Initialise input vectors
i1 = x_koord;
i2 = y_koord;
i3 = teta_koord;
i = [i1 ;i2 ;i3];

% Initialise output vectors
o1 = sl;
o2 = sd;
o=[o1; o2];

% Define the structure of feedforward neural network
net = newff(i,o,[10,8],{'tansig','tansig'},'trainbr'); %net je samo naziv mreze, tj promenljive
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

plot(izlaz(1,1:n),izlaz(2,1:n), 'b')
hold on
plot(o1, o2, 'r')
xlabel('predjeni put u x-osi');
ylabel('predjeni put u y-osi')
legend('simulirana translatorna trajektorija','naucena translatorna trajektorija')
title('predjeni put translatornog kretanja')
hold off


% plot(x,y,'b')
% hold on
% plot(x,y1,'r')






