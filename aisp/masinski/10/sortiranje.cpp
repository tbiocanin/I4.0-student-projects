#include <iostream>
#include <list>
#include <vector>

int main ()
{
    std::vector<int> a = {5,8,12,4,2,13,19,1};
    std::list<int> dek;

    dek.push_back(a[0]);

    int n = a.size();
    for (int i = 1; i < n; i++) {
        if (a[i] > dek.front()) {
            dek.push_back(a[i]);
        } else {
            dek.push_front(a[i]);
        }
    }

    for (int x : dek) {
        std::cout << x << " ";
    }
    std::cout << "\n";

    return 0;
}