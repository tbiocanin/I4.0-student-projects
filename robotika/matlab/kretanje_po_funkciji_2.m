clc,clear all, close all
b = 20;  
xu = -10:0.1:10; 
yu(1) = 0.5*sin(xu(1)) -cos(xu(1)/2)  + 10;
tetau(1) = 0; 

Dtetau = 0; 
for i = 2:200 
    yu(i) = 0.5*sin(xu(i)) -cos(xu(i)/2)  + 10; 
    tetau(i) = atand((yu(i)-yu(i-1))/(xu(i)-xu(i-1))); 
    su(i) = sqrt((xu(i)-xu(i-1))^2 + (yu(i)-yu(i-1))^2); 
    Dtetau(i) = tetau(i) - tetau(i-1); 
end


x(1) = xu(1); 
y(1) = yu(1); 
teta(1) = tetau(1); 
sd(1) = su(1) + 0.5*b*Dtetau(1);
sl(1) = su(1) - 0.5*b*Dtetau(1); 
izlaz(1:5,1) = [x(1);y(1);teta(1);sd(1);sl(1)]; 

for i = 2:200 
    sd(i) = su(i) + 0.5*b*Dtetau(i) + randn*0.05; 
    sl(i) = su(i) - 0.5*b*Dtetau(i) + randn*0.05; 
    x(i) = x(i-1) + 0.5*(sd(i)+sl(i))*cosd(teta(i-1) + (sd(i)-sl(i))/(2*b)); 
    y(i) = y(i-1) + 0.5*(sd(i)+sl(i))*sind(teta(i-1) + (sd(i)-sl(i))/(2*b)); 
    teta(i) = teta(i-1) + (sd(i)-sl(i))/b; 
    izlaz(:,i) = [x(i);y(i);teta(i);sd(i);sl(i)]; 
end


% hold on
% plot(izlaz(1,:),izlaz(2,:))
% xlabel('predjeni put u x-osi');
% ylabel('predjeni put u y-osi')
% legend('trajektorija po funkciji')
% title('predjeni put kretanja po funkciji')
% hold off





% Initialise input vectors
i1 = izlaz(1,:);
i2 = izlaz(2,:);
i3 = izlaz(3,:);
i = [i1; i2 ;i3];

% Initialise output vectors
o1 = sl;
o2 = sd;
o=[o1; o2];

% Define the structure of feedforward neural network
net = newff(i,o,[12,8],{'logsig','logsig'},'trainlm'); %net je samo naziv mreze, tj promenljive
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
net.trainParam.max_fail = 998;

net.divideParam.trainRatio =0.7; %koristimo 100% podataka za trening
net.divideParam.valRatio = 0.15; %ovo je za validaciju
net.divideParam.testRatio =0.15; %ovo je za trening

% Initialise training
net = train(net,i,o);
% View training results
TRENING = sim(net,i(:,:));

% axis equal
% plot(izlaz(1,:), izlaz(2,:), 'b')
% hold on
% plot(x1, y1, 'red')
