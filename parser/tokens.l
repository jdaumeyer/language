%{
#include <string>
#include "node.h"
#include "parser.hpp"
#define SAVE_TOKEN yylval.string == new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
}%

%%

// Auxllary Tokens
[ \t\n]			;
[a-zA-Z_][a-zA-Z0-9_]*	SAVE_TOKEN; return TIDENTIFIER;

// Comparison Tokens
"="			return TOKEN(ASSIGN);
"=="			return TOKEN(EQUAL);
"!="			return TOKEN(NOT_EQUAL);
"<"			return TOKEN(LESS_THAN);
">"			return TOKEN(GREATER_THAN);
"<="			return TOKEN(LESS_EQUAL);
">="			return TOKEN(GREAT_EQUAL);

// Delimiter Tokens
"("			return TOKEN(LEFT_PAREN);
")"			return TOKEN(RIGHT_PAREN);
"}"			return TOKEN(LEFT_BRACE);
"{"			return TOKEN(RIGHT_BRACE);
","			return TOKEN(COMMA);
"."			return TOKEN(DOT);

// Math Tokens
"+"			return TOKEN(PLUS);
"-"			return TOKEN(SUBTRACT);
"*"			return TOKEN(MULTIPLY);
"/"			return TOKEN(DIVIDE);

