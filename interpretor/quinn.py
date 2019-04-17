functions = (("pi"),("int","float","bool","string","if","while","++","--","toString","import","return","output"),("define","=","+","-","*","/","%","<",">","<=",">=","==","iterate"),("for"))

def codeTree(code):
    code = code.split(" ")
    depth = 0
    params = ()

    for i in range(0, len(code)):
        output = ""
        if depth > 2:
            for i in range(0,depth-2):
                output += "  "
        if depth > 0:
            output += "└─"
        
        p = -1
        for paramCount in range(0, len(functions)):
            if code[i] in functions[paramCount]:
                p = paramCount
        if (p == -1):
            params[size(params)-1]--
        else:
            params.push(p)

        if params[size(params)-1] <= 0:
            
        print(output)
            
            
        

while True:
    codeInput = input("> ")
    codeTree(codeInput)
