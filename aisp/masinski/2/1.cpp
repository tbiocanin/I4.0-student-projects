#include <iostream>

void f(const int &p)
{
    int x = p + 23;
}

int main ()
{
    int x = 4;
    f(x);
    std::cout << x << "\n";
    return 0;
}