% Initialise input vectors
i1 = [0 0 1 0 0 0 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 ... 
0 0 0 0 0 0 0]';
i2 = [0 1 1 1 0 1 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 1 0 0 0 1 0 0 0 0 1 1 1 ... 
1 1 0 0 0 0 0]';
i3 = [0 1 1 1 0 1 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 0 0 0 1 1 0 0 0 1 0 1 1 ... 
1 0 0 0 0 0 0]';
i4 = [1 0 0 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 1 1 1 0 0 0 0 1 0 0 0 0 ... 
1 0 0 0 0 0 0]';
i5 = [0 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 0 0 0 0 1 0 0 0 0 1 1 1 1 ... 
1 1 0 0 0 0 0]';
i6 = [0 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 ... 
1 1 0 0 0 0 0]';
i7 = [0 1 1 1 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 ... 
0 0 0 0 0 0 0]';
i8 = [0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 0 1 1 ... 
1 0 0 0 0 0 0]';
i = [i1 i2 i3 i4 i5 i6 i7 i8];
% Initialise output vectors 
o1 = [1 0 0 0 0 0 0 0]';
o2 = [0 1 0 0 0 0 0 0]';
o3 = [0 0 1 0 0 0 0 0]';
o4 = [0 0 0 1 0 0 0 0]';
o5 = [0 0 0 0 1 0 0 0]';
o6 = [0 0 0 0 0 1 0 0]';
o7 = [0 0 0 0 0 0 1 0]';
o8 = [0 0 0 0 0 0 0 1]';
o = [o1 o2 o3 o4 o5 o6 o7 o8];
% Define the structure of feedforward neural network
net = newff(i,o,[15, 15],{'logsig','logsig'},'trainlm');
% Training parameters
net.trainParam.show = 100;
% net.trainParam.lr = 0.5; % ne važi za 'trainlm'
net.trainParam.mu = 0.01; % parametar u?enja
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.divideParam.trainRatio = .7;
net.divideParam.valRatio = .15;
net.divideParam.testRatio = .15;
% Initialise training
net = train(net,i,o);
% View training results 
y = sim(net,i(:,:));