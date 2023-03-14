#include <iostream>
#include <vector>
#include <algorithm>

int neupareni_element(std::vector<int> a) {
    std::sort(a.begin(), a.end());

    int n = a.size();

    for (int i = 0; i < n - 1; i += 2) {
        if (a[i] != a[i + 1]) {
            return a[i];
        }
    }

    return a[n - 1];
}

int neupareni_element_v2(std::vector<int> a)
{
    std::sort(a.begin(), a.end());

    int n = a.size();

    if (a[0] != a[1]) {
        return a[0];
    }

    for (int i = 1; i < n - 1; i++) {
        if (a[i] != a[i - 1] && a[i] != a[i + 1]) {
            return a[i];
        }
    }

    return a[n - 1];
}


int main ()
{
    std::vector<int> a = {3,2,5,5,1,2,3};

    std::cout << neupareni_element(a) << "\n";

    std::cout << neupareni_element_v2(a) << "\n";
    return 0;
}