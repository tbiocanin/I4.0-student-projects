% xc=[2 7 7 7];
% yc=[2 5 7 3];%

% xc=[2 7 7 7 2];
% yc=[2 5 7 3 2];%

% xc=[2 7 6 7 4 3];
% yc=[2 5 7 3 8 2];
%
% xc=[3 7 7 5 3];
% yc=[3 5 7 8 3];%

clc,clear,close all


%load BojeNet%!
%load RotNet%!

load ("VNMbojaBP.mat")
load ("ROTACIJA_MREZA.mat")
xc = [2 7 6];
yc = [2 4 7];

Xpiksel=10;
Ypiksel=10;%u cm

%%pocetak programa za kretanje

myev3 = legoev3('USB');
mycolorsensor = colorSensor(myev3);

mymotor1 = motor(myev3, 'D'); % Set up motor
mymotor2 = motor(myev3, 'C');
if myev3.BatteryLevel <=70
    disp ('Baterija na manje od 70% dopuniti')
end
S = [];%tu skupljamo vrednosti sa senzora u svakom pokretu napred
yp= [];
%x = [Putanja(1,1)*10 Putanja(1,2)*10 0/57.3]'

% x = [0 0 0/57.3]'%UKOLIKO SE OVDE MENJA POCETNI POLOZAJ, POTREBNO JE I OVDE UNETI TE VREDNOSTI

x = [xc(1)*Xpiksel yc(1)*Ypiksel 0/57.3]';

% 4 4 3.5 i 5.7
%x = [7 11.4 0/57.3]'

C = eye(3)*.1;


for i=1:(size(xc,2)-1)%cita broj kolona, a size(xc,1)cita broj vrsta
    [Putanja,Put]=a_star(xc(i),yc(i),xc(i+1),yc(i+1));
    
    % plot(Put(:,2),Put(:,1),'-*r','linewidth',2), hold on;
    % C = [.1 0 0; 0 .1 0; 0 0 1]
    b = 9.5; r = 2.15;
    QL = [0 0 ;0 0];
    Q = [100 0 ;0 100];
    
%     mapa1 = [20 12; 45 50; 20 85; 45 80];%!
    mapa1 = [25 22; 55 29.5; 62.5 57; 15 68; 31 90; 64 102];%!
    
    pathx = Putanja(1:end,1)*Xpiksel;%!
    pathy = Putanja(1:end,2)*Ypiksel;%!
    
    figure (1)
    
    %axis ([-20 110 -20 160]);
    plot_simulation_data(x, C), hold on;
    
    plot(pathx,pathy,'-*r','linewidth',4), hold on
    
    okruzenje_jupiter; hold on
    
    path=[pathx,pathy];
    
    sizpath = size(path,1);
    
    
    dmax =3; % Precnik kruznice u cijoj toleranciji se robot mora naci
    % posle svakog translatornog kretanja
    
    
    s = readLightIntensity(mycolorsensor,'reflected');
    
    s = (s - 3) / 75;
    Yp = sim(net,double(s))
    yp= [yp;Yp]
    
    
    for k = 1 : sizpath
        
        % StopMotor('all', 'off');
        % ResetMotorAngle(MOTOR_B); ResetMotorAngle(MOTOR_C);
        d_wp = ITS_compute_distance(x, path(k,:));
        fi_steer = ITS_compute_direction(x,path(k,:))*57.3;
        
        
        if abs(fi_steer) >= 15 % Podeisiti toleraciju rotacije
            %
            % if fi_steer <= 0
            % trrot = -100;
            % else trrot = 100;
            % end
            
            s = readLightIntensity(mycolorsensor,'reflected'); % Ukoliko je potrebno, dodati red za skaliranje
            s = (s - 3)/ 75;
            Yp =sim(net,double(s)); % Dodati mrezu umesto net
            yp= [yp;Yp];
            
            % Ovde uneti svoju mrezu umesto rot
            alrot = round(sim(rot,fi_steer));%round zaokruzuje na celobrojnu vrednost
         
            [MB,MC]=Rotate( alrot,mymotor1,mymotor2);
         
            
            stop(mymotor1,0); % Stop motor
            stop(mymotor2,0);
            
            dsl = MC/57.3*r; dsr = MB/57.3*r;
            M = [10^-5*abs(dsl) 0;0 10^-5*abs(dsr)];
            [x,C] = kalmanFilterPredikcija(x, C, dsr, dsl, b); % dodati svoj model kretanja
            
            plot_simulation_data(x, C),hold on;
            
            
            
            s = readLightIntensity(mycolorsensor,'reflected');% Ukoliko je potrebno, dodati red za skaliranje
            s = (s - 3)/ 75;
            Yp =sim(net,double(s));% Dodati mrezu umesto BlackOrWhite, u mrezu se ubaciju podaci tipa "double"
            yp= [yp;Yp];
            
        end%if
        
        while d_wp > dmax
%             C
         
            s = readLightIntensity(mycolorsensor,'reflected');%Ukoliko je potrebno, dodati red za skaliranje
            s = (s - 3)/ 75;
            Yp =sim(net,double(s));% Dodati mrezu umesto BlackOrWhite, u mrezu se ubaciju podaci tipa "double"
            yp= [yp;Yp]; % Podesiti uslov "Yp<0", u zavisnosti od obucavanja mreze za klasifikaciju boja
            if Yp<0.2 %vrsi korekciju polozaja ukoliko je senzor ''uocio'' referentni objekat iz mape
            
                [x,C]=kalman_korekcija(4,mapa1,Q,x, C);
          
            end
            % go straight forward
%             'Go str8'
            [MB,MC]=GoStraight( 4,mymotor1,mymotor2); % Podesiti iz koliko koraka robot predje zeljeni put
            stop(mymotor1,0); % Stop motor
            stop(mymotor2,0);
            
            dsl =MC/57.3*r; dsr = MB/57.3*r;
            
            M = [10^-5*abs(dsl) 0;0 10^-5*abs(dsr)]; % control uncertainty
            
            [x,C] = kalmanFilterPredikcija(x, C, dsr, dsl, b);% dodati svoj model kretanja    
            
            plot_simulation_data(x, C),hold on;
            
            s = readLightIntensity(mycolorsensor,'reflected');
            s = (s - 3)/ 75;
            Yp =sim(net,double(s));
            yp= [yp;Yp];
            
            
            if Yp<0.2% Podesiti uslov "Yp<0", u zavisnosti od obucavanja mreze za klasifikaciju boja
               
                [x,C] = kalman_korekcija(4,mapa1,Q,x, C);
           
            end
%             disp('posle go str8')
            d_wp = ITS_compute_distance(x, path(k,:));
            fi_steer = ITS_compute_direction(x,path(k,:))*57.3;
            
            if d_wp <dmax
                break;
            end
            if abs(fi_steer) >= 30
                
                
                s = readLightIntensity(mycolorsensor,'reflected');
                s = (s - 3)/ 75;
                Yp =sim(net,double(s));
                yp= [yp;Yp];
                % Ovde uneti svoju mrezu umesto rot
                alrot = round(sim(rot,fi_steer));%round zaokruzuje na celu vrednost
        
                [MB,MC]=Rotate( alrot,mymotor1,mymotor2);
               
                
                stop(mymotor1,0); % Stop motor
                stop(mymotor2,0);
                
                dsl = MC/57.3*r; dsr = MB/57.3*r;
                M = [10^-5*abs(dsl) 0;0 10^-5*abs(dsr)]; % control uncertainty
                [x,C] = kalmanFilterPredikcija(x, C, dsr, dsl, b);
                
                
                if Yp<0.2% Podesiti uslov "Yp<0", u zavisnosti od obucavanja mreze za klasifikaciju boja
 
           
                    [x,C] = kalman_korekcija(4,mapa1,Q,x, C);
 
                end
            end
            
            s = readLightIntensity(mycolorsensor,'reflected');
            s = (s - 3)/ 75;
            Yp =sim(net,double(s));
            yp= [yp;Yp];
            
            d_wp = ITS_compute_distance(x, path(k,:));
            fi_steer = ITS_compute_direction(x,path(k,:))*57.3;
            pause(1)
        end%while
        
        
        
    end
end%for
plot(pathx,pathy,'-*r','linewidth',2), hold off