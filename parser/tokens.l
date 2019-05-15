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
"="			return TOKEN(TEQUAL);
"=="			return TOKEN(TCEQ);
"!="			return TOKEN(TCNE);
"<"			return TOKEN(TCLT);

">"
