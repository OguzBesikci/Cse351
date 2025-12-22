digit	[0-9]
letter	[A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern int yylval;
%}

%%
int return INTRSW;
float return FLOATRSW;
{letter}({letter}|{digit})* return IDENT;
{digit}+  return NUMBER;
"=" return EQUAL;
";" return SEMICOLON;
.|\n {}


%%
