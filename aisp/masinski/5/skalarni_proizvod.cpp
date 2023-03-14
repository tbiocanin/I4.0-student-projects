#include <iostream>
#include <vector>

int skalarni(std::vector<int> a,
            std::vector<int> b, int i)
{
    if (i == a.size() - 1) {
        return a[i] * b[i];
    }

    int skalarni_u_ostatku =
            skalarni(a, b, i + 1);

    return a[i] * b[i] + skalarni_u_ostatku;
}
int main ()
{
    std::vector<int> a = {2, 3, 5};
    std::vector<int> b = {1, 4, 6};

    std::cout << skalarni(a, b, 0);

    return 0;
}