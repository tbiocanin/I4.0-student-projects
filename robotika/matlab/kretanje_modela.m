function [trenutni_polozaj] = kretanje_modela(x, raz_sl, raz_sd, b)
    
   
    sledeci_pol_1 = ((raz_sl + raz_sd)/2) * cos(x(3) + (raz_sl - raz_sd)/(2*b));
    sledeci_pol_2 = ((raz_sl + raz_sd)/2) * sin(x(3) + (raz_sl - raz_sd)/(2*b));
    sledeci_pol_3 = (raz_sl - raz_sd)/b;
    trenutni_polozaj = x + [sledeci_pol_1 sledeci_pol_2 sledeci_pol_3];

       

end

