%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	#include <string.h>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
%}
%union
{
	char * str;
}

%token PLUSOP ASSIGNOP SEMICOLON
%token <str> CHAR
%type <str> strings
%%

statements:
  statements statement
	|
	statement
	;

statement:
  CHAR ASSIGNOP strings SEMICOLON
	{
		 cout<<$1<<" = "<<$3<<endl;
	}

strings:
  CHAR PLUSOP strings
	{
		string combined = string($1) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	CHAR
	{
		 $$=strdup($1);
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
