from tree import *
from token import *
keywords   = ("add", "int", "bool", "float", "string", "array", "function", "if", "do", "return", "import", "set")
opperators = ("*", "-", "+", "/", "^", "%", "&", "==", ">=", "<=", "!")
terminator = ("|")

# Given a string of code, tokenize the string and then 
# classify all of the tokens so the they can be passed
# into an Abstract Syntax Tree Generator funtion
def tokenize(code):
    code = code.split()
    tokens = []

    # Loop through the split string to identify all the tokens
    # and classify them based on the predefined tuples
    for i in range(0, len(code)):

        if(code[i] in keywords):
            print("KEYWORD")
            tokens.append(Token("keyword", code[i]))

        elif(code[i] in opperators): 
            print("OPPERATOR")
            tokens.append(Token("operator", code[i]))
        
        elif(code[i] in terminator):
            print("TERMINATOR")
            tokens.append(Token("terminator",code[i]))

        elif(code[i].isdigit()):
            print("INTEGER")
            tokens.append(Token("integer",code[i]))

        else:
            print("UNKNOWN")
            tokens.append(Token("unkown", code[i]))
    return tokens

def interpret(tokens):
    # Initialize the rood node, this can be assumed to be a 
    # function due to the syntax
    root = Tree(tokens[0].group, tokens[0].value)
    tokens.pop(0)
    
    # Loop through the rest of the tree
    i = 0
    while len(tokens) > 1 and tokens[i].group != "terminator":
        print(tokens[i].group)
        if tokens[i].group == "operator" or tokens[i].group == "keyword":
            print("Adding subtree")
            print(interpret(tokens[i - 1:len(tokens)]))
            if root.left == "":
                root.addLeft(interpret(tokens[i-1:len(tokens)]))
            else:
                root.addRight(interpret(tokens[i-1:len(tokens)]))
    
        elif (tokens[i].group == "integer" or tokens[i].group == "unkown") and root.left == "":
            print("Left " + str(tokens[i]))
            root.addLeft(Tree(tokens[i].group, tokens[i].value))
        
        elif (tokens[i].group == "integer" or tokens[i].group == "unkown"):
            print("Right " + str(tokens[i]))
            root.addRight(Tree(tokens[i].group, tokens[i].value))
        tokens.pop(0)
    return root

while __name__ == "__main__":
    snippet = input("> ")
    print(snippet)
    print(tokenize(snippet))  
    print(interpret(tokenize(snippet)))
