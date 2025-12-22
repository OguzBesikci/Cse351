digit	[0-9]
letter	[A-Za-z]

%{
	#include<iostream>
	using namespace std;
	int count;
%}

%option noyywrap

%% /* match identifier */

{letter}({letter}|{digit})*	{
	
		
		count++; 
		cout<<count<<". matches "<<yytext<<endl;
	}
	
	
.|\n    {   /* Ignore all other */}
%%



int main(int argc, char *argv[]) {
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  cout<<"number of identifiers = "<<count<<endl;
  return 0;
}
