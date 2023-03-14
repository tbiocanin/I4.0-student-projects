#include <iostream>
#include <vector>
#include <queue>

class Graph {
public:
    int V;
    std::vector<std::vector<int>> lista_povezanosti;
    std::vector<bool> poseceni;

    Graph(int V)
    {
        this->V = V;
        this->lista_povezanosti.resize(V);
        this->poseceni.resize(V, false);
    }

    void dodaj_granu(int u, int v)
    {
        this->lista_povezanosti[u].push_back(v);
        this->lista_povezanosti[v].push_back(u);
    }

    void BFS(int u)
    {
        std::queue<int> red;
        red.push(u);

        poseceni[u] = true;

        int tmp;
        while (!red.empty()) { // red.size() > 0
            tmp = red.front();
            red.pop();

            std::cout << tmp << " ";

            for (int v : lista_povezanosti[tmp]) {
                if (poseceni[v] == false) {
                    red.push(v);
                }
                poseceni[v] = true;
            }
        }
    }
};

int main ()
{
    Graph g(7);

    g.dodaj_granu(0,1);
    g.dodaj_granu(1,2);
    g.dodaj_granu(1,3);
    g.dodaj_granu(1,5);
    g.dodaj_granu(2,4);
    g.dodaj_granu(3,4);
    g.dodaj_granu(4,6);

    g.BFS(0);

    return 0;
}