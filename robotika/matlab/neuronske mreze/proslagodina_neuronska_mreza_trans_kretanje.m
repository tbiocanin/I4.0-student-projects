clc;clear; 
b = 20; 
x = 0:0; 
y = 0:0; 
teta = 0:0; 
V = zeros(5,11); 
T = {zeros(10,1)}; 
for j = 1:10 
x(1) = 0+randn*0.25; 
y(1) = 0+randn*0.25; 
teta(1) = -60; 
Dsl = 0:0; 
Dsd = 0:0; 
Dsl(1) = 10 + randn*0.5; %u mm 
Dsd(1) = 10 + randn*0.5; %u mm 
V(:,1) = [x(1);y(1);teta(1);Dsd(1);Dsl(1)]; 
for i= 2:11 
Dsl(i) = 10 + randn*0.5; %u mm 
Dsd(i) = 10 + randn*0.5; %u mm 
x(i) = x(i-1) + 0.5*(Dsd(i)+Dsl(i))*cosd(teta(i-1) + (Dsd(i)-Dsl(i))/(2*b)); 
y(i) = y(i-1) + 0.5*(Dsd(i)+Dsl(i))*sind(teta(i-1) + (Dsd(i)-Dsl(i))/(2*b)); 
teta(i) = teta(i-1) + (Dsd(i)-Dsl(i))/b; 
V(:,i) = [x(i);y(i);teta(i);Dsd(i);Dsl(i)]; 
end 
T{j} = V; 
%plot(T{j}(1,:),T{j}(2,:), '.') 
%title("Putanja robota"); 
%xlabel("x osa"); 
%ylabel("y osa"); 
%hold on; 
end 
a=[]; b=[]; c=[]; d=[]; e=[]; 
for i = 1:10 
T{1,i}; 
xx = T{1,i}(1,:); 
yy = T{1,i}(2,:); 
tetateta = T{1,i}(3,:); 
Dsd2=T{1,i}(4,:); 
Dsl2=T{1,i}(5,:); 
a=[a,xx]; 
b=[b,yy];
c=[c,tetateta]; 
d=[d,Dsd2]; 
e=[e,Dsl2]; 
end 
i = [a; b; c]; 
o = [d;e]; 
% Define the structure of feedforward neural network 
net = newff(i,o,[24 36 12],{'logsig' 'logsig' 'logsig'},'trainlm'); 
% Training parameters 
net.divideParam.trainRatio = 0.7; 
net.divideParam.valRatio = 0.2; 
net.divideParam.testRatio = 0.1; 
% Training parameters 
net.trainParam.show = 100; 
% net.trainParam.lr = 0.5; % ne važi za 'trainlm' 
net.trainParam.mu = 0.5; % parametar u?enja 
net.trainParam.max_fail = 1000; 
net.trainParam.epochs = 1000; 
net.trainParam.goal = 1e-4; 
% Initialise training 
net = train(net,i,o); 
% View training results 
y = sim(net,i(:,:));

plot(d,e)
