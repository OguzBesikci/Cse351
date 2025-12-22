digit	[0-9]
letter	[A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
%%

"int"		{
			return INTRSW;
		}

[0-9]+ 	{
			yylval.number=atoi(yytext);
			return INTEGER;
		}

\+		return PLUSOP;
\= 		return EQUALSYM;

{letter}({letter}|{digit})* 	{
		yylval.str=strdup(yytext);
		return IDENTIFIER;
	}
\n
[ \t]+
%%
