all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example4

lex: example4.l
	lex example4.l


yacc: example4.y
	yacc -d example4.y


clean: lex.yy.c example3 y.tab.c  y.tab.h
	rm lex.yy.c example3 y.tab.c y.tab.h

run: example4
	./example4 input.c
