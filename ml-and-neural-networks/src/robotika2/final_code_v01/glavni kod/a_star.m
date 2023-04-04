function [prethodni_polozaj, sl_korak] = a_star(xc, yc, xc_cilj, yc_cilj)
    load('matrica_okruzenje.mat');

% izlaz -> putanja i put
% ulaz -> xc(i),yc(i),xc(i+1),yc(i+1)
    %1 = beli piksel; 0 = crni piksel

    cilj = [xc_cilj, yc_cilj];
    start = [xc, yc];
    
    trenutne_koord = start;

    prethodni_polozaj = []; %popunjavam vektor da bi pamtio prethodne posecene
    predjeni_put = 0;

    dimenzije_matrica = size(MyGray);

    heuristic = zeros(size(MyGray));
    cena = zeros(size(MyGray));

    %popunjavam heuristiku kretanja
    for i = 1:dimenzije_matrica(1,1)
        for j = 1:dimenzije_matrica(1,2)
            %heuristic(i,j) = abs(j - cilj(2)) + abs(i - cilj(1)); %menhetn
            heuristic(i,j) = sqrt(( j - cilj(2))^2 + (i - cilj(1))^2); %euklid
        end
    end


    while not (cilj(1) == trenutne_koord(1) && cilj(2) == trenutne_koord(2)) 


    %popunjavanje cene kretanje u 8 piksela oko trenutnog polozaja
        for i = -1:1
            for j = -1:1
                    if MyGray(trenutne_koord(1) - i, trenutne_koord(2) - j) ~= 1 || (i == 0 && j == 0)
                        cena(trenutne_koord(1) - i, trenutne_koord(2) - j) =  100;

                    %dijagonale   
                    elseif abs(i) == abs(j) 
                            cena(trenutne_koord(1) - i, trenutne_koord(2) - j) = 1.41;
                    %gore/dole ...
                    else 
                         cena(trenutne_koord(1) - i, trenutne_koord(2) - j) =  1;
                end
            end
        end

        prethodni_polozaj = [prethodni_polozaj;trenutne_koord]; %popunjavam prethodne polozaje

        %popunjavanje cena prethodnih polozaja kako ne bi isao unazad
        for i = 1:size(prethodni_polozaj)
            cena(prethodni_polozaj(i,1), prethodni_polozaj(i,2)) = cena(prethodni_polozaj(i,1), prethodni_polozaj(i,2)) + 100;
        end

        ukupna_cena = heuristic + cena + predjeni_put;

        [red,kolona,vrednost] = find(cena); 
        red_kolona_vrednost = horzcat(red,kolona,vrednost); %indeksi okolnih piksela i njihovih cena
        [~, idx] = mink(red_kolona_vrednost(:), 3);
        [r, c] = ind2sub(size(red_kolona_vrednost), idx); %indeksi u RKV za minimume

        pot_korak = red_kolona_vrednost(r,[1,2]); %moguci sledeci koraci
        cena_koraka = ukupna_cena(trenutne_koord(1)-1:trenutne_koord(1)+1, trenutne_koord(2)-1:trenutne_koord(2)+1); %ukupna cena okolnih piksela


        [red_k,kolona_k,vrednost_k] = find(cena_koraka); 
        red_kolona_vrednost_koraka = horzcat(red_k,kolona_k,vrednost_k); %indeksi okolnih piksela i njihovih cena koraka u matrici 3x3
        [~, idx_k] = mink(red_kolona_vrednost_koraka(:,3), 3);
        [r_k, c_k] = ind2sub(size(red_kolona_vrednost_koraka), idx_k); %indeksi u RKV_K za minimume

        sl_korak = red_kolona_vrednost_koraka(r_k,[1,2])'; %moguci sledeci koraci
        %k = randi(size(sl_korak,1));                       %random bira neki od mogucih koraka
        %sl_korak = sl_korak(:,k);

        if sl_korak(1) == 1
            trenutne_koord(1) = trenutne_koord(1) - 1;
        elseif sl_korak(1) == 3
            trenutne_koord(1) = trenutne_koord(1) + 1;
        end

        if sl_korak(2) == 1
            trenutne_koord(2) = trenutne_koord(2) - 1;
        elseif sl_korak(2) == 3
            trenutne_koord(2) = trenutne_koord(2) + 1;
        end 
        predjeni_put = predjeni_put + 1;

        %refresuje cenu koraka za sledecu iteraciju (prethodno dijagonalno bi
        %imalo cenu 100 u suprotnom)
        cena = zeros(size(MyGray));
    end
    prethodni_polozaj = [prethodni_polozaj;trenutne_koord]; %popunjavam prethodne polozaje


    %pravim mapu kretanja na osnovu prethodnih polozaja
    mapa_kretanja = MyGray*255;

    for i = 1:size(prethodni_polozaj)
        mapa_kretanja(prethodni_polozaj(i,1),prethodni_polozaj(i,2)) = 122;
    end
        mapa_kretanja(trenutne_koord(1),trenutne_koord(2)) = 180;

%         imshow(mapa_kretanja)
end