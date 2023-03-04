#include <iostream> 

using namespace std;

// rekurzije

// najbaczicniji primer rekurzije 
void f(int x) {
    if (x == 1) {
        return; 
    }

    cout << x << endl;
    cout << "Pre" << endl;
    f(x-1);
    cout << "posle" << endl;
    cout << x << endl;
}

int faktorijel(int x) {

    if(x==1) {
        return 1;
    }
    // int faktorijel_x_minus_1 = faktorijel(x-1);
    // cout << "x: " << x << " (x-1)!: "<< faktorijel_x_minus_1 << endl;
    // int faktorijel_x = x * faktorijel_x_minus_1;

    return x * faktorijel(x-1);
}

int suma_n_broja(int n) {

    if(n == 0) {
        return 0;
    }

    // int suma_n = n + suma_n_broja(n-1);
    // odstampaj redom vrednosti cisto da steknes intuiciju o tome kako se menjaju vrednosti
    return n + suma_n_broja(n-1);
}

int suma_dekadnih_cifara(int n) {

    if(n / 10 == 0) {
        return n;
    }

    int cifra = n%10;
    int suma_ostatka = suma_dekadnih_cifara(n/10);
    return cifra + suma_ostatka;
}

int main() {


    int x;
    cout << "Uneti neku vrednost" << endl; 
    cin >> x;
    int suma = suma_dekadnih_cifara(x);
    cout << "suma unosa sa konzole je ovo: " << suma << endl;
    system("pause");
    return 0;
}