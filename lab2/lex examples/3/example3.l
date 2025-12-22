
%{

	#include<iostream>
	using namespace std;
	int lineNumber=0;
%}

%option noyywrap

%%

(.*)\n {
			cout<<lineNumber++<<"\t"<<yytext<<endl;

		}

%%


int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}
