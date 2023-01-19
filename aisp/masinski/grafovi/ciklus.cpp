#include <iostream>
#include <vector>
#include <queue>

class Graph
{
public:
    // Broj cvorova u grafu
    int V;
    // Lista povezanosti
    std::vector<std::vector<int>> lista_povezanosti;
    // Vektor posecenosti cvorova
    std::vector<bool> poseceni;
    std::vector<int> roditelji;

    Graph(int V)
    {
        this->V = V;
        this->lista_povezanosti.resize(V);
        this->poseceni.resize(V, false);
        this->roditelji.resize(V, -1);
    }

    void dodaj_granu(int u, int v)
    {
        lista_povezanosti[u].push_back(v);
        lista_povezanosti[v].push_back(u);
    }

    bool BFS(int u)
    {
        std::queue<int> red;

        poseceni[u] = true;
        red.push(u);

        int tmp;
        while (!red.empty()) {
            tmp = red.front();
            red.pop();

            for (int v : lista_povezanosti[tmp]) {
                if (!poseceni[v]) {
                    poseceni[v] = true;
                    roditelji[v] = tmp;
                    red.push(v);
                } else {
                    if (roditelji[tmp] != v) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
};

int main()
{
    Graph g(4);

    g.dodaj_granu(0, 1);
    g.dodaj_granu(1, 2);
    g.dodaj_granu(1, 3);
    g.dodaj_granu(2, 3);

    std::cout << g.BFS(0) << "\n";

    return 0;
}