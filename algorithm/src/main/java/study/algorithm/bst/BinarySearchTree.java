package unknown.bst;

public class BinarySearchTree {
	private Node root;

	public Node getRoot() {
		return root;
	}

	public void setRoot(Node root) {
		this.root = root;
	}

	public BinarySearchTree() {
		super();
		setRoot(null);
	}
	
	public void traverse(int type){
		switch (type) {
		case 1:
			System.out.println("PreOrder traversal : ");
			preOrder(root);
			break;

		case 2:
			System.out.println("InOrder traversal : ");
			inOrder(root);
			break;

		case 3:
			System.out.println("PostOrder traversal : ");
			postOrder(root);
			break;

		default:
			break;
		}
		
		System.out.println();
	}
	
	public void preOrder(Node tempRoot){
		if (null != tempRoot) {
			System.out.println(tempRoot.getData() + " ");
			preOrder(tempRoot.getLeftChild());
			preOrder(tempRoot.getRightChild());
		}
	}
	
	public void inOrder(Node tempRoot){
		if (null != tempRoot) {
			preOrder(tempRoot.getLeftChild());
			System.out.println(tempRoot.getData() + " ");
			preOrder(tempRoot.getRightChild());
		}
	}
	
	public void postOrder(Node tempRoot){
		if (null != tempRoot) {
			preOrder(tempRoot.getLeftChild());
			preOrder(tempRoot.getRightChild());
			System.out.println(tempRoot.getData() + " ");
		}
	}
	
	public void insert(int key){
		Node insertNode = new Node(key);
		
		if (null == root) {
			root = insertNode;
		} else {
			
			Node current = root;
			Node parent;
			
			while (true) {
				
				parent = current;
				
				if (key < current.getData()) {
					
					current = current.getLeftChild();
					
					if (null == current) {
						parent.setLeftChild(insertNode);
						return;
					}
					
				} else {
					
					current = current.getRightChild();
					if (null == current) {
						parent.setRightChild(insertNode);
						return;
					}
					
				}
				
			}
			
		}
	}
	
	public void delete(int key){
		Node current = root;
		Node parent = current;
		
		if (null == current) {
			return;
		}
		
		while (key != current.getData()) {

			parent = current;
			
			if (key < current.getData()) {
				current = current.getLeftChild();
			} else {
				current = current.getRightChild();
			}
			
		}
		
		if (null == current.getLeftChild() && null == current.getRightChild()) {
			
			if (current == root) {
				root = null;
			} else if (current == parent.getLeftChild()) {
				parent.setLeftChild(null);
			} else {
				parent.setRightChild(null);
			}
			
		} else if (null == current.getRightChild()) {
			
			if (current == root) {
				root = current.getLeftChild();
			} else if (current == parent.getLeftChild()) {
				parent.setLeftChild(current.getLeftChild());
			} else {
				parent.setRightChild(current.getLeftChild());
			}
			
		} else if (null == current.getLeftChild()) {
			
			if (current == root) {
				root = current.getRightChild();
			} else if (current == parent.getLeftChild()) {
				parent.setLeftChild(current.getRightChild());
			} else {
				parent.setRightChild(current.getRightChild());
			}
			
		} else {
			
			Node candidate = getCandidate(current);
			
			if (current == root) {
				root = candidate;
			} else if (current == parent.getLeftChild()) {
				parent.setLeftChild(candidate);
			} else {
				parent.setRightChild(candidate);
			}
			
			candidate.setLeftChild(current.getLeftChild());
			
		}
	}

	private Node getCandidate(Node deleteNode) {
		Node candidateParent = deleteNode;
		Node candidate = candidateParent.getRightChild();
		
		while (null != candidate.getLeftChild()) {
			candidateParent = candidate;
			candidate = candidate.getLeftChild();
		}
		
		if (candidate != deleteNode.getRightChild()) {
			candidateParent.setLeftChild(candidate.getRightChild());
			candidate.setRightChild(deleteNode.getRightChild());
		}
		return candidate;
	}

}
