%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "Token.h"
%}


digit   [0-9]
letter  [a-zA-Z]

%%
"if"                            { printf("IF\n"); setType(If); }
"then"                          { printf("THEN\n"); setType(Then); }
"else"                          { printf("ELSE\n"); setType(Else); }
"<"                             { printf("LESS_THAN\n"); setType(LessThan); }
">"                             { printf("GREATHER_THAN\n"); setType(GreaterThan); }
"<="                            { printf("LESS_OR_EQUAL\n"); setType(LessOrEqual); }
">="                            { printf("GREATHER_OR_EQUAL\n"); setType(GreaterOrEqual); }
"="                             { printf("EQUAL\n"); setType(Equal); }
"<>"                            { printf("NOT_EQUAL\n"); setType(NotEqual); }
{letter}({letter}|{digit})*     { printf("<IDENTIFIER, %s>\n", yytext); setIdentifier(yytext); setType(Identifier); }
{digit}+                        { printf("<NUMBER, %s>\n", yytext); setNum(atoi(yytext)); setType(Number); }
[ \t\n\r]            /* skip whitespace */
<<EOF>>                         { printf("EOF\n"); return 0; }
.                    { printf("Unknown character [%c]\n",yytext[0]); }
%%

int yywrap(void){return 1;}

int main(int argc, char *argv[]) {
    char fileName[64];
    printf("Digite o nome do arquivo de entrada: ");
    scanf("%s", fileName);

    yyin = fopen(fileName, "r");
    if (!yyin) {
        printf("O arquivo %s nao existe!\n", fileName);
        exit(EXIT_FAILURE);
    }

    yylex();
    return 0;
}