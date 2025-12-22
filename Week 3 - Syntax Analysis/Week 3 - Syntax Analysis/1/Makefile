all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example1

lex: example1.l
	lex example1.l

yacc: example1.y
	yacc -d example1.y

clean: lex.yy.c example1 y.tab.c  y.tab.h
	rm lex.yy.c example1 y.tab.c y.tab.h
