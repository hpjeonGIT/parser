%debug
%error-verbose
%verbose
%locations

%{
#include <cstdio>
#include <iostream>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
bool IGNORE = false;
void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token TOK_COMMENT TOK_NEWLINE
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
input: /*empty*/
    | input exp
    ;
        
exp: | exp INT {
        if (IGNORE) {
            std::cout << "ignore " << $2 << std::endl;
        }
        else {
            std::cout << "Bison found an int: " << $2 << std::endl;
        }
    }
    | exp FLOAT {
        if (IGNORE) {
            std::cout << "ignore " << $2 << std::endl;
        }
        else {
            std::cout << "Bison found a float: " << $2 << std::endl;
        }
    }
    | exp STRING {
            if (IGNORE) {
            std::cout << "ignore " << $2 << std::endl;
        }
        else {
            std::cout << "Bison found a string: " << $2 << std::endl;
        }
    }
    | exp TOK_COMMENT{
        IGNORE = true;
    }
    | exp TOK_NEWLINE {
        IGNORE = false;
    }
;
%%

void yyerror(const char *s) {
    std::cout << "parse error: " << s << std::endl;
    exit(-1);
}
