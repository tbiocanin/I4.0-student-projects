#include <iostream>
#include <queue>

int main ()
{
    std::queue<int> red;
    int n = 8;
    int k = 3;

    for (int i = 0; i < n; i++) {
        red.push(i);
    }

    int pom;

    while (red.size() != 1) {
        for (int i = 0; i < k - 1; i++) {
            pom = red.front();
            red.pop();
            red.push(pom);
        }
        red.pop();
    }

    std::cout << red.front() << "\n";

    return 0;
}