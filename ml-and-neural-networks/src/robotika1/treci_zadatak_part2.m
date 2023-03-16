clc,clear, close all
% Initialise input vectors
x1 = -5:.5:5;
x2 = -5:.5:5;

[z1, z2] = ndgrid(x1, x2);
combs = [z1(:), z2(:)];
i = combs';
x1 = combs(:, 1);
x2 = combs(:, 2);

% Initialise output vectors
%o1 = (x2- 5.1/(4*pi^2)*x1.^2 + (5/pi^2)*x1 - 6).^2;
%o2 = 10*cos(x1)*(1 - 1/8*pi) + 10;
%o = o1 .* o2;
o = (x2 - ( 5.1/( 4*pi^2 ) )*x1.^2 + ( 5/( pi^2 ) ) - 6) .* cos(x1).*(1-1/(8*pi)) + 10;
o = o';
% Define the structure of feedforward neural network
net = newff(i,o,[20, 20],{'logsig', 'tansig'},'trainlm'); 
% Training parameters
net.trainParam.show = 100;
%net.trainParam.lr = 0.5; % ne vaÅ¾i za 'trainlm'
net.trainParam.mu = 0.1; % parametar uÄ?enja
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;

% Initialise training
net = train(net,i,o);

% View training results
y = sim(net,i(:,:)); 
plot(y(1, :))