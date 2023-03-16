% model kretanja 
function [novi_polozaj] = modelKretanja(prethodn1Polozaj, delta_s_desno, delta_s_levo)
    %parametri
    b = 11.5;
    delta_s = (delta_s_levo + delta_s_desno)/2;
    x_tmp = zeros(3, 10);
    %3x1 vektor kao ulaz za 1n1c1jal1zac1ju
    x_tmp(1:3, 1) = prethodn1Polozaj;


    
    x_tmp(:, 1) = x_tmp(:, 1) + [delta_s * cos( x_tmp(3, 1) + ( delta_s_desno - delta_s_levo )/( 2 * b ) );
                   delta_s * sin( x_tmp(3, 1) + (delta_s_desno - delta_s_levo)/( 2 * b ) );
                   (delta_s_desno - delta_s_levo)/b];
               
    novi_polozaj = x_tmp;
end