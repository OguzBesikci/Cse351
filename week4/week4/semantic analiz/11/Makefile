all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example11

yacc: example11.y
	yacc -d example11.y

lex: example11.l
	lex example11.l
clean:
	rm lex.yy.c y.tab.c  y.tab.h  example11
