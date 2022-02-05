#define BUFFER_SIZE 1024

typedef enum {
    If, Then, Else, LessThan, GreaterThan, LessOrEqual, GreaterOrEqual, Equal, NotEqual, Number, Identifier
} TokenType;

typedef struct {
    TokenType type;
    union {
        int numericValue;
        char *identifierValue;
    };
} Token;

Token *Token_new(TokenType type, void *value);
void Token_delete(Token *token);

void setNum(int value);
void setIdentifier(char *value);
void setType(TokenType type);
int getNum();
char *getIdentifier();
TokenType getType();
