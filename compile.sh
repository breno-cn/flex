#!/bin/bash

gcc -c Token.c &&
flex lexer.l &&
gcc lex.yy.c Token.o