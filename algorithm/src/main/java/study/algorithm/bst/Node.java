package unknown.bst;

public class Node {
	private int data;
	private Node leftChild;
	private Node rightChild;

	public Node(int data) {
		this.data = data;
		this.leftChild = null;
		this.rightChild = null;
	}

	public Node() {
		super();
	}

	public int getData() {
		return data;
	}

	public Node getLeftChild() {
		return leftChild;
	}

	public void setLeftChild(Node leftChild) {
		this.leftChild = leftChild;
	}

	public Node getRightChild() {
		return rightChild;
	}

	public void setRightChild(Node rightChild) {
		this.rightChild = rightChild;
	}

	public void showNode() {
		System.out.print('[');
		System.out.print(data);
		System.out.print(']');
	}

}
