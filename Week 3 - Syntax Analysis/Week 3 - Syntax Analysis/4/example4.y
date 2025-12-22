%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	bool errorFlag=false;
	extern int linenum;// use variable linenum from the lex file
%}
%token TYPE IDENTIFIER INTEGER SEMICOLON DOUBLEVAL COMMA IF EQ THEN FI
%%

statements:
	statement statements
	|

	;

statement:
	assignment
	|
	comparison
	;

assignment:
	IDENTIFIER EQ number SEMICOLON
	;

number:
	INTEGER
	|
	DOUBLEVAL
	|
	IDENTIFIER
	;

comparison:
		IF number EQ EQ number THEN statements FI
		|
		IF number EQ EQ number statements FI
		{
			cout<<"missing then in line "<<linenum<<endl;
			errorFlag=true;
		}
;


%%
void yyerror(string s){
	cerr<<"Error at line: "<<linenum<<endl;
	errorFlag=true;
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
	if(errorFlag==false)
		cout<<"completed without an error"<<endl;
    return 0;
}
