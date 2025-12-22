all: lex yacc
	g++ lex.yy.c y.tab.c -ll -o example4

yacc: example4.y
	yacc -d example4.y

lex: example4.l
	lex example4.l

run: example4
	./example4 input.txt
clean:
	rm lex.yy.c y.tab.c  y.tab.h  example4
