clc,clear, close all
% Initialise input vectors
x = -10:0.5:10;
i = x;

% Initialise output vectors
y = 2*x.^2 + x;
o=y;

% Define the structure of feedforward neural network
net = newff(i,o,[5,5],{'tansig','purelin'},'trainbr'); %net je samo naziv mreze, tj promenljive
%newff = new feed forward [10 8] broj neurona u skrivenim slojevima
%prvi sloj ima 10 neurona drugi ima 8 logsin su
%aktivacione funkcije za slojeve, trainlm je algoritam ucenja (levenberg
%markeov), moze i tansin itd..default je logsin
                                                        

% Training parameters
net.trainParam.show = 100;
% net.trainParam.lr = 0.5; % ne važi za 'trainlm' learning rate
net.trainParam.mu = 0.01 % parametar učenja
net.trainParam.epochs = 1000; %maksimalni br. operacija posle kog se zavrsava obucavanje
net.trainParam.goal = 1e-5; %zadata greska, ako nama greska bude manja, obucavanje se zavrsava

net.divideParam.trainRatio =0.7; %koristimo 100% podataka za trening
net.divideParam.valRatio = 0.15; %ovo je za validaciju
net.divideParam.testRatio =0.15; %ovo je za trening

% Initialise training
net = train(net,i,o);
% View training results
y1 = sim(net,i(:,:))

plot(x,y,'b')
hold on
plot(x,y1,'r')
