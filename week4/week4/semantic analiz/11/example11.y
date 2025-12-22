%{
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
%token <number>  NUM
%type <number> list sub_list

%%

st:
		VAR ASSIGNOP list
		{

		};

list:
	 	OPB sub_list CLB
		{
			cout<<"it is sorted"<<endl;
		}
		;
sub_list:
		sub_list CMM NUM
		{
			if($1 < $3)
				$$ = $3;
			else
			{
				cout<<"not sorted "<<endl;
				return 0;
			}
		}
	  |
	  NUM
		{
			$$ = $1;


		};

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
