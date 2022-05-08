%{
#include <stdio.h>
int yylex();
int yyerror();
int i=0;
%}


%union{
    int num;
}

%type <num> E T F
%token <num>  INTEGER
%left '+' '-'
%left '*' '/'

%%

S : E                       {printf("Result = %i\n", $1); return 0;}
  ;

E:
          E '+' T           {$$ = $1 + $3;}
        | E '-' T           {$$ = $1 - $3;}
        | T                 {$$ = $1;}
        ;

T :
          T '*' F           {$$ = $1 * $3;}
        | T '/' F           {$$ = $1 / $3;}
        | F                 {$$ = $1;}
        ;

F : 
          '(' E ')'         {$$ = $2;}
        | '-' F             {$$ = -$2;}
        | INTEGER           {$$ = $1;}
        ;

%%

int yyerror() {
   printf("");
   i = 1;
}

int main(void) {
    while(1==1){
        printf("Enter the expression\n");

        yyparse();

        if(i==1)
          printf("Entered expression is Invalid!\n");
          i=0;

        printf("\n\n");
    }
    return 0;
}
