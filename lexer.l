%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "Token.h"
%}


digit   [0-9]
letter  [a-zA-Z]

%%
"if"                            { printf("IF\n"); return If; }
"then"                          { printf("THEN\n"); return Then; }
"else"                          { printf("ELSE\n"); return Else; }
"<"                             { printf("LESS_THAN\n"); return LessThan; }
">"                             { printf("GREATHER_THAN\n"); return GreaterThan; }
"<="                            { printf("LESS_OR_EQUAL\n"); return LessOrEqual; }
">="                            { printf("GREATHER_OR_EQUAL\n"); return GreaterOrEqual; }
"="                             { printf("EQUAL\n"); return Equal; }
"<>"                            { printf("NOT_EQUAL\n"); return NotEqual; }
{letter}({letter}|{digit})*     { printf("IDENTIFIER\n"); setIdentifier(yytext); printf("%s\n", getIdentifier()); return Identifier; }
{digit}+                        { printf("NUMBER\n"); printf("----%d\n", atoi(yytext)); setNum(atoi(yytext)); return Number; }
[ \t\n\r]            /* skip whitespace */
.                    { printf("Unknown character [%c]\n",yytext[0]); }
%%

int yywrap(void){return 1;}

main( argc, argv )
int argc;
char **argv;
    {
    ++argv, --argc;  /* skip over program name */
    if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;

    yylex();
    }