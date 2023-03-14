#include <iostream>
#include <queue>
#include <list>
#include <vector>


//najveci zbir k-tih elemenata u nizu a

/*
int main()
{
	std::vector<int> a={1,4,-5,6,8,-1,-3};
	int k=4;
	std::queue<int> red;
	int n = a.size();
	int trenutni_zbir = max_zbir;



	int max_zbir = 0;

	for(int i = 0; i<k; i++){
		red.push(a[i]);
		max_zbir += a[i];

	}
	

	for(int i=k; i<n;i++){
		trenutni_zbir+= a[i];
		trenutni_zbir-=red.front();

		if(max_zbir < trenutni_zbir){
			max_zbir = trenutni_zbir;
		}
		red.push(a[i]);
		red.pop();
	}

	std::cout<<max_zbir<<std::endl;

	return 0;
}
*/


/*
//josifov problem
int main() 
{
	std::queue<int> red;
	std::vector<int> a = {0,1,2,3,4,5,6,7};
	int k = 3;
	int n = 8;
	int pom;

	for (int i = 0; i<n; i++){
		red.push(i);
	}

	while(red.size() != 1){
		for (int i = 0; i<k-1;i++){
			pom = red.front();
			red.pop();
			red.push(pom);
		}
		red.pop();

	}

	std::cout<<red.front() <<std::endl;

	return 0;
}
*/

/*
//sortiranje (dek)
int main()
{
	std::vector<int> a = {5,8,12,4,2,13,19,1};			//specijalan niz koji je napravljen da funkcionise kao dek
	std::list<int>dek;

	dek.push_back(a[0]);
	int n=a.size();

	for (int i =1; i<n;i++){
		if(a[i] > dek.front()){
			dek.push_back(a[i]);
		} else {
			dek.push_front(a[i]);
		}
	}

	for (int x:dek){
		std::cout <<x <<std::endl;
	}



	return 0;
}
*/

//sortiranje preko heapa includuje se queue
/*
int main()
{
	std::vector<int> a = {7,2,6,3,5,4,1};
	std::priority_queue<int, std::vector<int>, std::greater<int>> hip;
	for(int x:a) {
		hip.push(x);
	}

	while (!hip.empty()) {
		std::cout << hip.top() <<" ";
		hip.pop();
	}
	std::cout <<std::endl;



	return 0;
}
*/



// dat je niz brojeva, naci najveci zbir k elemenata (ne mora da budu uzastopni)

int main ()
{
	std::vector<int> a = {7,2,6,3,5,4,1};
	std::priority_queue<int, std::vector<int>, std::less<int>> hip;
	int k =3;

	for(int x:a) {
		hip.push(x);
	}
	int suma = 0;
	for (int i = 0; i<k; i++){
		suma += hip.top();
		hip.pop();
	}

	std::cout << suma << std::endl;


	return 0;
}



