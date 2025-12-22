%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
%}
%token INTRSW FLOATRSW IDENT  COMMA NUMBER EQUAL SEMICOLON
%%


decl:
	type decl_body SEMICOLON
	;

type:
	INTRSW
	|
	FLOATRSW
;

decl_body:
	IDENT
	|
	IDENT EQUAL value
	;

value:
	NUMBER
	|
	IDENT
	;

%%
void yyerror(string s){
	cout<<"error "<< s<<endl;

}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
    return 0;
}
