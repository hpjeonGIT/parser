#include <iostream>
#include <fstream>

extern FILE *yyin, *yyout;
extern int yylex();
extern void yyparse();

int main(int, char**) {
    // open a file handle to a particular file:
    std::FILE *myfile = fopen("random_txt.file", "r");
    // make sure it's valid:
    if (!myfile) {
    std::cout << "input file not found" << std::endl;
    return -1;
    }
    // set lex to read from it instead of defaulting to STDIN:
    yyin = myfile;

    yyparse();
    //
    return 0;  
}
