%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	extern int linenum;// use variable linenum from the lex file
%}
%token TYPE IDENTIFIER INTEGER ASSIGNOP SEMICOLON DOUBLEVAL COMMA
%%

statements:
	statement statements
	|
	statement
	;

statement:
	single_assignment
	|
	declaration
	;

single_assignment:
	IDENTIFIER ASSIGNOP number SEMICOLON
	;


declaration:
	TYPE assignment_list SEMICOLON
	;


assignment_list:
	assignment
	|
	assignment_list COMMA assignment
	;


assignment:
	IDENTIFIER ASSIGNOP number
	|
	IDENTIFIER
	;

number:
	INTEGER
	|
	DOUBLEVAL
	|
	IDENTIFIER
	;


%%
void yyerror(string s){
	cerr<<"Error at line: "<<linenum<<endl;
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
