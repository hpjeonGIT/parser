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

void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token COMMENT PLEASE NUMBER
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
simple:
    simple INT {
    std::cout << "bison found an int: " << $2 << std::endl;
    }
    | simple FLOAT {
    std::cout << "bison found an float: " << $2 << std::endl;
    }
    | simple STRING {
    std::cout << "bison found a string: " << $2 << std::endl; free($2);
    }
    | INT {
    std::cout << "bison found an int: " << $1 << std::endl;
    }
    | FLOAT {
    std::cout << "bison found an float: " << $1 << std::endl;
    }
    | STRING {
    std::cout << "bison found a string: " << $1 << std::endl; free($1);
    }
;
%%

void yyerror(const char *s) {
    std::cout << "parse error: " << s << std::endl;
    exit(-1);
}
