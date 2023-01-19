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

    void DFS(int u) {
        poseceni[u] = true;

        std::cout << u << " ";

        for (int v : lista_povezanosti[u]) {
            if (poseceni[v] == false) {
                DFS(v);
            }
        }
    }
};

int main ()
{
    Graph g(7);

    g.dodaj_granu(0,1);
    g.dodaj_granu(0,2);
    g.dodaj_granu(1,2);
    g.dodaj_granu(1,3);
    g.dodaj_granu(2,3);
    g.dodaj_granu(2,4);
    g.dodaj_granu(2,6);
    g.dodaj_granu(3,4);
    g.dodaj_granu(4,5);

    g.DFS(0);

    return 0;
}