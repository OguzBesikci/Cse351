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



%}

%union
{
	char *str;
	int number;
}
%token PLUSOP ASSIGNOP OPB CMM CLB VAR
%token <number>  NUM1 NUM2



%%

list:
 	OPB sub_list CLB

	;

sub_list:
	sub_list CMM NUM1  PLUSOP NUM1
    |
    NUM1  PLUSOP NUM1
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
	cout<<"this is end\n";
    return 0;
}
