#include <iostream> 
#include <vector> 

using namespace std;
// niske, sesta nedelja

bool postoji(string s1, string s2) {

    bool pronadjen;

    for(int i = 0; i < s1.size(); i++) {
        if(s1[i] == s2[0]) {
            pronadjen = true;
            for(int j = 1; j < s2.size(); j++) {
                if(s1[i + j] != s2[j]) {
                    pronadjen = false;
                    break;
                }
            }

            if(pronadjen){
                return true;
            }
        }
    }

    return false;
}

int poredak_v1(string s1, string s2) {

    int n = s1.size();
    int m = s2.size();

    int i = 0, granica;
    if (n < m) {
        granica = n;
    } else {
        granica = m;
    }
    while(i < granica) {

        if(s1[i] < s2[i]){
            return -1;
        } else if(s1[i] > s2[i]) {
            return 1;
        }
        i++;
    }
    if ( n < m ) {
        return -1;
    } else if( n > m ){
        return 1;
    }
    return 0;
}
int poredak_v2(string s1, string s2) {

    if(s1 < s2) {
        return -1;
    } else if (s2 < s1) {
        return 1;
    } 

    return 0;
}
int main() {

    //bilo je vezano za bool fju//
    // string s1_unos;
    // string s2 = "annas";

    // cin >> s1_unos;

    // cout << postoji(s1_unos, s2) << endl;

    string s1 = "bbdc", s2 = "abcdefgh";
    cout << poredak_v2(s1, s2) << endl;
    system("pause");
    return 0;
}