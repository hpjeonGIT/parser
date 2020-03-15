%{
#include <iostream>
#include <cstdio>
#include <cstring>
extern int yylex();
extern int yyparse();
void yyerror(char **tokens, double *values, int &ncount, const char *s);
bool IGNORE = false;
bool IGNORE_LONG = false;
int ntokens = 0;
int nvalues = 0;
%}

// Symbols.
%parse-param {char **tokens} {double *values} {int &ncount}

%union
{
	char	*sval;
	double    fval;
};

%token <sval> IDENTIFIER
%token <fval> VALUE
%token <sval> UNKNOWN
%token BLOCKSTART BLOCKEND COMMENT NEWLINE ASSIGN LCOMMENT_START LCOMMENT_END
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
    | expr UNKNOWN {
        //std::cout << "unknown " << $2 << std::endl; 
        free($2);
        }
    | expr COMMENT {IGNORE = true;}
    | expr NEWLINE {IGNORE = false;}
    | expr LCOMMENT_START {IGNORE_LONG = true;}
    | expr LCOMMENT_END {IGNORE_LONG = false;}    
    | expr VALUE { 
        if (! IGNORE && ! IGNORE_LONG) {
            //std::cout << "value =" << $2 << std::endl;
            //values.push_back($2); Using STL causes memory corruption (?)
            values[nvalues] = $2;
            nvalues ++; ncount = nvalues;
        }
    }   
    | expr IDENTIFIER {
        if (! IGNORE && ! IGNORE_LONG) {
            //std::cout << "identifier=" << $2 << std::endl;
            strcpy(tokens[ntokens], $2); // do not use: tokens[ntokens] = $2
            ntokens ++;        
            }
        else {
            //std::cout << "comment = " << $2 << std::endl;
        }
        free($2);
        
    }     
    | expr ASSIGN {
        if (! IGNORE && ! IGNORE_LONG) {
            //std::cout << "=  \n";
        }
    }     
;
%%    
    

//void yyerror(std::vector<std::string> &tokens, std::vector<double> &values, const char *s) {
void yyerror(char **tokens, double *values, int &ncount, const char *s) {
  printf("yyerror : %s\n",s);
}
