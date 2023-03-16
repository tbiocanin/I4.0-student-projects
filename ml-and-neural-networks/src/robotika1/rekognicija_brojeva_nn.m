clc,clear, close all

load ("ObucavanjeCifre.mat")
% Initialise input vectors

% Initialise output vectors


i = Obucavanje_slike;
o = Obucavanje_klase;
% Define the structure of feedforward neural network
net = newff(i,o,[50,10],{'tansig','purelin', 'softmax'},'traincgb');

%10 neurona u prvom skrivenom sloju, 8 u drugom
%logsig - sigmuidna aktivaciona funkcija
%lm - Levenberg Markeov algoritam ucenja (trainlm)

% Training parameters
net.trainParam.show = 100; %prikkazuje svaku stotu iteraciju
% net.trainParam.lr = 0.5; % ne važi za 'trainlm'
net.trainParam.mu = 0.01; % parametar u?enja
net.trainParam.epochs = 1000; %maksimalni broj iteracija posle kog se zavrsava ucenje
net.trainParam.goal = 1e-5; %zadata greska

net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;
% Initialise training
net = train(net,i,o);
% View training results
y_sim = sim(net,i(:,:));

[Value,Number]=max(sim(net,double(Test_Slike(:,:))));
Number=Number-1;

% Greska klasifikacije
cp = classperf(Test_klase,Number);
Greska =cp.ErrorRate;

% Matrica odlucivanja
C = confusionmat(Test_klase,Number);

% Podesiti koliko zelite slika da vidite za test - mora biti deljivo sa 25
BrSlikaZaPrikaz= 50;
perm = randperm(10000, BrSlikaZaPrikaz);
for j=1:BrSlikaZaPrikaz/25
    figure()
    for i=1:BrSlikaZaPrikaz/2
        subplot(5,5,i)
        imshow(Test_Slike_Prikaz(:,:,perm((j-1)*(BrSlikaZaPrikaz/2)+i)))
        if Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i)) ~=Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i))
        title (['\color{red}Net=',num2str(Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i))),' Real=',num2str(Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i)))])
        else 
         title (['\color{blue}Net=',num2str(Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i))),' Real=',num2str(Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i)))])    
        end
    end
end