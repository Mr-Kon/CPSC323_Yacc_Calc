all: lex yacc cc

lex:
	lex lexfile.l

yacc:
	yacc -d yaccfile.y

cc:
	cc lex.yy.c y.tab.c -ll