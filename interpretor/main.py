from tree import *
from token import *
keywords   = ("add", "int", "bool", "float", "string", "array", "function", "if", "do", "return", "import", "set")
opperators = ("*", "-", "+", "/", "^", "%", "&", "==", ">=", "<=", "!")

tree = Tree()

def tokenize(code):
    tokens = []
    for i in range(0, len(code)):
        if(code[i] in keywords):
            print("KEYWORD")
            tokens.push(Token("keyword", code[i]))
        elif(code[i] in opperators): 
            print("OPPERATOR")
            tokens.push(Token("opperator", code[i]))
        else:
            print("UNKNOWN")
            tokens.push(Token("unkown", code[i]))
    return tokens

while __name__ == "__main__":
    snippet = input("> ").split(" ")
    print(snippet)
    print(tokenize(snippet))    
