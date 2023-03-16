%deklaracija pocetnih vrednosti 
x_pocetak = [0; 0; -90];


[x_translatorno, y_translatorno, teta_izlaz, delta_s_levo, delta_s_desno] = simulacija_kretanja(x_pocetak);

%definicija ulaznih vektora
i1 = x_translatorno';
i2 = y_translatorno';
i3 = teta_izlaz';
%definicija izlaznih vektora
o1 = delta_s_levo';
o2 = delta_s_desno';

%formatiranje vektora ulaza i izlaza
i = [i1 i2 i3]';
o = [o1 o2]';

%treniranje i verifikacija rezultata
% Define the structure of feedforward neural network
net = newff(i,o,[30, 15],{'purelin','logsig'},'trainoss');
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

%plot(x_translatorno, y_translatorno);
%plot(y(1, :), y(2, :));
%hold on
%plot(o1', o2', 'r')
%title('Validacija rezultata')
%xlabel('Kretanje po x osi')
%ylabel('Kretanje po y osi')
%legend('Simulirana trajektorija', 'Naucena trajektorija')