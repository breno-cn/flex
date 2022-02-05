#include <stdlib.h>
#include <string.h>

#include "Token.h"

int num = 0;
char identifierBuff[BUFFER_SIZE];
TokenType _type;

Token *Token_new(TokenType type, void *value) {
    Token *token = malloc(sizeof(Token));
    if (!token)
        return NULL;

    token->type = type;

    if (type == Number)
        token->numericValue = (int) value;
    else if (type == Identifier)
        token->identifierValue = (char *) value;

    return token;   
}

void Token_delete(Token *token) {
    if (!token)
        return;

    if (token->type == Identifier)
        free(token->identifierValue);

    free(token);
}

void setNum(int value) {
    num = value;
}

void setIdentifier(char *value) {
    strcpy(identifierBuff, value);
}

int getNum() {
    return num;
}

char *getIdentifier() {
    return identifierBuff;
}

void setType(TokenType type) {
    _type = type;

}

TokenType getType() {
    return _type;
}
