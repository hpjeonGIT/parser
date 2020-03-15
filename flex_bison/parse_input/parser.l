%{
  #include "parser.tab.h"
  #include <string>  
%}

digit [0-9]
chars [a-zA-Z0-9]+
integer {digit}+
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp ({integer}|{real})[eE]-?{integer}
blanks          [ \t]+
identifier		{chars}+"_"{chars}*|{chars}

%%
{blanks}        { /* ignore */ }

"sim_start"		return(BLOCKSTART);
"sim_end"		return(BLOCKEND);
"#"             {return COMMENT;}
"//"             {return COMMENT;}
"/*"             {return LCOMMENT_START;}
"*/"             {return LCOMMENT_END;}
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
    //yylval.sval = std::string(yytext);
    return IDENTIFIER;
}

. {  // The others. If this option is not included, broken character might appear
    yylval.sval = (char *) malloc(strlen(yytext));
    strncpy(yylval.sval, yytext, strlen(yytext));   
    return UNKNOWN;
}

%%
