#include <iostream>
#include <algorithm>

// abdefrg -> abdefgr
// fbedrga -> abdefgr

bool anagrami(std::string s1, std::string s2)
{
    std::sort(s1.begin(), s1.end());
    std::sort(s2.begin(), s2.end());

    return s1 == s2;
}

int main ()
{
    std::string s1, s2;
    std::cin >> s1 >> s2;

    std::cout << anagrami(s1, s2) << "\n";

    return 0;
}
