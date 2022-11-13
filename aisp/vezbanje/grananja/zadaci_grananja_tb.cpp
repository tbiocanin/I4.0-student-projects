#include <iostream>

using namespace std; 
/// @brief 1.2.1
/// @param a 
void najmanji_od_tri_brojeva(int a[3]) {
    int min = a[0];
    if(a[0] > a[1]) {
        min = a[1];
    }

    if(a[0] > a[2]) {
        min = a[2];
    }

    cout << "Najmanji broj je " << min << endl;
}
/// @brief 1.2.2 za uneti realan broj ispisuje aps vrednost zaokruzen na dve dec
/// @param a 
void aps_vre() {
    double a;
    cout << "Uneti jedan realan broj" << endl;
    cin >> a;

    if(a < 0) {
        a = -a;
        printf("%.2f \n", a);
    } else {
        printf("%.2f \n", a);
    }  
}

/// @brief 1.2.3 za unetu vrednost, racuna reciprocnu vrednost na 4 decimale i izbacuje poruku za neispravni unos
void reciprocna_vre() {
    int ulaz;
    float reciprocna_vrednost;
    cout << "Uneti ceo proj n:" << endl;
    cin >> ulaz; 

    if(ulaz > 0 || ulaz < 0) {
        reciprocna_vrednost = 1.0 / ulaz;
        printf("%.4f \n", reciprocna_vrednost);
    }
    else { 
        cout << "Pogresan unos! \n"; 
    }
}

/// @brief 1.2.4 - za tri uneta cela broja, racuna se suma pozitivnih vrednosti
void suma_prirodnih_brojeva() {
    int a[3] = {}, sum = 0;

    cout << "Uneti tri cela broja" << endl;
    for(int i = 0; i < 3; i++) 
        cin >> a[i];

    for(int i = 0; i < 3; i++) {
        if(a[i] > 0) {
            sum += a[i];
        }
    }

    cout << sum << endl;
}

/// @brief 1.2.11 - za uneti cetvorocifreni broj, ispisuje se njegova najveca cifra. Za slucaj neirpavnog unosa, stampati gresku
void najveca_cifra() {
    int cetvorocifren_broj, najveca_cifra; 
    cout << "Uneti cetvorocifren broj: " << endl;
    cin >> cetvorocifren_broj;

    if(cetvorocifren_broj > 999 && cetvorocifren_broj < 10000){

        int jedinica = cetvorocifren_broj % 10;
        int desetica = (cetvorocifren_broj / 10) % 10;
        int stotina = (cetvorocifren_broj / 100) % 10;
        int hiljada = cetvorocifren_broj / 1000;

        najveca_cifra = jedinica;

        if(desetica > najveca_cifra)
            najveca_cifra = desetica;
        if(stotina > najveca_cifra)
            najveca_cifra = stotina;
        if(hiljada > najveca_cifra)
            najveca_cifra = hiljada;

        cout << najveca_cifra << endl;
    } else {
        cout << "Los unos!" << endl;
    }
}

/// @brief 1.2.12 - ova funkcija proverava za dati unos, da li je unos armstrongov broj ili ne 
void armstrongov_broj() {
    int ulaz, armstrongov_broj, jedinica, desetica, stotina; 
    cout << "Uneti trocifren broj: " << endl;
    cin >> ulaz;

    if(ulaz < 99 || ulaz > 1000) {
        cout << "Pogresan ulaz" << endl;
        // return 1; 
    } else {
        jedinica = ulaz % 10;
        desetica = (ulaz / 10) % 10;
        stotina = ulaz / 100;

        armstrongov_broj = stotina*stotina*stotina + desetica*desetica*desetica + jedinica*jedinica*jedinica;

        if(armstrongov_broj == ulaz) {
            cout << "Ulaz je armstrongov broj" << endl;
        } else {
            cout << "Ulaz nije armstrongov broj" << endl;
        }        
    }
}

/// @brief 1.2.16 - za dve tacke, proveriti da li se nalaze u istom kvadrantu
void provera_kvadranta() {
    float a[2] = {};
    float b[2] = {};

    cout << "Uneti vrednosti za x i y koordinate tacaka A" << endl;
    for(int i = 0; i < 2; i ++)
        cin >> a[i];
    cout << "Uneti za tacku B koordinate" << endl;
    for(int i = 0; i < 2; i++)
        cin >> b[i];

    if((a[0] >= 0 && b[0] >= 0) && (a[1] >= 0 && b[1] >= 0)) 
        cout << "Tacke su u istom kvadrantu, prvi kvadrant" << endl;
    else if((a[0] <= 0 && b[0] >= 0) && (a[1] <= 0 && b[1] >= 0)) 
        cout << "Tacke su u istom kvadrantu, drugi kvadrant" << endl;
    else if((a[0] >= 0 && b[0] <= 0) && (a[1] >= 0 && b[1] <= 0)) 
        cout << "Tacke su u istom kvadrantu, cetvrti kvadrant" << endl;
    else if((a[0] <= 0 && b[0] <= 0) && (a[1] <= 0 && b[1] <= 0)) 
        cout << "Tacke su u istom kvadrantu, treci kvadrat" << endl;  
    else 
        cout << "Tacke nisu u istom kvadrantu" << endl;

}

int main() {
    // pozivom funkcija iznad, dolazi se do konkretnih zadataka
    
    
    system("pause");
    return 0;
}