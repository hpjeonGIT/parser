%{
#include <iostream>
#include <vector>
#include <string>
extern int yylex();
extern int yyparse();
void yyerror(std::vector<std::string> &tokens, std::vector<double> &values, 
    const char *s);
bool IGNORE = false;
%}

// Symbols.
%parse-param {std::vector<std::string> &tokens} {std::vector<double> &values}
%union
{
	char	*sval;
	float    fval;
};
%token <sval> IDENTIFIER
%token <fval> VALUE
%token BLOCKSTART BLOCKEND COMMENT NEWLINE ASSIGN
%%

input:
    expr
    ;
    
expr:
    | expr BLOCKSTART {
        //std::cout << "Start" << std::endl; 
        }
    | expr BLOCKEND {
        //std::cout << "End" << std::endl; 
        }
    | expr COMMENT {IGNORE = true;}
    | expr NEWLINE {IGNORE = false;}
    | expr VALUE { 
        if (! IGNORE) {
            //std::cout << "value =" << $2 << std::endl;
            values.push_back($2);
        }
    }   
    | expr IDENTIFIER {
        if (! IGNORE) {
            //std::cout << $2 << std::endl;
            tokens.push_back($2);
        }
    }     
    | expr ASSIGN {
        if (! IGNORE) {
            //std::cout << "=  \n";
        }
    }     
;
%%    
    

void yyerror(std::vector<std::string> &tokens, std::vector<double> &values, 
    const char *s) {
  printf("yyerror : %s\n",s);
}
