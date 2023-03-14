clc,clear, close all
% Initialise input vectors
i1 = [0 0 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 ...
0 0 0 0 0 0 0]';
i2 = [0 1 1 1 0 1 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 1 0 0 0 1 0 0 0 0 1 1 1 ...
1 1 0 0 0 0 0]';
i3 = [0 1 1 1 0 1 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 0 1 1 ...
1 0 0 0 0 0 0]';
i4 = [1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 1 1 1 0 0 0 0 1 0 0 0 0 ...
1 0 0 0 0 0 0]';
i = [i1 i2 i3 i4]
% Initialise output vectors
o1 = [1 0 0 0]';
o2 = [0 1 0 0]';
o3 = [0 0 1 0]';
o4 = [0 0 0 1]';
o = [o1 o2 o3 o4];%
% Define the structure of feedforward neural network
net = newff(i,o,[5,5],{'logsig','logsig'},'trainlm'); %net je samo naziv mreze, tj promenljive
%newff = new feed forward [10 8] broj neurona u skrivenim slojevima
%prvi sloj ima 10 neurona drugi ima 8 logsin su
%aktivacione funkcije za slojeve, trainlm je algoritam ucenja (levenberg markeov)
                                                        

% Training parameters
net.trainParam.show = 100;
% net.trainParam.lr = 0.5; % ne vaÅ¾i za 'trainlm' learning rate
net.trainParam.mu = 0.01; % parametar uÄ?enja
net.trainParam.epochs = 1000; %maksimalni br. operacija posle kog se zavrsava obucavanje
net.trainParam.goal = 1e-5; %zadata greska, ako nama greska bude manja, obucavanje se zavrsava
net.divideParam.trainRatio =0.7; %koristimo 100% podataka za trening
net.divideParam.valRatio = 0.15; %ovo je za validaciju
net.divideParam.testRatio =0.15; %ovo je za trening

% Initialise training
net = train(net,i,o);
% View training results
y = sim(net,i(:,:))

i1_1 = [0 1 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 ...
0 0 0 1 0 0 1]';

y_1 = sim(net,(i1_1))