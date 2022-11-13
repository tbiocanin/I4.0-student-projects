#include <iostream>
#include <vector>

//zadatak 1.23 p2_zbirka
/*
int sabira_niz(std::vector<int> a, int i, int &cifra){
	if (i == a.size()){
		return a[i-1];
	}
	
	std::cout <<"Element a[i] je " <<a[i] <<std::endl;
	int ostatak_niza = sabira_niz(a, i+1, cifra);
	cifra += a[i];
	std::cout <<"Element a[i] posle rekurzije je " <<a[i] <<std::endl;
	std::cout <<"Cifra je " <<cifra <<std::endl;
	return cifra;
}


*/

// zadatak 1.24

/*
int maks(std::vector<int> a, int i){
	if (i==a.size()){
		return a[i];
	}
	int ostatka_niza = maks(a,i+1);
	int maks = a[i];
	if (ostatka_niza < a[i]) {
		maks = a[i];
	} else {
		maks = ostatka_niza;
	}
	return maks;
}
*/

// zadatak 1.25
/*
int proizvod(std::vector<int> a,std::vector<int> b, int i) {
	if(i==a.size()){
		return a[i-1]*b[i-1];
	}
	std::cout << "a[i] i b[i] su " <<b[i]*a[i]  <<std::endl;
	int ostatak_niza = proizvod(a,b,i+1);
	std::cout <<"ostatak_niza je " <<ostatak_niza <<std::endl;
	int proizvod = a[i]*b[i];
	return ostatak_niza + a[i-1]*b[i-1];
}
*/

//zad 1.26
/*
int ponavaljanje(std::vector<int> a, int x, int &brojac, int i){
	if (i==a.size()){
		return 0;
	}
	if(a[i]==x){
		brojac++;
		std::cout<<"Brojac je " <<brojac <<std::endl;
	}
	int ostatak_niza = ponavaljanje(a,x,brojac,i+1);
	return brojac;
}
*/


//zad 1.27

bool tri_uzastopna(std::vector<int> a,int x, int y, int z,int i){
	if(i==a.size()-2){
		return false;
	}
	if (a[i]==x && a[i+1]==y && a[i+2]==z){
		return true;
	}
	
	
	bool postoji_u_nizu = tri_uzastopna(a,x,y,z,i+1);

	return postoji_u_nizu;
}


int main() {
	//std::vector<int> a = {1, 2 ,3,4,10,-20 };				//1.23 zad
	//int cifra = 0;
	//std::cout <<sabira_niz(a,0, cifra) <<std::endl;

	//std::vector<int> a = {100,62,32,6};						//1.24
	//std::cout << "Maks niza je " <<maks(a,0) <<std::endl;

	//std::vector<int> a = {1,2,4};							//1.25
	//std::vector<int> b = {6,5,4};
	//std::cout << proizvod(a,b,0) <<std::endl;

	//std::vector<int> a={1,2,6,2,2,5,4};						//1.26
	//int brojac = 0;
	//int x = 2;
	//std::cout << ponavaljanje(a,x,brojac,0) <<std::endl;

	std::vector<int> a = {1,2,3,7,2,4};
	int x = 3, y = 7, z = 2;
	std::cout <<tri_uzastopna(a,x,y,z,0) <<std::endl;







	return 0;
}



