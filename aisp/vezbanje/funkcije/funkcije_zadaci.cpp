// zadaci vezani za funkcije, zbirka sa matfa (prog1); prva funkcija je uvek glavna implementacija zadatka, druga je poziv kako bi se sacuvala dodatna logika pri radu
#include <iostream> 

using namespace std; 
/// @brief 1.4.1 - za tri uneta broja, kao arg ove fje, vratiti minimum 
/// @param x 
/// @param y 
/// @param z 
/// @return 
int min(int x, int y, int z) {

    int min = x;

    if(min > y) {
        min = y;
    } 

    if(min > z) {
        min = z;
    }

    return min;
}

/// @brief 1.4.2 - za neki decimalni broj, stampa samo njegove decimale, zakruzene na 6 cifara
/// @param x 
/// @return 
float razlomljeni_deo(float x) {

    float decimale;

    decimale = x - (int)x;

    return decimale;
}

int je_stepen(unsigned x, unsigned n) {
    int stepen = 0;

    if(x%n != 0) {
        return -1;
    }

    while(x > 1) {
        // stepen++;
        if(x%n == 0)
            x /= n;
        else 
            break;
        stepen++;
    }

    return stepen;
}

void init_je_stepen() {

    unsigned int baza, stepen_provera;

    cout << "Uneti dva broja: " << endl;
    cin >> baza; cin >> stepen_provera;

    int stepen = je_stepen(baza, stepen_provera);

    if(stepen == -1) {
        cout << "Broj " << stepen_provera << " nije stepen broja " << baza << endl;
    } else {
        cout << "Jeste: " << baza << " = " << stepen_provera << "^" << stepen << endl;
    }
   
}

/// @brief racuna sumu 1/n brojeva
/// @param n 
/// @return 
float zbir_reciprocnih(int n) {

    if(n < 1) {
        cout << "Neispravan unos" << endl;
        return 0;
    }

    float suma = 0;
    for(float i = 1; i < n; i++){
        suma += 1/i;
    }

    return suma;
}

void poziv_zbir_reciprocnih() {

    int ulaz;
    cout << "Unesite broj n: " << endl;
    cin >> ulaz;
    printf("Zbir reciprocnih: %.2f \n", zbir_reciprocnih(ulaz));
}

/// @brief 1.4.7 ovim pristupom kucam na O(n), sigurno moze i bolje od toga
/// @param x 
/// @return broj koliko se puta pojavio x
int prebrojavanje(float x) { 

    float unos_korisnika;
    int broj_ponavljanja = 0;
    cout << "Unesite brojeve: " ;
    while(true) {
        cin >> unos_korisnika;

        if(x == unos_korisnika) 
            broj_ponavljanja++;
        if(unos_korisnika == 0) 
            break;
    }
    return broj_ponavljanja;
}

void poziv_prebrojavanja() {
    float unos_za_proveru;
    cout << "Unesite broj x: " << endl;
    cin >> unos_za_proveru;
    cout << "Broj ponavljanja broja " << unos_za_proveru << ": " << prebrojavanje(unos_za_proveru) << endl;
}

/// @brief zadatak 1.1.2 resen, ali uz pomoc fja, kub i kvadrat fje
/// @return 
int kvadrat(int ulaz) {
    return ulaz*ulaz;
}

int kub(int ulaz) {
    return ulaz*ulaz*ulaz;
}

void poziv_kvadrat_kub() {
    
    int ulaz;
    cout << "Unesi neki broj: ";
    cin >> ulaz; 

    cout << "Kvadrat tog broja je: " << kvadrat(ulaz) << " , a kub tog broja je: " << kub(ulaz) << endl;
}

/// @brief nalazi apsolutnu vrednost negativnog broja
/// @param ulaz 
/// @return 
float apsolutna_vrednost(float ulaz) {

    if(ulaz >= 0) {
        return ulaz;
    } else if (ulaz < 0) {
        return -ulaz;
    }

    // return 0;
}

void poziv_apsolutna_vrednost() {
    float ulaz;
    cout << "Uneti neki broj: ";
    cin >> ulaz;
    printf("%.2f \n", apsolutna_vrednost(ulaz));
}

/// @brief racuna x^n
/// @param x 
/// @param n 
/// @return rezultat x^n
float stepen(float x, int n) {

    for(int i = 1; i <= n; i++)
        x = x * x;

    return x;
}

void poziv_stepen() {
    float baza; int stepen_unos;

    cout << "Uneti vrednosti za bazu i stepen: " << endl;
    cin >> baza; cin >> stepen_unos; 

    cout << "Broj " << baza << " na " << stepen_unos << " je " << stepen(baza, stepen_unos) << endl;
}

/// @brief racuna aritmeticku sredinu cifara celobrojnog broja n
/// @param n 
/// @return 
float aritmeticka_sredina(int n) {

    int za_narednu_iteraciju, trenutna_cifra;
    float suma = 0, iterator = 0;

    while(true) {

        trenutna_cifra = n % 10;
        suma += trenutna_cifra;
        cout << suma << endl;

        n = n / 10;

        iterator++;
        cout << iterator << endl;

        if(n == 0) {
            break;
        }
        
    }

    return suma/iterator;
}
void aritmeticka_sredina_poziv() {

    int ulaz; 

    cout << "uneti neki ceo broj: ";
    cin >> ulaz;

    printf("Aritmeticka sredina cifara je: %.3f", aritmeticka_sredina(ulaz));


}

/// @brief proverava da li se cifra c sadrzi u broju n
/// @param n 
/// @param c 
/// @return 1 ako sadrzi, 0 ako ne
int sadrzi(int n, int c) {

    int za_narednu_iteraciju, trenutna_cifra;
    int iterator = 0;

    if(n < 0)
        n = -n;

    while(true) {

        trenutna_cifra = n % 10;

        n = n / 10;


        if(c == trenutna_cifra)
            return 1;

        if(n == 0) {
            break;
        }
        
    }
    return 0;
}

void sadrzi_poziv() {

    int broj, cifra;
    cout << "Unesite broj i cifru: ";
    cin >> broj; cin >> cifra;

    if (cifra > 9 || cifra < 0)
        cout << "Neispravan unos" << endl;
    else {
        if(sadrzi(broj, cifra)) 
            cout << "Cifra " << cifra << " se nalazi u zapisu broja " << broj << endl;
        else
            cout << "Cifra " << cifra << " se ne nalazi u zapisu broja " << broj << endl; 
    }


}

int main() {

    sadrzi_poziv();
    system("pause");
    return 0;
}