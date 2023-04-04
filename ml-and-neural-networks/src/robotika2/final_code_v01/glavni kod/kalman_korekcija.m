function [korig_polozaj, korig_mat_kov] = kalman_korekcija(l, m, Q, prethodni_polozaj, prethodna_kovarijansa)

    x_sensor = prethodni_polozaj(1,1) + l * cos(prethodni_polozaj(3,1));
    y_sensor = prethodni_polozaj(2,1) + l * sin(prethodni_polozaj(3,1));
    
    z_sensor = [x_sensor; y_sensor];
    
    H = [1 0 -l*sin(prethodni_polozaj(3,1));
          0 1 l*cos(prethodni_polozaj(3,1))];

    S = H * prethodna_kovarijansa * H' + Q;
    m = m';
    for i = 1:5
            z(:, i) = m(:, i) - z_sensor;
            N(i,1) = z(:, i)' * inv(S) * z(:, i);
    end

    kar_obj = min(N);
    
    k_pojacanje = prethodna_kovarijansa * H' * inv(S);
    korig_polozaj = prethodni_polozaj + k_pojacanje * z(:,N == kar_obj);
    
    korig_mat_kov = (eye(3) - k_pojacanje * H) * prethodna_kovarijansa;
end
