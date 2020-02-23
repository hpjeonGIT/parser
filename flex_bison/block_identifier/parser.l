%{
  #include "parser.tab.h"
%}

blanks          [ \t\n]+
identifier		[_a-zA-Z0-9]+

%%

{blanks}        { /* ignore */ }

"procedure"		return(PROCEDURE);
"{"				return(BLOCK);
"}"				return(ENDBLOCK);

{identifier}	{
				yylval.sval = (char *) malloc(strlen(yytext));
				strncpy(yylval.sval, yytext, strlen(yytext));
				return(IDENTIFIER);
}
