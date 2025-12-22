all: lex yacc 
	g++ lex.yy.c y.tab.c -ll -o example2

lex: example2.l
	lex example2.l

yacc: example2.y
	yacc -d example2.y

clean: lex.yy.c example2 y.tab.c y.tab.h
	rm lex.yy.c example2 y.tab.c y.tab.h
