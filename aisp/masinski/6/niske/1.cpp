#include <iostream>

bool postoji(std::string s1, std::string s2)
{
    int n = s1.size(), m = s2.size();

    // prolazi kroz tekst (s1)
    for (int i = 0; i < n; i++) {
        if (s1[i] == s2[0]) {
            for (int j = 1; j < m; j++) {
                if (s1[i + j] != s2[j]) {
                    break;
                }
                else if (j == m - 1) {
                    return true;
                }
            }
        }
    }

    return false;
}

// bool postoji(std::string s1, std::string s2)
// {
//     int n = s1.size(), m = s2.size();
//     bool pronadjen;

//     // prolazi kroz tekst (s1)
//     for (int i = 0; i < n; i++) {
//         if (s1[i] == s2[0]) {
//             pronadjen = true;
//             for (int j = 1; j < m; j++) {
//                 if (s1[i + j] != s2[j]) {
//                     pronadjen = false;
//                     break;
//                 } else if ()
//             }
//             if (pronadjen) {
//                 return true;
//             }
//         }
//     }

//     return false;
// }

int main ()
{
    std::string s1 = "panamabananas";
    std::string s2 = "ananas";

    std::cout << std::boolalpha << postoji(s1, s2) << "\n";
    return 0;
}