#include<iostream>
using namespace std;
#include "fraction.cpp"

int main(){
    fraction f1(2,2);
    fraction f2(3,4);
    fraction f3=f1.add(f2);  //f1 is this, and f2 is argument
    fraction f4= f1+f2;  //the left hand side is the this of the function and f2 is argument to the operator function
    fraction f5=f1*f2;
    if(f1==f2){  //f1 is this, f2 is argument
        cout<<"equal"<<endl;
    }
    else{
        cout<<"not"<<endl;
    }
    f1.print();
    f2.print();
    f3.print();
    f4.print();
    f5.print();


    return 0;
}