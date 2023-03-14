#include <iostream>

class Student {
public:
    std::string ime;
    std::string prezime;
    std::string br_indeksa; // 204/2018

    Student()
    {

    }

    Student(std::string ime,
    std::string b, std::string c)
    {
        this->ime = ime;
        this->prezime = b;
        this->br_indeksa = c;
    }

    void predstavi_se()
    {
        std::cout << "Ja se zovem "
        << ime << " " << prezime << "\n";
    }
};

int main ()
{
    Student *s = new Student("Pera", "Peric", "143/2017");
    Student s1("Jovan", "Jovanovic", "132/2014");
    s->predstavi_se();
    s1.predstavi_se();

    delete s;
    return 0;
}