class Tree:
    def __init__(self, group=None, value=None):
        self.left  = ""
        self.right = ""
        self.group = group
        self.value = value

    def addLeft(self, node):
        self.left = node

    def addRight(self, node):
        self.right = node

    def __repr__(self):
        if self.left != "" and self.right != "":
            return "Node( " + self.group + " : " + self.value + " )[ " + str(self.left)  + ", " + str(self.right) + "]"
        else:
            return "Node( " + self.group + " : " + self.value + " )"
