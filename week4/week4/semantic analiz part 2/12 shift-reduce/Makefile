all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example12

yacc: example12.y
	yacc -d -v example12.y

lex: example12.l
	lex example12.l
clean:
	rm lex.yy.c y.tab.c  y.tab.h  y.output example12
