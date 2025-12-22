%{

	/*
		this is a shift reduce example
		solution to the shift reduce is given in example 13

	*/
	#include <stdio.h>
	#include <iostream>
	#include <string>
	#include "y.tab.h"
	using namespace std;

	extern FILE *yyin;
	extern int yylex();
	extern int linenum;
	void yyerror(string s);

	string finalOutput="";
	string output1="";
	string output2="";

%}

%union
{
	char *str;
	int number;
}
%token PLUSOP ASSIGNOP OPB CMM CLB VAR
%token <number>  NUM1 NUM2


%%

S:
	T
	|

    ;

T: NUM1 NUM1 T
	|
	;
%%

void yyerror(string s){
	cout<<"error at line: "<<linenum<<endl;
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
	//cout<<finalOutput<<endl;
    return 0;
}
