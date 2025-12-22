digit	[0-9]
letter	[A-Za-z]

%{
	#include<iostream>
	using namespace std;
%}

%option noyywrap

%%	
{letter}({letter}|{digit})*	{
								cout<<yytext<<" is an ident"<<endl;
							}
[0-9]+	{
			cout<<yytext<<" is a number"<<endl;
		}
		
"=" {

		cout<<yytext<<" is an assignment operator"<<endl;
	}
	
";" {
		cout<<yytext<<" is a semicolon"<<endl;
	}
	
.|\n

%%


int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}

