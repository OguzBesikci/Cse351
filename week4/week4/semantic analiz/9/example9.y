%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	#include <string.h>
	#include "y.tab.h"
	using namespace std;

	extern FILE *yyin;
	extern int yylex();
	extern int linenum;
	void yyerror(string s);


    FILE *out;
%}

%union
{
	char *str;
}
%token PLUSOP ASSIGNOP OPB COMA CLB
%token <str> VAR  NUM
%type <str> list sub_list

%%

statement:
	VAR ASSIGNOP list
	{
		cout<<"<"<<$1<<">\n"<<$3<<"\n"<<"</"<<$1<<">\n";
	};

list:
 	OPB sub_list CLB
	{
		$$=$2;
	}
	;
		
sub_list:
	sub_list COMA NUM
	{
		string combined =  string($1) + "\n<i>"  + string($3) +"</i>";
		$$ = strdup(combined.c_str());
	}
    |
    NUM
	{
		string combined="<i>"+string($1)+"</i>";
		$$ = strdup(combined.c_str());
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

    return 0;
}
