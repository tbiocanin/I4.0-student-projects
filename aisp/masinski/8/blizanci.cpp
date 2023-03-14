#include <iostream>
#include <climits>
#include <vector>
#include <algorithm>

int razlika(std::vector<int> p,
            std::vector<int> m)
{
    std::sort(p.begin(), p.end());
    std::sort(m.begin(), m.end());

    int i = 0, j = 0;
    int n = p.size(), r = m.size();

    int min_razlika = INT_MAX;
    while (i < n && j < r) {
        if (std::abs(p[i] - m[j]) < min_razlika) {
            min_razlika = std::abs(p[i] - m[j]);
        }

        if (p[i] == m[j]) {
            return 0;
        }

        if (p[i] < m[j]) {
            i++;
        } else {
            j++;
        }
    }

    return min_razlika;
}

int main ()
{
    std::vector<int> p = {4680, 2120, 7940, 11530, 17820};
    std::vector<int> m = {850, 13420, 5770, 6300};

    std::cout << razlika(p, m) << "\n";
    return 0;
}