function h_vrednosti_euklid = heuristika_euklid(slika,cilj)

    [rows, cols, nebitno] = size(slika);
    h_vrednosti_euklid = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols

            h_vrednosti_euklid(i,j) = sqrt((i - cilj(1,1)).^2 + (j - cilj(1,2)).^2);

        end

    end

    
    
end