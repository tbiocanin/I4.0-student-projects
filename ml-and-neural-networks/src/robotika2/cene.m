% skripta za proracun cena 

function cena_izlaz = cene(koord_start, koord_cilja, tip_heuristike, heuritika_vrednost)
      
%     dodatni argument da vidi koja je heuristika u pitanju
      if tip_heuristike == 'euklid'
            cena_izlaz = euklid(koord_start, koord_cilja, heuritika_vrednost);
      elseif tip_heuristike == 'menheten'
            cena_izlaz = menheten(koord_start, koord_cilja, heuritika_vrednost);
      else 
          fprintf('Argument error');
      end 
end

function cena_menheten = menheten(koord_start, koord_cilja, heuritika_vrednost, slika)
%     prvo provera da li su prepreka ili nisu prepreka
      put = 0;
      tmp_koord = koord_start;
      cena_dijagonale = [];
      while(koord_cilja ~= tmp_koord)

        for i = tmp_koord(1, 1)-1:tmp_koord(1, 1)+1
            for j = tmp_koord(1, 2)-1:tmp_koord(1,2)+1
                
                if tmp_koord(1, 1) == i && tmp_koord(1,2) == j
                    continue

                elseif tmp_koord(1, 1) == i || tmp_koord(1,2) == j
                    cena_dijagonale(i, j) = 100 + put + heuritika_vrednost(i, j);
                    
                else
                    cena_dijagonale(i, j) = put + heuritika_vrednost(i, j);    

                    if slika(i,j)
                        cena_dijagonale(i,j) = cena_dijagonale(i,j) + 100;
                    end
                end


            end
        end

        min_cena = min(cena_dijagonale())
        
      end
%     deklaracija cena
      
end

function cena_euklid = euklid(koord_start, koord_cilja, tip_heuristike, heuritika_vrednost)


end