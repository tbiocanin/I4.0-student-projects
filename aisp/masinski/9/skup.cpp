#include <iostream>
#include <unordered_set>
#include <vector>

int main ()
{
    std::unordered_set<int> skup;
    std::vector<int> a = {1,4,6,3,1,1,8,6,4};

    for (int x : a) {
        skup.insert(x);
    }

    std::cout << skup.size() << "\n";

    return 0;
}