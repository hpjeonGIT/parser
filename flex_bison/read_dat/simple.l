%{
  #include <cstdio>
  #include "simple.tab.h" // from Bison
  //extern int yylex();
%}
%%
[ \t\n]          ;
[0-9]+\.[0-9]+   { yylval.fval = atof(yytext);   return FLOAT;}
[0-9]+           { yylval.ival = atoi(yytext);   return INT;  }
[a-zA-Z0-9]+     { yylval.sval = strdup(yytext); return STRING; }
#                { return COMMENT; }
.                ;
%%

