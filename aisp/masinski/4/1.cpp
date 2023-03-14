#include <iostream>

// 123 % 10 = 3
// 130 % 10 = 0
int suma_cifara(int x)
{
    if (x / 10 == 0) {
        return x;
    }

    // 123
    // 3 + suma(12)
    int cifra = x % 10;
    int suma_ostatka = suma_cifara(x / 10);
    std::cout << "x: " << x << " cifra: " << cifra
    << " suma ostatka: "
    <<  suma_ostatka << "\n";
    return cifra + suma_ostatka;
}

int suma(int n) {
    if (n == 0) {
        return 0;
    }

    int suma_n_1 = suma(n - 1);
    int suma_n = n + suma_n_1;

    std::cout << "suma(" << n << ") = " << n
    << " + " << suma_n_1 << "\n";
    return suma_n;
}

int main ()
{
    int x;
    std::cin >> x;
    std::cout << suma_cifara(x) << "\n";
    return 0;
}