%{
#include <stdlib.h>
void yyerror(char *);
#include "calc.tab.h"
%}

%%
[a-z]   {
          yylval = *yytext - 'a';
          return VARIABLE;
        }
 
[0-9]+  {
          yylval = atoi(yytext);
          return INTEGER;
        }

[-+()=/*\n] {
            return *yytext;
            }

[ \t]   ;  /* nothing will be done for other cases*/

.       yyerror("invalid character");
%%

int yywrap(void)
{
  return 1;
}
