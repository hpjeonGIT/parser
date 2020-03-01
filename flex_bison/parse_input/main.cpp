// REF: http://fhoerni.free.fr/comp/bison_flex.html
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
extern FILE *yyin, *yyout; // used implicitly?
extern int yylex();
extern void yyparse(std::vector<std::string> &tokens,std::vector<double> &values);

int main(int, char**) {
    // open a file handle to a particular file:
    std::FILE *myfile = fopen("input.dat", "r");
    // make sure it's valid:
    if (!myfile) {
    std::cout << "input file not found" << std::endl;
    return -1;
    }
    // set lex to read from it instead of defaulting to STDIN:
    yyin = myfile;
    std::vector<std::string> tokens;
    std::vector<double> values;
    yyparse(tokens, values);
    //
   std::cout << std::endl;
    for (int i = 0;i<values.size(); i++) {
        std::cout << tokens[i] << "= " <<values[i] <<std::endl;
    }
    return 0;  
}
