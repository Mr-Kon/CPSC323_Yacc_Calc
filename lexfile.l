%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

number		[0-9]+
operator	[-+()*/]
whitespace  [ \t\f\v]

%%

{number} {
			yylval.num = atoi(yytext);
			return INTEGER;
		 }

{operator}	{return *yytext;}

{whitespace} {;}

[\n] {return 0;}

%%

int yywrap(){
	return 1;
}
