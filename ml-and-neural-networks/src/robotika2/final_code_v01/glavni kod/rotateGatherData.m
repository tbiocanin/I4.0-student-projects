clc, clear all 

myev3 = legoev3('usb');
ocitanUgao = [];
inkrement = 15;

%Komunkiacija sa motor, pazite na PORT!!! u koji je motor prikljucen ("A", "C")
mymotor1 = motor(myev3, 'D');              
mymotor2 = motor(myev3, 'C'); 

iterator = 1;
unetiUglovi = [];
while 1
    unos1 = int32(input('Uneti vrednost ugla za koliko ce se rotirati robot: '));
    if unos1 == -1
        break;
    end
    unetiUglovi(iterator) = unos1;
    [ rugao1,rugao2] = Rotate(unos1, mymotor1, mymotor2 );
    unos2 = int32(input('Uneti ocitanu vrednost ugla sa uglomera: '));
    
    ocitanUgao(iterator) = unos2;   
    iterator = iterator + 1;    
end