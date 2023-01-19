
    clc, clear all, close all
    x_pocetno=[0 0 0];
    b = 200;
    R = 100;
    n=100;
    alfa = 4*pi/180;
    delta_s_levo = ones(1, 100) * (R - b/2)*alfa; + randn(1, 100);
    delta_s_desno = ones(1, 100) * (R + b/2)*alfa; + randn(1, 100);

    % delta_s_levo_novox

    delta_s = (delta_s_levo + delta_s_desno)/2;
    x_novo = zeros(3, 100);
    x_novo(1:3, 1) = x_pocetno;


    for i = 2:100
        x_novo(:, i) = x_novo(:, i-1) + [(delta_s(1, i) * cos( x_novo(3, i-1) + ( delta_s_desno(1, i) - delta_s_levo(1, i) )/( 2 * b ) ));
                              (delta_s(1, i) * sin( x_novo(3, i-1) + (delta_s_desno(1, i) - delta_s_levo(1, i))/( 2 * b ) ) );
                              (delta_s_desno(1, i) - delta_s_levo(1, i))/b];
%         plot(x_novo(1, 1:i), x_novo(2, 1:i))
        
    end

    x_translatorno = x_novo(1, :);
    y_translatorno = x_novo(2, :);
    teta_izlaz = x_novo(3, :);
    
%     axis equal
%     hold on
%         plot(x_translatorno, y_translatorno)
%         xlabel('predjeni put u x-osi');
%         ylabel('predjeni put u y-osi')
%         legend('kruzna trajektorija')
%         title('predjeni put kruznog kretanja')
%     hold off
%     

    
    x_koord = zeros(1,n);
    y_koord = zeros(1,n);
    teta_koord = zeros(1,n);

for i = 1:n 
    x_koord(:,i) = x_translatorno(1,i);
    y_koord(:,i) = y_translatorno(1,i);
    teta_koord(:,i) = teta_izlaz(1,i);
end


% Initialise input vectors
i1 = x_koord;
i2 = y_koord;
i3 = teta_koord;
i4 = delta_s_desno;
i5 = delta_s_levo;
i = [i1 ;i2 ;i3];


% Initialise output vectors

% x1=zeros(1,n);
% y1=zeros(1,n);
% teta1=zeros(1,n);

% for k = 2:n
% x1(:,k) = x1(:,k-1)+((i4(k) + i5(k))/2).*cos(i3(:,k-1) +(i4(k) - i5(k))/(2.*b));
% y1(:,k) = y1(:,k-1)+((i4(k) + i5(k))/2).*sin(i3(:,k-1) +(i4(k) - i5(k))/(2.*b));
% teta1(:,k) = ((i4(k) - i5(k))/b);
% end
o1 = i4;
o2 = i5;
o=[o1; o2];

% Define the structure of feedforward neural network
net = newff(i,o,[8,5],{'logsig','logsig'},'trainlm'); %net je samo naziv mreze, tj promenljive
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


nulti = [0 0 0];
izlaz =zeros(3,n);

for i = 1:100
    
    kretanje = polozaj(nulti,o1(i),o2(i),b);
    izlaz(:,i) = transpose(kretanje);

end

plot(x_koord, y_koord, 'b')


hold on
plot(izlaz(1,:), izlaz(2,:), 'red')
axis equal
% plot(x,y,'b')
% hold on
% plot(x,y1,'r')

    

