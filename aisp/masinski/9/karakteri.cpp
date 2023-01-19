#include <iostream>
#include <unordered_map>

int main ()
{
    std::unordered_map<char,int> mapa;

    std::string s = "danasjeruznovreme";

    for (char c : s) {
        mapa[c]++;
    }

    // std::pair<int, int> p = std::make_pair(2,3);
    // std::cout << p.first << " " << p.second << "\n";

    int max = 0;
    char slovo;

    // for (std::pair<char, int> p : mapa) {
    //     std::cout << p.first << " -> " << p.second << "\n";
    // }

    for (std::pair<char, int> p : mapa) {
        if (p.second > max) {
            max = p.second;
            slovo = p.first;
        }
    }

    std::cout << slovo << "\n";

    return 0;
}