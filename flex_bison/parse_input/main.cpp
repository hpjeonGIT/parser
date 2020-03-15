// REF: http://fhoerni.free.fr/comp/bison_flex.html
#include <iostream>
#include <fstream>
#include <cstdio>
extern FILE *yyin, *yyout; // used implicitly?
extern int yylex();
void yyparse(char **tokens, double *values, int &ncount);

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
    char **tokens;
    tokens = (char **) malloc(10*sizeof(char*));
    for (int i =0; i<10; i++)
        tokens[i] = (char *) malloc(25*sizeof(char*));
    double values[10];
    int ncount;
    yyparse(tokens, values, ncount);
    //
    for (int i=0;i<ncount;i++) {
        printf("%s = %f \n",tokens[i], values[i]);
    }
    for (int i =0; i<10; i++) {
        free(tokens[i]);
    }
    free(tokens);
    return 0;  
}
