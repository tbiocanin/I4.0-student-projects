clear all, clc

load("matematicki_negativan_smer.mat")
%dobijene su pozitivne vrednosti, tj. isao je u mat. poz. smeru
uneti_uglovi_neg = unetiUglovi;
ocitan_uglovi_neg = ocitanUgao;
load("matematicki_pozitivan_smer.mat")
%dobijene su negativne vrednosti ocitan ugao, tj. isao je u mat. neg. smeru
uneti_uglovi_pos = unetiUglovi;
ocitan_uglovi_pos = ocitanUgao;

%sredjivanje velicine ulaza i izlaza

% Initialise input vectors
i1 = [ocitan_uglovi_neg]';
i2 = [ocitan_uglovi_pos]';

i = [i1; i2]';

% Initialise output vectors
o1 = uneti_uglovi_neg';
o2 = uneti_uglovi_pos';
o=[o1; o2]';

rng(0);

% Define the structure of feedforward neural network
net = newff(i,o,[25, 10],{'purelin', 'purelin'},'trainbr'); 
%net je samo naziv mreze, tj promenljive
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
net.divideParam.valRatio = 0.2; %ovo je za validaciju
net.divideParam.testRatio =0.1; %ovo je za trening

% Initialise training
net = train(net,i,o);
% View training results
TRENING = sim(net,i(:,:));

plot(i, o, 'or')
hold on
plot(i, TRENING, '*b')




