%{
  #include <cstdio>
  #include "block.tab.h" // from Bison
%}
%%
[ \t\n]          ;
BEGIN_DATA       { return START_READ; }
END_DATA         { return END_READ; }
[0-9]+\.[0-9]+   { yylval.fval = atof(yytext);   return FLOAT;}
[0-9]+           { yylval.ival = atoi(yytext);   return INT;  }
[a-zA-Z0-9]+     { yylval.sval = strdup(yytext); return STRING; }
#                ;
.                ;
%%

