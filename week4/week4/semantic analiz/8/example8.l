%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int linenum;
%}
%%

\+	return PLUSOP;
\=  {yylval.str = strdup(yytext); return ASSIGNOP;}
\; return SEMICOLON;
[a-zA-Z0-9]+ {yylval.str = strdup(yytext);return CHAR;}
\n	linenum++;
. {}
%%
