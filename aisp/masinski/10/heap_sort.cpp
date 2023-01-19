#include <iostream>
#include <vector>
#include <queue>

int main ()
{
    std::vector<int> a = {7,2,6,3,5,4,1};
    std::priority_queue<int,
        std::vector<int>, std::greater<int>> hip;

    for (int x : a) {
        hip.push(x);
    }

    while (!hip.empty()) {
        std::cout << hip.top() << " ";
        hip.pop();
    }
    std::cout << "\n";

    return 0;
}