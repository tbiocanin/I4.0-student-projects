function [novi_polozaj, nova_mat_kov] = kalmanFilterPredikcija(prethodni_polozaj, prethodna_mat_kov, delta_s_desno, delta_s_levo, b)
    
    teta_nula = prethodni_polozaj(3, 1);
    l = 4; % udaljenost senzora od centra robota
    delta_teta = (delta_s_desno - delta_s_levo)/b;
    delta_s = (delta_s_desno + delta_s_levo)/2;
    
    %peglaja - novi polozaj koji je falio
    novi_polozaj(1,1) = prethodni_polozaj(1,1) + delta_s*cos(teta_nula + delta_teta/2);
    novi_polozaj(2,1) = prethodni_polozaj(2,1) + delta_s*sin(teta_nula + delta_teta/2);
    novi_polozaj(3, 1) = prethodni_polozaj(3,1) + delta_teta;
    %jakobijan po polozaju
    Gt = [1 0 -sin( (teta_nula + delta_teta/2) ) * delta_s;
          0 1 cos( (teta_nula + delta_teta/2) ) * delta_s;
          0 0 1];
      
    %jakobijan po upravljanju
    
    Ut = [cos(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))/2 - (sin(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))*(delta_s_levo/2 + delta_s_desno/2))/(2*b), cos(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))/2 + (sin(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))*(delta_s_levo/2 + delta_s_desno/2))/(2*b);
          sin(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))/2 + (cos(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))*(delta_s_levo/2 + delta_s_desno/2))/(2*b), sin(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))/2 - (cos(teta_nula - (delta_s_levo - delta_s_desno)/(2*b))*(delta_s_levo/2 + delta_s_desno/2))/(2*b);
                                                                                                                                                    1/b,                                                                                                                                               -1/b];
    %matrica suma upravljanja
    size(Ut) 
    M = [abs(inv(delta_s_desno)) 0; 0 abs(inv(delta_s_levo))];
    
    %matrica kovarijansi 
    
    nova_mat_kov = Gt * prethodna_mat_kov * Gt' + Ut * M * Ut';
    
end