#include <iostream>
#include <vector>

using namespace std; 

int max_niza(vector<int> a, int i) {
    if(i == a.size() - 1) {
        return a[i];
    }

    int max_ostatak_niza = max_niza(a, i+1);
    if(a[i] > max_ostatak_niza) {
        return a[i];
    } else {
        return max_ostatak_niza;
    }
}

int skalarni_proizvod(vector<int> a, vector<int> b, int i) {
    if(i == a.size() - 1) {
        return a[i] * b[i];
    }

    int skalarni_u_ostatku = skalarni_proizvod(a, b, i+1);
    return a[i] * b[i] + skalarni_u_ostatku;
}

int broj_pojavljivanja(vector<int> a, int i, int unos) { // jedan nacin

    if(i == a.size() - 1) {
        return 0;
    }

    int br_poj_ostatak_niza = broj_pojavljivanja(a, i+1, unos);

    if(a[i] == unos) {
        return br_poj_ostatak_niza + 1;
    } else {
        return br_poj_ostatak_niza;
    }
}

void broj_pojavljivanja_v2(vector<int> a, int i, int x, int &brojac) {

    if(i== a.size()) {
        return ;
    }

    broj_pojavljivanja_v2(a, i+1, x, brojac);
    if(a[i] == x) {
        brojac++;
    }
}

int main() {

    vector<int> a = {2, 3, 5};
    vector<int> b = {1, 4, 6};

    cout << skalarni_proizvod(a, b, 0) << endl;

    system("pause");
    return 0;
}