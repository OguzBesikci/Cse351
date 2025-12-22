/*** Definition section ***/


%{
#include<iostream>
using namespace std;
%}


%option noyywrap

%%

[0-9]+  {
            
            cout<<"Saw an integer: "<<yytext<<endl;
		}

.|\n    { }

%%


int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}
