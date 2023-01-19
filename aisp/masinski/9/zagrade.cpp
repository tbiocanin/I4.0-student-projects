#include <iostream>
#include <stack>

int main ()
{
    std::string s = ")(";
    std::stack<char> stek;

    for (char c : s) {
        if (c == '(') {
            stek.push(c);
        } else {
            if (stek.size() == 0) {
                std::cout << "Zagrade nisu uparene!\n";
                return 0;
            }
            stek.pop();
        }
    }

    if (stek.size() > 0) {
        std::cout << "Zagrade nisu uparene!\n";
    } else {
        std::cout << "Zagrade jesu uparene!\n";
    }
    return 0;
}