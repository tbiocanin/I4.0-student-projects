#include <iostream> 

using namespace std;
// koncept lenjeg izracunavanja -> kada imamo uporedjivanje sa logicko 'i', i ako je prvi uslov F, ne gleda drugi uslov

void f(int *x) {
    x = 10;
}

int main() {

    // cout << "hello world";
    // prenos parametara po adresi i po vrednost -> sledi fora vezana za ovo 

    int x = 4;

    f(&x); // ocu adresu batko, ovde moze da se izostavi apmersent ali da se stavi ampersent u voidu i u njenom bloku
    // slanje po referenci je zgodno za velike podatke, da se ne bi kopiralo i time kocilo kod (primer, poslati sa i bez reference da bi video razliku)
// kada stavimo const onda registar udje u read only mod
    cout << x << "\n";

    return 0;
}