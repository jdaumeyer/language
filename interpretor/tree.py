class Tree:
    def __init__(self, group=None, value=None):
        self.left  = None
        self.right = None
        self.group = group
        self.value = value

    def addLeft(self, node):
        self.left = node

    def addRight(self, node):
        self.right = node

