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

%union
{
int number;
char * str;

}
%token <str> IDENTIFIER
%token <number> INTEGER
%token INTRSW EQUALSYM  PLUSOP MINUSOP

%type<number> operand

%%

decls:
	decls decl
	|
	decl;

decl:
	INTRSW IDENTIFIER EQUALSYM operand {
		cout<<$2<<"="<<$4<<endl;
	}
	;

operand:
	INTEGER
	{
		$$=$1;
	}
	|
	operand PLUSOP INTEGER
	{

		 $$ = $1 + $3;
	}
	|
	operand MINUSOP INTEGER
	{

		$$ = $1 - $3;
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
