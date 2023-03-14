#include <iostream>
#include <queue>
#include <vector>

int main ()
{
    std::vector<int> a =  {1,4,-5,6,8,-1,-3};
    int k = 5;
    std::queue<int> red;

    int max_zbir = 0;

    for (int i = 0; i < k; i++) {
        red.push(a[i]);
        max_zbir += a[i];
    }

    int n = a.size();
    int trenutni_zbir = max_zbir;
    for (int i = k; i < n; i++) {
        trenutni_zbir += a[i];
        trenutni_zbir -= red.front();

        if (max_zbir < trenutni_zbir) {
            max_zbir = trenutni_zbir;
        }

        red.push(a[i]);
        red.pop();
    }

    std::cout << max_zbir << "\n";

    return 0;
}