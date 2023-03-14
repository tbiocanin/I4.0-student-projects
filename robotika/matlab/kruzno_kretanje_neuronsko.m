clc; clear all; close all
x0=0;
y0=0;
teta0=0;
x = [x0 y0 teta0];

b=2;
r=10;
teta1 = 0:abs((0.01*randn)):2;
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
% plot(izlaz(1,1:n), izlaz(2,1:n));

x_koord = zeros(1,n);
y_koord = zeros(1,n);
teta_koord = zeros(1,n);

for i = 1:n 
    x_koord(:,i) = izlaz(1,i);
    y_koord(:,i) = izlaz(2,i);
    teta_koord(:,i) = izlaz(3,i);
end

% Initialise input vectors
i1 = x_koord';
i2 = y_koord';
i3 = teta_koord';
i4 = sd';
i5 = sl';
i = [i1 i2 i3 i4 i5]';

% Initialise output vectors
x1 = ((sd + sl)/2).*cos(teta0 +(sd - sl)/(2.*b));
y1 = ((sd + sl)/2).*sin(teta0 +(sd - sl)/(2.*b));
teta1 = ((sd - sl)/b);
o=[x1; y1; teta1];

% Define the structure of feedforward neural network
net = newff(i,o,[6,5],{'compet','compet'},'trainrp'); %net je samo naziv mreze, tj promenljive
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

% Initialise training
net = train(net,i,o);
% View training results
TRENING = sim(net,i(:,:));

plot(x_koord, y_koord, 'b')
hold on
plot(x1, y1, 'red')
hold off
% plot(x,y,'b')
% hold on
% plot(x,y1,'r')

