#include <iostream>
#include <vector>

int max_element(std::vector<int> niz) {
    int max = niz[0];
    int n = niz.size();
    for (int i = 1; i < n; i++) {
        if (niz[i] > max) {
            max = niz[i];
        }
    }
    return max;
}

int suma(std::vector<int> niz) {
    int zbir;
    int n = niz.size();
    for (int i = 0; i < n; i++) {
        zbir += niz[i];
    }

    return zbir;
}

void ispisi(std::vector<int> a)
{
    for (int x : a) {
        std::cout << x << " ";
    }
    std::cout << "\n";
}

bool da_li_postoji(std::vector<int> niz, int x)
{
    for (int broj : niz) {
        if (broj == x) {
            return true;
        }
    }
    return false;
}

int prebroj_parne(std::vector<int> niz)
{
    int brojac = 0;

    for (int x : niz) {
        if (x % 2 == 0) {
            brojac = brojac + 1; // brojac += 1, brojac++
        }
    }

    return brojac;
}

double prosek_neparnih(std::vector<int> niz)
{
    double brojac = 0.0;
    int suma = 0;

    for (int x : niz) {
        if (x % 2 == 1) {
            brojac++;
            suma += x;
        }
    }

    return suma / brojac;
}

int main ()
{
    // std::vector<int> niz = {1,42};

    int n, x;
    std::vector<int> niz = {1,4,3,6,7,8,2};

    // std::cout << std::boolalpha << da_li_postoji(niz, 12) << "\n";

    // std::cout << max_element(niz) << "\n";

    // std::cout << suma(niz) << "\n";

    // std::cout << prebroj_parne(niz) << "\n";

    std::cout << prosek_neparnih(niz) << "\n";
    return 0;
}