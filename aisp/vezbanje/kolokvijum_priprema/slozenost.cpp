#include <iostream> 
#include <vector>

using namespace std;

void nedostajuci_broj() {

    int ulaz; int clanovi; int suma = 0;
    int ulazni_niz;

    cout << "Uneti duzinu niza: " << endl;
    cin >> ulaz;

    for(int i = 0; i < ulaz; i++) {
        cin >> clanovi;
        suma += clanovi;
    }

    ulazni_niz = ulaz * (ulaz + 1) / 2;

    cout << "nedostaje broj: " << ulazni_niz - suma << endl;

}

void broj_deljivih_na_intervalu() {
    // linearna pretraga

    int a, b, k;
    int suma = 0;
    cout << "Uneti redom a, b i k" << endl;
    cin >> a; cin >> b; cin >> k;

    for(int i = a; i < b; i += k) {
        if (i%k == 0) {
            suma +=1;
        }
    }
    cout << "U intervalu [a, b] ima " << suma << " brojeva deljivih sa " << k << endl;
}

void broj_deljivih_na_intervalu_v2() {
    int a, b, k;
    cout << "Uneti redom a, b i k" << endl;

    cin >> a; cin >> b; cin >> k;

    int max = b/k;
    int min = a%k == 0 ? a/k : a/k + 1;

    int broj = max>=min ? max-min+1 : 0;
    cout << broj << endl;
}
int main() {

    broj_deljivih_na_intervalu_v2();

    system("pause");
    return 0;
}