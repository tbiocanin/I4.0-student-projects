clear all, clc
myev3 = legoev3('usb');

%Komunkiacija sa motor, pazite na PORT!!! u koji je motor prikljucen ("A", "C")
mymotor1 = motor(myev3, 'D');              
mymotor2 = motor(myev3, 'C'); 

[ r1,r2] = GoStraight(60, mymotor1, mymotor2 )

[ rugao1,rugao2] = Rotate(90, mymotor1, mymotor2 )