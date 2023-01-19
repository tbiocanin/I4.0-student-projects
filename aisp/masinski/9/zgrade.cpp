#include <iostream>
#include <stack>
#include <vector>

int main ()
{
    std::vector<int> a = {2,5,3,1,2,4,7};
    std::stack<int> stek;


    for (int i = 0; i < a.size(); i++) {
        while (stek.size() > 0 && stek.top() <= a[i]) {
            stek.pop();
        }

        if (stek.size() == 0) {
            std::cout << "- ";
        } else {
            std::cout << stek.top() << " ";
        }

        stek.push(a[i]);
    }

    std::cout << "\n";

    return 0;
}