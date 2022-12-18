% Ovaj kod kopirajte na kraj koda za obucavanje mreze.
% Napomena: Ukoliko menjate ime mreze (sa "net" na nesto drugo), primenite i u ovom delu koda.

% Podesavanje izlaza iz mreze radi ocene tacnosti klasifikacije
[Value,Number]=max(sim(net,double(Test_Slike(:,:))));
Number=Number-1;

% Greska klasifikacije
cp = classperf(Test_klase,Number);
Greska =cp.ErrorRate

% Matrica odlucivanja
C = confusionmat(Test_klase,Number)

% Podesiti koliko zelite slika da vidite za test - mora biti deljivo sa 25
BrSlikaZaPrikaz= 50;
perm = randperm(10000, BrSlikaZaPrikaz);
for j=1:BrSlikaZaPrikaz/25
    figure()
    for i=1:BrSlikaZaPrikaz/2
        subplot(5,5,i)
        imshow(Test_Slike_Prikaz(:,:,perm((j-1)*(BrSlikaZaPrikaz/2)+i)))
        if Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i)) ~=Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i))
        title (['\color{red}Net=',num2str(Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i))),' Real=',num2str(Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i)))])
        else 
         title (['\color{blue}Net=',num2str(Number(perm((j-1)*(BrSlikaZaPrikaz/2)+i))),' Real=',num2str(Test_klase(perm((j-1)*(BrSlikaZaPrikaz/2)+i)))])    
        end
    end
end

% Mogucnosti za odabir Algoritama obucavanja i aktivacionih funkcija - - pokrenite redove ispod bez '%'
% help nntrain
% help nntransfer
% 