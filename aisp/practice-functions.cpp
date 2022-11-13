#include <iostream> 
#include <vector>
using namespace std;

//zadatak 2.1.1 zbirka 1
/*
	int parne_pozicije (std::vector<int> n) {						// 2.1.1 pod a
		for (int i=0; i < n.size(); i++) {
			if (i%2 == 0){
				std::cout <<"Elementi na parnim pozicijama su " << n[i] <<std::endl;
				}
		}
		return 0;
	}

	int parni_elementi(std::vector<int> n){							// 2.1.1 pod b
		for(int i=0; i< n.size(); i++){
			if (n[i] % 2 == 0) {
				std::cout <<"Ovi elementi su parni " <<n[i] <<std::endl;
			}
		}
		return 0;
	}
*/

//zadatak 2.1.2

/*
void kvadriranje_negativnih(std::vector <double> n){			// 2.1.2 
	for (int i=0; i<n.size();i++){
		if(n[i]<0){
			n[i]=n[i]*n[i];
		}
	}
	for (int i = 0; i <n.size(); i++){
		std::cout << n[i] <<std::endl;
	}
}
*/

//zadatak 2.1.3

/*
int proizvod_skalara(std::vector<int> a, std::vector<int> b){	//2.1.3
	int proizvod = 0;
	for (int i=0; i<a.size(); i++){
		proizvod += a[i]*b[i];
	}
	return proizvod;
}
*/

//zadatak 2.1.4
/*
void deljivi_sa_k (std::vector<int> a,int k) {		//2.1.4
	for (int i = 0; i < a.size(); i++){
		if (a[i]%k==0) {
			std::cout << i <<std::endl;
		}
	}
}
*/

//zadatak 2.1.5

void autobusi (std::vector<int> niz, int k, int t, int m){
	for (k; k<=t; k++) {
		niz[k-1] = niz[k-1] + m;

	}
	for (int i = 0; i < niz.size(); i++){
		std::cout << niz[i] <<std::endl;
	}
}



int main(){
	//std::vector <int> n = {1,8,2,-5,-13,75};			//2.1.1
	//std::cout <<parne_pozicije(n) <<std::endl;
	//std::cout <<parni_elementi(n) <<std::endl;

	//std::vector <double> n = {12.34,-6,1,8,32.4,-16};	//2.1.2
	//kvadriranje_negativnih(n); 

	//std::vector<int> a = {8,-2,0,2,4};				//2.1.3
	//std::vector<int> b = {35,12,5,-6,-1};
	//std::cout << proizvod_skalara(a,b) <<std::endl;

	//std::vector<int> a = {8,9,11,-4,8,11};				//2.1.4
	//int k = 2;
	//deljivi_sa_k(a,k);

	std::vector<int> niz = {24,78,13,124,56,90,205,45};
	int k = 3, t = 6, m = 23;
	autobusi(niz,k,t,m);





	return 0;
}



