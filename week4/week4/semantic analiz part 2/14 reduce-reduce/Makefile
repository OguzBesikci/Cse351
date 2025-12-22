all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example14

yacc: example14.y
	yacc -d -v example14.y

lex: example14.l
	lex example14.l
clean:
	rm lex.yy.c y.tab.c  y.tab.h  example14
