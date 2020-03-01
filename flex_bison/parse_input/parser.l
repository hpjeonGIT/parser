%{
  #include "parser.tab.h"
%}

digit [0-9]
integer {digit}+
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp ({integer}|{real})[eE]-?{integer}
blanks          [ \t]+
identifier		[_a-zA-Z0-9]+

%%
{blanks}        { /* ignore */ }

"sim_start"		return(BLOCKSTART);
"sim_end"		return(BLOCKEND);
[#]             {return COMMENT;}
[ \n]          {return NEWLINE;}
[=]          {return ASSIGN;}

{integer} {       yylval.fval = atof(yytext); 
                return VALUE;
}
{real} {       yylval.fval = atof(yytext); 
                return VALUE;
}
{exp} {       yylval.fval = atof(yytext); 
                return VALUE;
}

{identifier} {
    yylval.sval = (char *) malloc(strlen(yytext));
    strncpy(yylval.sval, yytext, strlen(yytext));
    return IDENTIFIER;
}
%%
