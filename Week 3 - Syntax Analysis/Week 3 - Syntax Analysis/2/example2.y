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
%token INTRSW FLOATRSW IDENT COMMA SEMICOLON EQUAL NUMBER
%%

lines:
	decl lines
	|
	decl
	;


decl:
	type decl_body_list SEMICOLON {cout<<"1\n";}
	;

type:
	INTRSW {cout<<"2\n";}
	|
	FLOATRSW {cout<<"3\n";}
	;

decl_body_list:
	decl_body {cout<<"4\n";}
	|
	decl_body COMMA decl_body_list {cout<<"5\n";}
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
