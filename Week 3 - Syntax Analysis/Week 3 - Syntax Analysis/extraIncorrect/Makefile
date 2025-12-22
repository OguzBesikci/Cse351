all: lex yacc 
	g++ lex.yy.c y.tab.c -ll -o extra

yacc: extra.y
	yacc -d extra.y

lex: extra.l
	lex extra.l

clean: lex.yy.c y.tab.c extra y.tab.h
	rm lex.yy.c y.tab.c extra y.tab.h
