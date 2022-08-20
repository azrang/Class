#include<iostream>
using namespace std;

class fraction{
    private:
        int num;  //default private
        int denom;

    public:
        fraction(int num, int denom){
   //do not want garbage values for object, make parametized constructor so user has to give values
            this->num=num; //mandatory b/c property and parameter same name
            this->denom=denom;
        }
        void print(){
            //not returning anything
            cout<<num<<"/"<<denom<<endl;  
        }
        //copy contructor called here, b/c main.f2, this is memory waste, want to avoid copy by pass by reference 
 /*       void add(fraction const &f2){  /*takes only one argument b/c stated already
        want to point to same variable, add an & to avoid copy
            int lcm=denom*f2.denom;
            int x=lcm/denom;
            int y=lcm/f2.denom;
            int numerator=x*num + y*f2.num;

            //store result in f1, *this is optional
            num=numerator;
            denom=lcm;

            simplify();  //will simplify f1, only  function name here needed, same as f1.simplify, *this is for f1
            //f2.num=-1 aim is to avoid this, so have a const so cannot write data
            //f1=f1+f2 but want it to store in a new fraction f3!! operator overloading
        }
*/
        fraction add(fraction const &f2){ 
            int lcm=denom*f2.denom;
            int x=lcm/denom;
            int y=lcm/f2.denom;
            int numerator=x*num + (y*f2.num);
            
            fraction fnew(numerator,lcm);  //parametized constructor called
            fnew.simplify();
            return fnew;
        }

        fraction operator+(fraction const &f2){  //operator overloading
            int lcm=denom*f2.denom;
            int x=lcm/denom;
            int y=lcm/f2.denom;
            int numerator=x*num + (y*f2.num);
            
            fraction fnew(numerator,lcm);  //parametized constructor called
            fnew.simplify();
            return fnew;
        }

        void simplify(){  //an object will be called, stored in this keyword, so no paramter
            //have to find highest number that divides both numbers
            int gcd=1; //initialize it
            int j= min(num, denom);
            for(int i=1;i<=j;i++){
                if(num%i==0 && denom%i==0){
                    gcd=i;
                }
            }
            //simplify
            num=num/gcd;
            denom=denom/gcd;
        }
        void multiply(fraction const &f2){  //f2 remain unchanged, dont want a copy, store result in f1
            num= num*f2.num;
            denom= denom*f2.denom;
            simplify();
        }
        fraction operator*(fraction const &f2){
            int n=num*f2.num;
            int d=denom*f2.denom;

            fraction fnew(n,d);
            fnew.simplify();  
            return fnew;
        }
        bool operator==(fraction f2){  //return bool 
            return(num==f2.num && denom==f2.denom);
        }
};

