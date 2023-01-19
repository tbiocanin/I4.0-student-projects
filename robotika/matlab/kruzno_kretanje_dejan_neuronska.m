x = 0;
y = 0;
teta = 0;
b = 20;
R = 10;
n = 180;

%konstante

ulaz = [x y teta];



sd =  ones(1,n) .* (R + b/2) .* 2.*pi/180 + 0.01 .* randn(n,1)';
sl =  ones(1,n) * (R - b/2) * 2*pi/180 + 0.01 * randn(n,1)';

izlaz = zeros(3,n);

for i = 1:n
    
    ulaz = kretanje_modela(ulaz, sd(i), sl(i), b);
    izlaz(:,i) = transpose(ulaz);
    
end

% plot(izlaz(1,1:n),izlaz(2,1:n));


x_koord = zeros(1,n);
y_koord = zeros(1,n);
teta_koord = zeros(1,n);

for i = 1:n 
    x_koord(:,i) = izlaz(1,i);
    y_koord(:,i) = izlaz(2,i);
    teta_koord(:,i) = izlaz(3,i);
end

% x1=zeros(1,n);
% y1=zeros(1,n);
% teta1=zeros(1,n);

% Initialise input vectors
i1 = x_koord';
i2 = y_koord';
i3 = teta_koord';
i4 = sd';
i5 = sl';
i = [i1 i2 i3 i4 i5]';

% Initialise output vectors
x1 = ((sd + sl)/2).*cos(teta0 +(sd - sl)/(2.*b));
y1 = ((sd + sl)/2).*sin(teta0 +(sd - sl)/(2.*b));
teta1 = ((sd - sl)/b);
o=[x1; y1; teta1];

% Define the structure of feedforward neural network
net = newff(i,o,[10,8],{'logsig','logsig'},'trainlm'); %net je samo naziv mreze, tj promenljive
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

% Initialise training
net = train(net,i,o);
% View training results
TRENING = sim(net,i(:,:));

plot(x_koord, y_koord, 'b')
hold on
plot(x1, y1, 'red')

% plot(x,y,'b')
% hold on
% plot(x,y1,'r')

