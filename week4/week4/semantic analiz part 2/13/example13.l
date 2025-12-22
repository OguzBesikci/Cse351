digit	[0-9]

%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int linenum;

%}
%%
[a-zA-Z][a-zA-Z0-9]* {return VAR;}
{digit}{1} {yylval.number= atoi(yytext);return NUM1;}
{digit}{2} {yylval.number= atoi(yytext);return NUM2;}
\=  return ASSIGNOP;
\[  return OPB;
\]  return CLB;
\,  return CMM;
\n	linenum++;
[ \t]+
%%
