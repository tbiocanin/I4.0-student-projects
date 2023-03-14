#include <iostream>
#include <vector>

int max_niza(std::vector<int> a, int i)
{
    if (i == a.size() - 1) {
        return a[i];
    }

    int max_ostatka_niza = max_niza(a, i + 1);
    std::cout << "niz: ";
    for (int j = i; j < a.size(); j++) {
        std::cout << a[j] << " ";
    }
    if (a[i] > max_ostatka_niza) {
        std::cout << "max: " << a[i] << "\n";
        return a[i];
    } else {
        std::cout << "max: " << max_ostatka_niza << "\n";
        return max_ostatka_niza;
    }
}

int main ()
{
    std::vector<int> a = {3, 2, 1, 4, 21};

    int max = max_niza(a, 0);
    std::cout << "\n\nmax niza: " << max;
    return 0;
}