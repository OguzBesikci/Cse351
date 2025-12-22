all: lex yacc 
	g++ lex.yy.c y.tab.c -ll -o example3

lex: example3.l
	lex example3.l


yacc: example3.y
	yacc -d example3.y


clean: lex.yy.c example3 y.tab.c  y.tab.h
	rm lex.yy.c example3 y.tab.c y.tab.h
