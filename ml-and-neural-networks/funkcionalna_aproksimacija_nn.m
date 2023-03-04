%definicija ulaznog vektora
i = [];
%definicija izlaznog vektora
o = [];

%treniranje i verifikacija rezultata
% Define the structure of feedforward neural network
net = newff(i,o,[30, 15],{'purelin','logsig'},'trainb');
% Training parameters
net.trainParam.show = 100;
% net.trainParam.lr = 0.5; % ne vaÅ¾i za 'trainlm'
net.trainParam.mu = 0.01; % parametar uÄ?enja
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.divideParam.trainRatio = .7;
net.divideParam.valRatio = .15;
net.divideParam.testRatio = .15;
% Initialise training
net = train(net,i,o);
% View training results 
y = sim(net,i(:,:));

% plot(x_translatorno, y_translatorno);
hold on
plot(x_translatorno, y(2, :), x_kruzno, y_kruzno);
title('Validacija rezultata')
legend('kruzno, simulirano', 'kruzno, nn nauceno')