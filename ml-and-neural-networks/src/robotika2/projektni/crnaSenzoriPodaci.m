clc, clear all

myev3 = legoev3('usb');
boje = zeros(5, 100);
prompt = "";
% COLOR SENZOR - OPTICKI SENZOR

mycolorsensor = colorSensor(myev3); % Uspostavljanje komunkacije sa color senzorom

%color = readColor(mycolorsensor); %u promeljivu "color" pise naziv boje

%Komunkiacija sa motor, pazite na PORT!!! u koji je motor prikljucen ("A", "C")
mymotor1 = motor(myev3, 'D');              
mymotor2 = motor(myev3, 'C'); 


% Resetovanje enkodera - Vracanje na 0
resetRotation(mymotor1);                    
resetRotation(mymotor2);

SPEED =20;  

mymotor1.Speed = SPEED; % Podesavanje brzine motora
mymotor2.Speed = -SPEED;

% sto clanova crne boje 
for i=1:100
    boje(1, i)=readLightIntensity(mycolorsensor, 'reflected');
    %pause(0.2)
end 

fprintf("uneti y za nastavak prikupljanja \n")
ulaz = input(prompt, "s");

if ulaz == "y"
end

%crna-like boja, nijanse
for i=1:100
    boje(2, i)=readLightIntensity(mycolorsensor, 'reflected');
    %pause(0.2)
end

fprintf("uneti y za nastavak prikupljanja \n")
ulaz = input(prompt, "s");

if ulaz == "y"
end

%bela boja, nijanse
for i=1:100
    boje(3, i)=readLightIntensity(mycolorsensor, 'reflected');
    %pause(0.2)
end

fprintf("uneti y za nastavak prikupljanja \n")
ulaz = input(prompt, "s");

if ulaz == "y"
end

%crna-like boja, nijanse
for i=1:100
    boje(4, i)=readLightIntensity(mycolorsensor, 'reflected');
    %pause(0.2)
end

fprintf("uneti y za nastavak prikupljanja \n")
ulaz = input(prompt, "s");

if ulaz == "y"
end

%crna-like boja, nijanse
start(mymotor1); % Start motora
start(mymotor2);
for i=1:100
    boje(5, i)=readLightIntensity(mycolorsensor, 'reflected');
    %pause(0.2)
end
stop(mymotor1, 0);
stop(mymotor2, 0);
