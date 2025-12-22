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
	In yacc, first the rules are applied, then the action is performed.
	Since statements is a recursive function, it is important to be carefull about the actions.
	In this example, linenum will be printed incorrectly, since the recursion access all the assignments then performs the action.
	accessing all the assignments means that yacc will access all the assignments in the file. So it will access all the "\n" symbols.
	So the linenum variable will increase and get its final form when the recursion ends.
	Then the action will be performed after the linenum gets its final form which is wrong in this case.
	It is like this function below. It first goes to recursion then print x. In this case output will be 1,2,3,4 if the f1 is called with 4

	int f1(int x)
	{
		if(x > 0)
		{
			f(x-1);
			printf("%d",x);
		}
	}


*/
statements:
	assignment statements
	{
		//In this part, cout works after "assignment statements" ends
		cout<<"there is a assignment in line: "<<linenum<<endl;
	}
	|
	assignment
	{
		//In this part, cout works after "assignment" ends
		cout<<"there is a assignment in line: "<<linenum<<endl;
	}
	;

assignment:
	IDENTIFIER ASSIGNOP INTEGER
	{
		//cout<<"there is a assignment in line: "<<linenum<<endl;
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
