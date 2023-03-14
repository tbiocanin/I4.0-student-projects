#include <iostream>
#include <vector>
#include <algorithm>

int broj_parova(const std::vector<int> &a,
                int s)
{
    int n = a.size();
    int counter = 0;

    for (int i = 0; i < n; i++) {
        if (std::binary_search(a.begin(),
                a.end(), s - a[i]) == true) {
                    counter++;
                }
    }

    return counter / 2;
}

int broj_parova_v2(const std::vector<int> &a,
                int s)
{
    int n = a.size();
    int counter = 0;

    for (int i = 0; i < n; i++) {
        if (std::binary_search(a.begin() + i + 1,
                a.end(), s - a[i])) {
            counter++;
        }
    }

    return counter;
}

int main ()
{
    std::vector<int> a = {2, 5, 7, -2, 9, 3, 12, 4};

    int s = 12;

    std::sort(a.begin(), a.end());

    std::cout << broj_parova(a, s) << "\n";

    std::cout << broj_parova_v2(a, s) << "\n";

    return 0;
}