function [menhetn_slika] = menhetn_putanja(slika, h_vrednosti,start, cilj)

%posto je slika crno bela i nema vise dimenzija ovo je mozda 
%nuzna stvar koja mora da se uradi da bi se iscrtala putanja

%menhetn_slika = cat(3, slika, slika, slika); 

trenutne_koord = start;
put = 0;
matrica_cena = ones(3,3) * 1000;

cena_dijagonale = 100;
cena_prepreke = 100;


while trenutne_koord ~= cilj

    for i = trenutne_koord(1,1)-1:trenutne_koord(1,1)+1
        for j = trenutne_koord(1,2)-1:trenutne_koord(1,2)+1

            if i < 1 || j < 1
                continue
            end
             
            if trenutne_koord(1,1) == i && trenutne_koord(1,2) == j
                continue
            
            elseif trenutne_koord(1,1) == i || trenutne_koord(1,2) == j
                matrica_cena(i,j) = put + cena_dijagonale +  h_vrednosti(i,j);

            else 
                
                
                if slika(i,j) > 0  %ako je piksel crne boje; if true
                    matrica_cena(i,j) = put + cena_prepreke +  h_vrednosti(i,j);
                    put = put + 1;
                else 
                    matrica_cena(i,j) = put +  h_vrednosti(i,j);
                    put = put + 1;
                end
            end

        end
    end
    

    menhetn_slika(i, j, 1) = 255; %oboji crveno 
    menhetn_slika(i, j, 2) = 0;
    menhetn_slika(i, j, 3) = 0;

    imshow(menhetn_slika)

    %trazenje indeksa minimuma
    [matrica_cena_mins, idx] = min(matrica_cena);
    [matrica_cena_min, matrica_cena_j] = min(matrica_cena_mins);
    matrica_cena_i = idx(matrica_cena_j);

    trenutne_koord = [matrica_cena_i, matrica_cena_j];
    
    matrica_cena = ones(3,3) * 1000;

end