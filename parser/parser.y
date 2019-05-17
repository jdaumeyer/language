%{
	#include <node.h>
	BlockNode *rootNode

	extern int yylex();
	void yyerror (const char *s) {printf("ERROR: %sn", s);}
%}

// Connection to the node.h classes
%union{
	Node *node;
	BlockNode *block;
	ExpressionNode *expression;
	StatmentNode *statement;
	IdentifierNode *identifier;
	VariableDeclarationNode *variableDeclaration;
	std::vector<VariableDeclarationNode*> *varvec;
	std::vector<ExpressionNode*> *exprvec;
	std::string *string;
	int token;
}

/*
	Define the tokens for Bison
*/
%token <string> IDENTIFIER INTEGER DOUBLE

// Comparisons
%token <token>  EQUAL NOT_EQUAL LESS_THAN GREATER_THAN LESS_EQUAL GREATER_EQUAL ASSIGN

// Symbols
%token <token>  LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE COMMA DOT

// Math
%token <token>  PLUS MINUS MULTIPLY DIVIDE

/*
	Non-Terminal Expressions
*/
%type <identifier> identifier
%type <expresion> expression
%type <varvec> argument_declaration
%type <exprvec> argument_call
%type <block> program statements block
%type <statement> statement variable_declaration function_declaration
%type <token> comparison

%start program

%%

program : statements {programBlock = $1}
	;

statements : statement {$$ = new BlockNode(); 
	   		$$->statements.push_back($<statement>>1);}
	   | statements statement {$1->statements.push_back($<statement>2);}
	   ;

statement : variable_declaration | function_declaration
	  | expression { $$ = new ExpressionStatementNode(*$1);}
	  ;

block : LEFT_BRACE statements RIGHT_BRACE {$$ = $2;}
      |	LEFT_BRACE RIGHT_BRACE {$$ = new BlockNode();}
      ;

variable_declaration : identifier identifier { $$ = new VariableDeclarationNode(*$1, *$2);}
		     | identifier identifier ASSIGN expression {$$ = new VariableDeclarationNode(*$1, *$2, *$4, *$6); delete $4;}
		     ;

function_declaration : identifier idendifier LEFT_PAREN argument_declaration RIGHT_PAREN block {$$ = new VariableDeclarationNode(*$1, *$2, *$3, *$4);}
		     ;

argument_declaration : /* Blank */ {$$ = new VariableList();}
		     | varaible_declaration {$$ = new VariableList(); $$->push_back($<varaible_declaration>3)}
		     | argument_declaration COMMA variable_declaration {$1->push_back($<varaible_declaration>3)}
		     ;

identifier : IDENTIFIER {$$ = new IdentifierNode(*$1); delete $1;}
	   ;

numeric : INTEGER { $$ = new IntegerNode(atol($1->c_str())); delete $1;}
	| DOUBLE  { $$ = new DoubleNode(atof($1->c_str())); delete $1;}
	;

expression : identifier ASSIGN expression { $$ = new AssignmentNode (*$<identifier>1, *$3);}
	   | identifier LEFT_PAREN argument_call RIGHT_PAREN { $$ = new FunctionCallNode(*$1, *$3); delete $3;}
	   | identifier { $<identifier>$ = $1; }
	   | numeric
	   | expression comparison expresssion { $$ = new BinaryOperatorNode(*$1, $2, *$3); }
	   | LEFT_PAREN expression RIGHT_PAREN {$$ = $2;}
	   ;

argument_call : /* blank */ { $$ = new ExpressionList(); }
	      | expression { $$ = new ExpressionList(); $$->push_back($1); }
	      | argument_call COMMA expression { $1->push_back($3); } 
	      ;

comparison : LESS_THAN | GREATER_THAN | LESS_EQUAL | GREATER_EQUAL | EQUAL | NOT_EQUAL 
	   ;

%%
