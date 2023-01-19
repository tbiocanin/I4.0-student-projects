clc,clear all, close all
x1 = [-50:10:50];
x2 = [-50:10:50];
x3 = [-50:10:50];


[x11,x22,x33] = ndgrid(x1,x2,x3);
x = [x11(:),x22(:),x33(:)];
y = zeros(1331,1);

for i = 1:length(x)
    for j = 1:3 
        if j == 1
            y(i,1) = -x(i,j)*sin(sqrt(abs(x(i,j))));
        
        else
            
            y(i,1) = y(i,1) - x(i,j)*sin(sqrt(abs(x(i,j))));
        end
    end
    

end
    



% Initialise input vectors
i1 = x(:,1);
i2 = x(:,2);
i3 = x(:,3);
i = [i1 i2 i3]';

% Initialise output vectors
o = y';

% Define the structure of feedforward neural network
net = newff(i,o,[25,15],{'logsig','logsig'},'trainbr'); %net je samo naziv mreze, tj promenljive
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
% 
% axis equal
% hold on
% plot(x1, y1, 'red')

