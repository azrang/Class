//azra rangwala
//first programming assigment of DSA1 which uses derived classes to assign foobar strength and names

#include<vector>
#include<string>
#include<fstream> 
#include<iostream>
#include<sstream>
using namespace std;

class Foobar{
    private:
        string name;
        int position;
    public:
        Foobar(string name,int position){ //constructor which initializes
            this->name=name;    //this pointer used because same name data member
            this->position=position;
            position=0; 
        }
        void set_pos(int p){ 
            position=p;
        }
        virtual int get_strength(){
            return position;
        }
        int get_pos(){
            return position;
        }
        string get_name(){
            return name;
        }
    protected:    //access for derived classes
        int getpos(){
            return position;
        }
    };

class Foo:public Foobar{  //no data members needed, inherits it
    public: 
        Foo(string name, int position):Foobar(name, position){
            //empty constructor
        }
        virtual int get_strength(){  //virtual needed so knows which function pointer is pointing at 
            return 3*get_pos(); 
        }
};

class Bar:public Foobar{
    public:
        Bar(string name, int position):Foobar(name, position){
            //empty constructor, needs to derive from base class
        }
        virtual int get_strength(){
            return 15 + get_pos();
        }
};

int read_file(vector<Foobar*> &foobar){ 
    string input;
    cout<<"enter the name of your input file"<<endl;
    cin>>input;
    ifstream in(input);
    string s;
    int count=0;
    while(getline(in, s)){
        ++count;
        string type, name;
        stringstream ss;
        ss<<s;
        ss>>type>>name;
        if(type=="foobar"){  //dynamically allocate foobar, foo, and bar object
            Foobar* p= new Foobar(name, count);
            foobar.push_back(p);
        }
        else if(type=="foo"){ 
            Foobar* p= new Foo(name, count);  //different objects allocated since they have different strengths
            foobar.push_back(p);
        }
        else if(type=="bar"){
            Foobar* p= new Bar(name, count);
            foobar.push_back(p); 
        }
    }
    int pos=0;
    for(int i= foobar.size()-1;  i>=0; i--){
       pos++;  //counts upward as pointer points backwards
       foobar[i]->set_pos(pos);  
    }
    in.close();
    return count; 
}

void write_file(vector<Foobar*> &foobar){  
    string output;
    cout<<"what is the name of your output text?"<<endl;
    cin>>output;
    ofstream my_file(output);
    int vecsize= foobar.size();
    for(int i=0; i<vecsize; i++){   //loop through vector
        my_file<< foobar[i]-> get_name()<< " "  << foobar[i]-> get_strength() << endl; 
    }
    my_file.close();
}

int main(){ 
    vector<Foobar*> foobar;  //a vector of pointers to foobar objects is needed for polymorphism
    read_file(foobar);
    write_file(foobar);
}