% clc,clear, close all
load('ObucavanjeCifre.mat');
% Initialise input vectors

i = [Obucavanje_slike];
% Initialise output vectors

o = [Obucavanje_klase];%
% Define the structure of feedforward neural network
net = newff(i,o,[20,10],{'logsig','logsig','softmax'},'trainbr'); %net je samo naziv mreze, tj promenljive
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
y = sim(net,i(:,:));

% Ovaj kod kopirajte na kraj koda za obucavanje mreze.
% Napomena: Ukoliko menjate ime mreze (sa "net" na nesto drugo), primenite i u ovom delu koda.

% Podesavanje izlaza iz mreze radi ocene tacnosti klasifikacije
[Value,Number]=max(sim(net,double(Test_Slike(:,:))));
Number=Number-1;

% Greska klasifikacije
cp = classperf(Test_klase,Number);
Greska =cp.ErrorRate

% Matrica odlucivanja
C = confusionmat(Test_klase,Number)

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

% Mogucnosti za odabir Algoritama obucavanja i aktivacionih funkcija - - pokrenite redove ispod bez '%'
% help nntrain
% help nntransfer



