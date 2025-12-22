

digit   [0-9]
letter  [A-Za-z]


%{
// example that recognizes tel numbers with pattern of 05dddddddd and converts it to 05d-ddd-dd-dd and recognizes the ordinary numbers.
	#include<iostream>
	using namespace std;
	int sum=0;
%}

%option noyywrap
%% /* match identifier */




"05"{digit}{9} 	{ 	
					
					for(int i=0;i<strlen(yytext);i++){
						cout<<yytext[i];
						if(i==3 || i==6 || i==8) 
							cout<<"-";
					}
					cout<<endl;
				}
		

{digit}+ 	{
				sum += atoi(yytext);
				

			}

.|\n    {   /* Ignore all other */}
%%



int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	cout<<"sum is "<<sum<<endl;
	return 0;
}


