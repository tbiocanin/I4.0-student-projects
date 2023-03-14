#include <iostream>
#include <vector>
#include <algorithm>

bool binarna_pretraga(const std::vector<int> &a,
                        int x)
{
    // indeksi u nizu, ne elementi niza
    int l = 0;
    int d = a.size() - 1;
    int s;

    while (l <= d) {
        s = (l + d) / 2;

        if (a[s] == x) {
            return true;
        }
        else if (a[s] > x) {
            d = s - 1;
        }
        else {
            l = s + 1;
        }
    }

    return false;
}

int main ()
{
    std::vector<int> a = {2,7,6,9,0,1,4};

    std::sort(a.begin(), a.end());

    std::cout << binarna_pretraga(a, 12) << "\n";

    std::cout << std::binary_search(a.begin(),
    a.end(), 12) << "\n";

    return 0;
}