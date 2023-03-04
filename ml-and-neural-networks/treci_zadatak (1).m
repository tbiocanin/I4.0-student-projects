clc,clear, close all
% Initialise input vectors
x1 = -5:.5:5;
x2 = -5:.5:5;
x3 = -5:.5:5;

[z1, z2, z3] = ndgrid(x1, x2, x3);
combs = [z1(:), z2(:), z3(:)];
i = combs';

% Initialise output vectors
o = sum(i.^2-10*cos(2*pi*i)+10, 1);

% Define the structure of feedforward neural network
net = newff(i,o,[20, 20],{'logsig', 'tansig'},'trainlm'); 
% Training parameters
net.trainParam.show = 100;
%net.trainParam.lr = 0.5; % ne važi za 'trainlm'
net.trainParam.mu = 0.01; % parametar učenja
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;

% Initialise training
net = train(net,i,o);

% View training results
y = sim(net,i(:,:)); 