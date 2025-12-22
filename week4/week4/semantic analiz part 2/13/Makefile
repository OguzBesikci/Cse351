all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example13

yacc: example13.y
	yacc -d example13.y

lex: example13.l
	lex example13.l
clean:
	rm lex.yy.c y.tab.c  y.tab.h  example13
