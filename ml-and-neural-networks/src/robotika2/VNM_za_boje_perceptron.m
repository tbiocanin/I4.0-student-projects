clc; clear all; close all

load("belaBoja.mat")
load("crnaBoja.mat")

bela = reshape(bela, [1, 500]);
crna = reshape(boje, [1, 500]);
initEmptyZeros = zeros(1, 500);

% Initialise input vectors
i1 = bela;
i2 = crna;

i = [i1 i2];

minimum = min(i);
maksimum = max(i);

for x = 1:length(i)
    i(x) = (i(x) - minimum)/(maksimum - minimum);
end

% Initialise output vectors
x1 = ones(1, 500); %bele boje
y1 = zeros(1, 500); %crne boje 

o=[x1 y1];

rng(0);

net = perceptron;
net = configure(net,i,o);

net = train(net,i,o);

%save("VNMbojaPERCEPTRON.mat","net");