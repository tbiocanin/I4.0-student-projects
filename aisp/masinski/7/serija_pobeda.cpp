#include <iostream>
#include <vector>
#include <algorithm>

int najduza_serija(const std::vector<int> &a)
{
    // std::vector<int> b(a.size());
    // //        odakle     dokle    gde
    // std::copy(a.begin(), a.end(), b.begin());

    int brojac = 0, max = 0;

    for (int i = 0; i < a.size(); i++) {
        if (a[i] == 1) {
            brojac++;
        }
        if(a[i] == -1) {
            if (brojac > max) {
                max = brojac;
            }
            brojac = 0;
        }
    }

    if (brojac > max) {
        max = brojac;
    }

    return max;
}

int main ()
{
    std::vector<int> a = {1,1,-1,1,1,1,1};

    std::cout << najduza_serija(a) << "\n";
    return 0;
}