#include <iostream>
#include <vector>
#include <algorithm>

int broj_parova(const std::vector<int> &a,
                    int s)
{
    int i = 0;
    int j = a.size() - 1;
    int counter = 0;

    while (i < j) {
        if (a[i] + a[j] > s) {
            j--;
        } else if (a[i] + a[j] < s) {
            i++;
        } else {
            counter++;
            i++;
            j--;
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

    return 0;
}