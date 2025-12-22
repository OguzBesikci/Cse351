digit	[0-9]
letter	[A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern int yylval;
int linenum=1;
%}
%%
int	return INTRSW;
double return DOUBLERSW;
{letter}({letter}|{digit})*	return IDENTIFIER;
[0-9]+	return INTEGER;
([0-9]+\.[0-9]+)	return DOUBLEVAL;
=	return ASSIGNOP;
;	return SEMICOLON;
,	return COMMA;
\n	{linenum++;}
[ \t]+
%%
