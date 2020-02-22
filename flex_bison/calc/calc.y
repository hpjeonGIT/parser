%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%{
#include <stdio.h>
#include <string.h>
  void yyerror(char *);
  int yylex(void);
  int sym[26];
%}

%%

program:
    program statement '\n'
    |
    ;

statement:
    expr                  { printf("resut= %d\n", $1); }
    | VARIABLE '=' expr   { sym[$1] = $3; }
    ;

expr:
    INTEGER
    | VARIABLE            { $$ = sym[$1]; }
    | expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr       { $$ = $1 / $3; }
    | '(' expr ')'        { $$ = $2; } /* the order matters. This line is tested first */
    ;

%%
void yyerror(char *s)
{
  printf("%s\n", s);

}

int main(void)
{
  yyparse();
  return 0;
}
			
