#include <iostream>
#include <vector>

int broj_pojavljivanja(std::vector<int> a,
                int i, int x)
{
    if (i == a.size()) {
        return 0;
    }

    int broj_pojavljivanja_ostatak_niza =
            broj_pojavljivanja(a, i + 1, x);

    if (a[i] == x) {
        return broj_pojavljivanja_ostatak_niza + 1;
    }
    else {
        return broj_pojavljivanja_ostatak_niza;
    }
}

void broj_pojavljivanja_v2(std::vector<int> a,
                    int i, int x, int &brojac)
{
    if (i == a.size()) {
        return ;
    }

    broj_pojavljivanja_v2(a, i + 1, x, brojac);
    if (a[i] == x) {
        brojac++;
    }
}

int main ()
{
    std::vector<int> a = {2, 1, 1, 3, 4};

    int x = 1;

    std::cout <<
        broj_pojavljivanja(a, 0, x) << "\n";

    int brojac = 0;
    broj_pojavljivanja_v2(a, 0, x, brojac);
    std::cout << brojac << "\n";
    return 0;
}