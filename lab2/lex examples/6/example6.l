digit	[0-9]
letter	[A-Za-z]
%{
	#include<iostream>
	using namespace std;
%}

%option noyywrap

%%

	


"main"  {
			cout<<"it is main"<<endl;
		}
		
"int" 	{
			cout<<"it is int reserved keyword"<<endl;
		}
	
"if"	{
			cout<<"it is if reserved keyword"<<endl;
		}
		
[0-9]+ 	{
			cout<<"it is a number"<<endl;
		}
{letter}({letter}|{digit})*	{
			
			cout<<"it is an ident"<<endl;
		
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

