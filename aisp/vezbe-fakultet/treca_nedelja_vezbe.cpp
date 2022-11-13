#include <iostream>
#include <vector>
// zadaci vezani za trecu nedelju vezbi - AISP, naci (uslov) element u nizu
using namespace std;

void primerIspitnog() { // primer ispitnog, a da je vezan za nizove

    int n; 

    cin >> n;
    vector<int> niz(n);

    for(int i = 0; i < n; i++) {
        cin >> niz[i];
    }

    for(int x : niz) {
        cout << x;
    }
}

int maxElementNiza(vector<int> niz) {
    
    int max = niz[0];
    int n = niz.size();

    for(int i = 0; i<n; i++) {
        if(niz[i] > max) {
            max = niz[i];
        }
    }

    return max;
}

void pushbackPrimer() {
    vector<int> a = {1, 42};

    cout << a.size() << endl;

    for(int x : a) {
        cout << x << " ";
    }
    cout << endl;

    a.push_back(34);

    cout << a.size() << endl;

    for(int x : a) {
        cout << x << " ";
    }
    cout << endl;

}

void drugiNacinUcitavanja() {
    int n, x;
    vector<int> niz;

    cin >> n;

    for(int i = 0; i < n; i++) {
        cin >> x;
        niz.push_back(x);
    }
}

// za potrebe zadataka smo uveli ovu funkciju kako ne bismo konstannto pisali ispis
void ispis(vector<int> a) {

    for(int x : a) {
        cout << x;
    }

    cout << endl;
}

bool da_li_postoji(vector<int> niz, int x) {

    for(int broj : niz) 
        if (broj == x) 
            return 1;
    
    return 0;
}

int kolicina_parnih_brojeva(vector<int> niz) {

    int broj_parnih_brojeva = 0;

    int n = niz.size();

    for(int i = 0; i < n; i++) 
        if(niz[i] % 2 == 0)
            broj_parnih_brojeva += 1;

    return broj_parnih_brojeva;
}

double prosek_neparnih_brojeva(vector<int> niz) {

    int broj_neparnih_parnih_brojeva = 0;
    int suma_neparnih = 0;

    int n = niz.size();

    for(int i = 0; i < n; i++) 
        if(niz[i] % 2 == 1){
            broj_neparnih_parnih_brojeva += 1;
            suma_neparnih += niz[i];
        }

    return suma_neparnih / broj_neparnih_parnih_brojeva;
}



int main() {

    // vector<int> niz(10); //deklaracija vektora, bez definicije. Sa definicijom bi bilo tako da bi mu dodelili neke elemente
    // // cout << niz[0] << endl;
    // // niz.push_back(7);

    // // prolazak kroz niz
    // int n = niz.size(); //bolja praksa, nego da je poziv fje u for petlji, i time da ne poziva fju u svakoj iteraciji
    // for(int i = 0; i < n; i++) {
    //     // cout << niz[i] << " ";
    //     // niz[i] = i + 1;
    //     cin >> niz[i];
    // }



    // cout << maxElementNiza(niz) << endl;



    system("pause");
    return 0;
}