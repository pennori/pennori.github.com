package study.algorithm.tree;

public class Node {
	public int keyData;
	public Node leftChild;
	public Node rightChild;

	public void showNode() {
		System.out.print('[');
		System.out.print(keyData);
		System.out.print(']');
	}
}
