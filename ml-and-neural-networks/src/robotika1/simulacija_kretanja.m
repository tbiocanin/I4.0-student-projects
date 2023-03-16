function [x_translatorno, y_translatorno, teta_izlaz, delta_s_levo_izlaz, delta_s_desno_izlaz] = simulacija_kretanja(x_pocetno)

    b = 200;
    delta_s_levo = 10 + randn(1, 10);
    delta_s_desno = 10 + randn(1, 10);

    delta_s = (delta_s_levo + delta_s_desno)/2;
    x_novo = zeros(3, 10);
    x_novo(1:3, 1) = x_pocetno;


    for i = 2:10
        x_novo(:, i) = x_novo(:, i-1) + [delta_s(1, i) * cos( x_novo(3, i-1) + ( delta_s_desno(1, i) - delta_s_levo(1, i) )/( 2 * b ) );
                              delta_s(1, i) * sin( x_novo(3, i-1) + (delta_s_desno(1, i) - delta_s_levo(1, i))/( 2 * b ) );
                              (delta_s_desno(1, i) - delta_s_levo(1, i))/b];
        %plot(x_novo(1, :), x_novo(2, :))
    end

    x_translatorno = x_novo(1, :);
    y_translatorno = x_novo(2, :);
    teta_izlaz = x_novo(3, :);
    delta_s_levo_izlaz = delta_s_levo;
    delta_s_desno_izlaz = delta_s_desno;
    %plot(x_translatorno, y_translatorno)
    %axis equal
end

% randn()