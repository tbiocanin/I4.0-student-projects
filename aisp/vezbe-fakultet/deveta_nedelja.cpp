#include <iostream>
#include <vector>
#include <algorithm>
#include <climits> 


// implementation of binary search algorithm and examples
using namespace std; 

bool binarna_pretraga(const vector<int> &a, int x) {

    int l = 0;
    int d = a.size() - 1; int s;

    while(l <= d) {
        s = (l + d)/2;

        if(a[s] == x) {
            return true;
        }

        if(a[s] > x) {
            d = s - 1;
        }

        if(a[s] < x) {
            l = s + 1;
        }
    }

    return false;
}

//za neki ulaz s, pronaci koliko parova elemenata daje zbir s

int broj_parova( const vector<int> &a, int s) {

    int n = a.size();
    int counter = 0;
    for(int i = 0; i < n; i++) {
        if(binary_search(a.begin(), a.end(), s-a[i]) == true)
            counter++;
    }

    return counter/2;
}

int broj_parova2( const vector<int> &a, int s) { //sitna, ali bitna promena

    int n = a.size();
    int counter = 0;
    for(int i = 0; i < n; i++) {
        if(binary_search(a.begin() + i + 1, a.end(), s-a[i]) == true)
            counter++;
    }

    return counter;
}

void parovi_zbira_binarna() {

    vector<int> a = {2, 5, 7, -2, 9, 3, 12, 4};

    int x; cin >> x;

    sort(a.begin(), a.end());

    cout << broj_parova(a, x) << endl;
    cout << broj_parova2(a, x) << endl;
}

void nasa_implementacija_binarne_pretrage() {

    vector<int> ulaz = {2, 7, 6, 9, 0, 1, 4};
    int x; 

    sort(ulaz.begin(), ulaz.end());
    cout << "Pronaci broj: ";
    cin >> x;

    cout << binarna_pretraga(ulaz, x) << endl;
    cout << binary_search(ulaz.begin(), ulaz.end(), x) << endl;
}

// tehnika dva pokazivaca //

//isti zadatak sa parovima koji daju neki zeljeni zbir, razmatramo samo razlicite elemente u nizu radi olaksane analize zadatka
int parovi_zbira_dva_pokazivaca( const vector<int> &a, int s ) {


    int counter = 0;
    int i = 0; int j = a.size() - 1;

    while(i < j) {
        if(a[i] + a[j] > s)
            j--;
        if(a[i] + a[j] == s)
        {
            i++; j++;
            counter += 1;
        }
        if(a[i] + a[j] < s)
            i++;
    }


    return counter;
}


void dva_pokazivaca_poziv() {
    vector<int> a = {2, 5, 7, -2, 9, 3, 12, 4};

    int x; cin >> x;

    sort(a.begin(), a.end());

    cout << parovi_zbira_dva_pokazivaca(a, x) << endl;
    cout << broj_parova2(a, x) << endl;

}

int blizanci(vector<int> a, vector<int> b) {

    // int min_razl;
    sort(a.begin(), a.end());
    sort(b.begin(), b.end());

    int i = 0, j = 0;

    int n = a.size(), m = b.size(); //broj elemenata petra i marije
    
    int min_razlika = INT_MAX;
    while(i < n && j < m){

        if(abs(a[i] - b[i] < min_razlika))
            min_razlika = a[i] - b[j];
        
        if(a[i] == b[j]){
            return 0;
        }

        if(a[i] < b[j])
            i++;
        else 
            j++;

    }

    return min_razlika;
}

void blizanci_poziv() {

    vector<int> p = {2120, 4680, 7940, 11530, 17820};
    vector<int> m = {850, 5770, 6300, 13420};

    cout << "Minimalna razlika je: " << blizanci(p, m) << endl;
}

int main() {



    blizanci_poziv();
    system("pause");
    return 0;
}