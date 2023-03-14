#include <iostream>
#include <vector>

class Graph
{
public:
    // Broj cvorova u grafu
    int V;
    // Lista povezanosti
    std::vector<std::vector<int>> lista_povezanosti;
    // Vektor posecenosti cvorova
    std::vector<bool> poseceni;

    Graph(int V)
    {
        this->V = V;
        this->lista_povezanosti.resize(V);
        this->poseceni.resize(V, false);
    }

    void dodaj_granu(int u, int v)
    {
        lista_povezanosti[u].push_back(v);
        lista_povezanosti[v].push_back(u);
    }

    void DFS(int u)
    {
        poseceni[u] = true;

        for (int v : lista_povezanosti[u]) {
            if (!poseceni[v]) {
                DFS(v);
            }
        }
    }

    int broj_komponenti()
    {
        int broj = 0;

        for (int i = 0; i < this->V; i++) {
            if (!poseceni[i]) {
                DFS(i);
                broj++;
            }
        }

        return broj;
    }
};

int main()
{
    Graph g(8);

    g.dodaj_granu(0, 1);
    g.dodaj_granu(1, 2);
    g.dodaj_granu(3, 7);
    g.dodaj_granu(4, 6);

    std::cout << g.broj_komponenti() << "\n";

    return 0;
}