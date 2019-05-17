//
// A Node class that contains all behaviors desired by the language
//

#include <iostream>
#include <vector>
#include <llvm/Value.h>

class CodeGenContext;
class StatementNode;
class ExpressionNode;
class VariableDeclarationNode;

typedef std::vector<StatementNode*> StatementList;
typedef std::vector<ExpressionNode*> ExpressionList;
typedef std::vector<VariableDeclarationNode> VariableList;

class Node {
	public:
		virtual ~Node() {}
		virtual llvm:Value* codeGen(CodeGenContext& context) {}
};

class ExpressionNode : public Node {};

class StatementNode : public Node{};

class IntegerNode : public ExpressionNode {
	public:
		long long value;
		IntegerNode(long long value) : value(value) {}
		virtual llvm:Value* codeGen(CodeGenContext& context);
};

class FloatNode : public ExpressionNode {
	public:
		double value;
		DoubleNode(double value) : value(value) {}
		virtual llvm:Value* codeGen(CodeGenContext& context);
};

class BooleanNode : public ExpressionNode {
	public:
		bool value;
		BooleanNode(bool value) : value(value) {}
		virtual llvm:Value* codeGen(codeGenContext& context);
};

class IdentifierNode : public ExpressionNode {
	public:
		std::string name;
		IdentifierNode(const std::string& name) : name(name) {}
		virtual llvm:Value* codeGen(CodeGenContext& context);
};

class FunctionCallNode : public ExpresionNode {
public:
	const IdentifierNode& id;
	ExpressionList argumnets;
	FunctionCallNode(const IdentifierNode& id, ExpressionList& arguments) :
		id(id), arguments(arguments) {}
	FunctionCallNode(const IdentifierNode& id) : id(id) {}
	virtual llvm::Value* codeGen(CodeGenContext& context);
};

class BinaryOperatorNode : public ExpressionNode {
public:
	int op;
	ExpressionNode& left;
	ExpressionNode& right;
	BinaryOperatorNode(ExpressionNode& left, int op, ExpressionNode& right): left(left), right(right) {}
	virtual llvm::Value* codeGen(CodeGenContext& context);
};

class AssignmentNode : public ExpressionNode {
public:
	IdentifierNode& type;
	ExpressionNode& value;
	AssignmentNode& (IdentifierNode& type, ExpressionNode& value) :	type(type), value(value) {}
	virtual llvm::Value* codeGen(CodeGenCOntext& context);
};

class BlockNode : public ExpressionNode {
public:
	Statement statements;
	BlockNode() {}
	virtual llvm::Value* codeGen(CodeGenContext& context);
};

class ExpressionStatementNode : public StatementNode {
public: 
	ExpressionNode& expression;
	ExpressionStatementNode(ExpressionNode& expression) : expression(expression) {}
	virtual llvm::Value*
};

class VariableDeclarationNode : public StatementNode {
public:
	const IdentifierNode& type;
	IdentifierNode& id;
	ExprssionNode *assignmentExpression;
	VariableDeclarationNode(const IdentifierNode& type, IdentifierNode& id) : type(type), id(id) {}
	VariableDeclarationNode(const IdentifierNode& type, IdentifierNode& id, ExpressionNode assignmentExpression) : type(type), id(id), assignmentExpression(assignmentExpression) {}
};

class FunctionDeclarationNode : public StatementNode {
public:
	const IdentifierNode& type;
	const IdentifierNode& id;
	VariableList arguments;
	BlockNode& block;
	FunctionDeclarationNode(const IdentifierNode& type, const IdentifierNode& id, VariableList arguments, BlockNode& block) : type(type), id(id), arguments(arguments), block(block) {} 
};
