x_pocetak = [0; 0; 0];

%[x_izlaz, y_izlaz, teta_izlaz] = simulacija_kretanja_kruzno(x_pocetak)

%test 
[x_izlaz, y_izlaz, teta_izlaz, delta_s_levo, delta_s_desno] = simulacija_kretanje_funkcija(x_pocetak)

%verifikacija funkcije
x_test = 0:1000;
y = 2*cos(x_test) + cos(x_test/2 + pi/2) + 10;
%plot(x_test, y)
plot(x_izlaz, y_izlaz)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%definicija ulaznih vektora
i1 = x_izlaz';
i2 = y_izlaz';
i3 = teta_izlaz';
%definicija izlaznih vektora
o1 = delta_s_levo';
o2 = delta_s_desno';

%formatiranje vektora ulaza i izlaza
i = [i1 i2 i3]';
o = [o1 o2]';

%treniranje i verifikacija rezultata
% Define the structure of feedforward neural network
net = newff(i,o,[30, 15],{'purelin','logsig'},'trainb');
% Training parameters
net.trainParam.show = 100;
% net.trainParam.lr = 0.5; % ne važi za 'trainlm'
net.trainParam.mu = 0.01; % parametar učenja
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
plot(x_izlaz, y(1, :), x_izlaz, y_izlaz);
title('Validacija rezultata')
legend('kruzno, simulirano', 'kruzno, nn nauceno')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%