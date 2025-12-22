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
%token INTRSW IDENTIFIER INTEGER ASSIGNOP SEMICOLON DOUBLEVAL DOUBLERSW COMMA
%%
/*
	First read the comments in the yacc file of extraIncorrect folder then come here.
	In this one, action is performed in the assignment rule. Since the action is aplied after the each assignment rule,
	linenum var will have correct value in each case.

	This example is written like the f2 function below.
	Unlike f1 function in the other example, f2 will print the x and then goes to recursion. Thus output will be 4,3,2,1.

	int f2(int x)
	{
		if(x > 0)
		{
			printf("%d",x);
			f(x-1);

		}
	}


*/
statements:
	assignment statements
	|
	assignment
	;
assignment:
	IDENTIFIER ASSIGNOP INTEGER
	{
		cout<<"there is a assignment in line: "<<linenum<<endl;
	}
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
