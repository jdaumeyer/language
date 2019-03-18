class pgm {}
class statement {}
class exp_node {}

class number_node : public exp {
	protected:
		int num;
	
	public:
		number_node::number_node(float value) {
			num = value;
		}
};

class id_node : public exp {
	protected:
		string id;

	public:
		id_node(string value) : id(value) {}
};

class plus_node : public node {
	protected:
		node *left;
		node *right;
	
	public:
		plus_node(node *L, node *R): left(L), right(R) {}
};

	
