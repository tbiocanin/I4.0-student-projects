#include <iostream>

// < 0 ako je s1 < s2
// = 0 ako je s1 = s2
// > 0 ako je s1 > s2
// abcdpfo -> n
// abcd -> m
int poredak_1(std::string s1, std::string s2)
{
    int n = s1.size();
    int m = s2.size();

    int granica = std::min(n, m);

    int i = 0;
    while (i < granica) {
        if (s1[i] < s2[i]) {
            return -1;
        }
        else if (s1[i] > s2[i]) {
            return 1;
        }
        i++;
    }
    if (n < m) {
        return -1;
    }
    else if (n > m) {
        return 1;
    }

    return 0;
}

int poredak_2(std::string s1, std::string s2)
{
    if (s1 < s2) {
        return -1;
    }
    else if (s1 > s2) {
        return 1;
    }
    return 0;
}
int main ()
{
    std::string s1 = "abcdef";
    std::string s2 = "abcdef";

    std::cout << poredak_1(s1, s2) << "\n";
    std::cout << poredak_2(s1, s2) << "\n";

    return 0;
}