clc; clear all; close all

load("belaBoja.mat")
load("crnaBoja.mat")

bela = reshape(bela, [1, 500]);
crna = reshape(boje, [1, 500]);
initEmptyZeros = zeros(1, 500);


% Initialise input vectors
i1 = bela;
i2 = crna;

i = [i1 i2];
minimum = min(i);
maksimum = max(i);

for x = 1:length(i)
    i(x) = (i(x) - minimum)/(maksimum - minimum);
end

% Initialise output vectors
x1 = ones(1, 500); %bele boje
y1 = zeros(1, 500); %crne boje 

o=[x1 y1];

rng(0);

% Define the structure of feedforward neural network
net = newff(i,o,[1,1],{'tansig','tansig'},'trainbr'); %net je samo naziv mreze, tj promenljive
%newff = new feed forward [10 8] broj neurona u skrivenim slojevima
%prvi sloj ima 10 neurona drugi ima 8 logsin su
%aktivacione funkcije za slojeve, trainlm je algoritam ucenja (levenberg
%markeov), moze i tansin itd..default je logsin
                                                        

% Training parameters
net.trainParam.show = 1000;
% net.trainParam.lr = 0.5; % ne vazi za 'trainlm' learning rate
net.trainParam.mu = 0.5; % parametar ucenja
net.trainParam.epochs = 1000; %maksimalni br. operacija posle kog se zavrsava obucavanje
net.trainParam.goal = 1e-5; %zadata greska, ako nama greska bude manja, obucavanje se zavrsava

net.divideParam.trainRatio =0.7; %koristimo 100% podataka za trening
net.divideParam.valRatio = 0.2; %ovo je za validaciju
net.divideParam.testRatio =0.1; %ovo je za trening

% Initialise training
net = train(net,i,o);
% View training results
TRENING = sim(net,i(:,:));

%save("VNMbojaBP.mat","net");





