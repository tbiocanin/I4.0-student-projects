#include <iostream>

std::string cezar(std::string poruka,
                    int pomeraj)
{
    for (int i = 0; i < poruka.size(); i++) {
        poruka[i] += pomeraj;

        if (poruka[i] > 'z') {
            int razlika = poruka[i] - 'z';
            poruka[i] = 'a' + razlika - 1;
        }
    }

    return poruka;
}

int main ()
{
    std::string s;

    std::cin >> s;

    std::cout << cezar(s, 3) << "\n";


    return 0;
}
