#include <iostream>
#include <vector>
#include <queue>
//grafovi dfs i bfs
using namespace std;

class GraphBFS {

    public:
        int V; //v cvorova
        vector<vector<int>> listaPovezanosti;
        vector<bool> poseceni;

        GraphBFS(int V) 
        {
            this -> V = V;
            this -> listaPovezanosti.resize(V);
            this -> poseceni.resize(V, false); 
        }

        void dodajGranu(int u, int v)
        {
            this -> listaPovezanosti[u].push_back(v);
            this -> listaPovezanosti[v].push_back(u);
        }

        void BFS(int u)
        {
            queue<int> red;
            red.push(u);
            poseceni[u] = true;

            int tmp;
            while(!red.empty())  // red.size() > 0
            {
                tmp = red.front();
                red.pop();

                cout << tmp << " ";

                for(int v : listaPovezanosti[tmp]) 
                {
                    if(poseceni[v] == false) {
                        red.push(v);
                    }
                    poseceni[v] = true;
                }

            }
        }

};

class GraphDFS
{

    public:
        GraphDFS(int V)
        {
            this->V = V;
            this->lista_povezanosti.resize(V);
            this->poseceni.resize(V, false);

        }

        int V; //nije bitno gde se navode promenljive, zato se u konstruktoru ne buni za V
        std::vector<std::vector<int>> lista_povezanosti;
        //vektor pposecenosti cvorova
        std::vector <bool> poseceni;
        

        void dodaj_granu(int u, int v)
        {

            lista_povezanosti[u].push_back(v);
            lista_povezanosti[v].push_back(u);

        }

        void DFS(int u)
        {
            poseceni[u] = true;

            // std::cout << u << " ";

            for(int v: lista_povezanosti[u]){
                if(poseceni[v] == false){
                    DFS(v);
                }
            }
        }

        int brojKomponenti()
        {
            int broj = 0;

            for(int i = 0; i < this -> V; i++) {
                if(!poseceni[i]) {
                    DFS(i);
                    broj++;
                }
            }

            return broj;
        }
};

class GraphBFS2
{

    public:
        GraphBFS2(int V)
        {
            this -> V = V;
            this -> lista_povezanosti.resize(V);
            this -> poseceni.resize(V, false);
            this -> roditelji.resize(V, -1);
        }

        int V; //nije bitno gde se navode promenljive, zato se u konstruktoru ne buni za V
        std::vector<std::vector<int>> lista_povezanosti;
        //vektor pposecenosti cvorova
        std::vector <bool> poseceni;
        std::vector <int> roditelji;
        

        void dodaj_granu(int u, int v)
        {

            lista_povezanosti[u].push_back(v);
            lista_povezanosti[v].push_back(u);

        }

        bool BFS(int u)
        {
            queue<int> red;

            poseceni[u] = true;
            red.push(u);

            int tmp;
            while(!red.empty())
            {
                tmp = red.front();
                red.pop();

                for (int v : lista_povezanosti[tmp]) {
                    if(!poseceni[v]) {
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
        }
};


int main() {

    GraphBFS2 g(3);

    g.dodaj_granu(0, 1);
    g.dodaj_granu(1, 2);
    // g.dodaj_granu(1, 3);
    g.dodaj_granu(2, 3);
    // g.dodaj_granu(3, 1);

    cout << g.BFS(0) << endl;


    system("pause");
    return 0;
}