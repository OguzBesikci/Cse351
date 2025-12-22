%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	int sum=0;
%}

%union
{
	int number;
	char * str;
}

%token <str> IDENTIFIER
%token <number> INTEGER
%token INTRSW EQUALSYM  PLUSOP


%%

decls:
	decls decl
	|
	decl
	;
decl:
	INTRSW IDENTIFIER EQUALSYM operand {
		cout<<"int "<<$2<<"="<<sum<<endl;
		sum=0;
	}
	;

operand:
	INTEGER
	{
		//cout<<"sum = "<<$1<<endl;
		sum+=$1;
	}
	|
	operand PLUSOP  INTEGER
	{
		//cout<<"sum = "<<$3<<" + sum"<<endl;
		sum+=$3;
	}
	;


%%
void yyerror(string s){
	cout<<"error: "<<s<<endl;
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
