#include <iostream>
#include <vector>
#include <queue>

int main ()
{
    std::vector<int> a = {7,2,6,3,5,4,1};
    std::priority_queue<int,
        std::vector<int>, std::less<int>> hip;

    int k = 3;

    for (int x : a) {
        hip.push(x);
    }

    int suma = 0;

    for (int i = 0; i < k; i++) {
        suma += hip.top();
        hip.pop();
    }

    std::cout << suma << "\n";

    return 0;
}