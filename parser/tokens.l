%{
#include <string>
#include "node.h"
#include "parser.hpp"
#define SAVE_TOKEN yylval.string == new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
}%

%%

[ \t\n]			;
[a-zA-Z_][a-zA-Z0-9_]*	SAVE_TOKEN; return TIDENTIFIER;
"="			return TOKEN(ASSIGN);
"=="			return TOKEN(EQUAL);
"!="			return TOKEN(NOT_EQUAL);
"<"			return TOKEN(LESS_THAN);
">"			return TOKEN(GREATER_THAN);
"<="			return TOKEN(LESS_EQUAL);
">="			return TOKEN(GREAT_EQUAL);
"("			return TOKEN(LEFT_PAREN);
")"			return TOKEN(RIGHT_PAREN);
