

digit   [0-9]
letter  [A-Za-z]


%{
// example that recognizes tel numbers with pattern of 05dddddddd and converts it to 05d-ddd-dd-dd and recognizes the ordinary numbers.
	#include<iostream>
	#include<vector>
	#include<string>
	using namespace std;

	vector<int> numbers;
	vector<string> words;


%}

%option noyywrap
%% /* match identifier */


{letter}+ 	{
				words.push_back(string(yytext));
			}

{digit}+ 	{
				numbers.push_back(atoi(yytext));

			}

.|\n    {   /* Ignore all other */}
%%



int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);

	for(int i=0; i < numbers.size(); i++)
		cout<<numbers[i]<<endl;

	cout<<"--------------"<<endl;
	string a,b;

	for(int i=0; i < words.size(); i++)
		cout<<words[i]<<endl;

	return 0;
}
