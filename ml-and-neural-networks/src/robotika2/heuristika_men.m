function [h_vrednosti_men] = heuristika_men(slika,cilj)

    [rows, cols, nebitno] = size(slika);
    h_vrednosti_men = zeros(rows, cols);

    for i = 1:rows

        for j = 1:cols

            h_vrednosti_men(i,j) = abs(i - cilj(1,1)) + abs(j - cilj(1,2));


        end

    end

end