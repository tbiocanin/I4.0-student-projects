function [x_translatorno, y_translatorno, teta_izlaz, delta_s_levo_izlaz, delta_s_desno_izlaz] = simulacija_kretanje_funkcija(x_pocetno)

    b = 20;  
    xu = -10:0.1:10; 
    yu(1) = 2*cos(xu(1)) - cos(xu(1)/2 + pi/2)  + 10;
    tetau(1) = 0; 

    Dtetau = 0; 
    for i = 2:200 
        yu(i) = 2*cos(xu(i)) - cos(xu(i)/2 + pi/2)  + 10; 
        tetau(i) = atand((yu(i)-yu(i-1))/(xu(i)-xu(i-1))); 
        su(i) = sqrt((xu(i)-xu(i-1))^2 + (yu(i)-yu(i-1))^2); 
        Dtetau(i) = tetau(i) - tetau(i-1); 
    end

    x(1) = xu(1); 
    y(1) = yu(1); 
    teta(1) = tetau(1); 
    sd(1) = su(1) + 0.5*b*Dtetau(1);
    sl(1) = su(1) - 0.5*b*Dtetau(1); 
    izlaz(1:5,1) = [x(1);y(1);teta(1);sd(1);sl(1)]; 

    for i = 2:200 
        sd(i) = su(i) + 0.5*b*Dtetau(i) + randn*0.05; 
        sl(i) = su(i) - 0.5*b*Dtetau(i) + randn*0.05; 
        x(i) = x(i-1) + 0.5*(sd(i)+sl(i))*cosd(teta(i-1) + (sd(i)-sl(i))/(2*b)); 
        y(i) = y(i-1) + 0.5*(sd(i)+sl(i))*sind(teta(i-1) + (sd(i)-sl(i))/(2*b)); 
        teta(i) = teta(i-1) + (sd(i)-sl(i))/b; 
        izlaz(:,i) = [x(i);y(i);teta(i);sd(i);sl(i)]; 
    end

    x_translatorno = izlaz(1, :);
    y_translatorno = izlaz(2, :);
    teta_izlaz = izlaz(3, :);
    delta_s_desno_izlaz = izlaz(4, :);
    delta_s_levo_izlaz = izlaz(5, :);
end