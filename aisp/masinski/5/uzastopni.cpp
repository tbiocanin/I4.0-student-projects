#include <iostream>
#include <vector>
bool uzastopni(std::vector<int> a, int i,
            int x, int y, int z)
{
    if (i == a.size() - 2) {
        return false;
    }

    if (a[i] == x && a[i + 1] == y
                    && a[i + 2] == z) {
        return true;
    }

    bool postoji_u_ostatku_niza =
    uzastopni(a, i + 1, x ,y, z);

    return postoji_u_ostatku_niza;
}


// bool uzastopni(std::vector<int> a, int i,
//             int x, int y, int z)
// {
//     if (i == a.size() - 2) {
//         return false;
//     }

//     bool postoji_u_ostatku_niza =
//     uzastopni(a, i + 1, x ,y, z);

//     if (postoji_u_ostatku_niza) {
//         return true;
//     }

//     if (a[i] == x && a[i + 1] == y
//                     && a[i + 2] == z) {
//         return true;
//     }
//     else {
//         return false;
//     }
// }

int main ()
{
    std::vector<int> a = {1,7,4,6,9,7,8};
    int x = 4, y = 6, z = 9;

    std::cout << uzastopni(a, 0, x, y, z);

    return 0;
}