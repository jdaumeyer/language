class Token:

    def __init__(self, group, value):
        self.group = group
        self.value = value
    def __repr__(self):
        return "Token( " + self.group + " : " + self.value + " )"
