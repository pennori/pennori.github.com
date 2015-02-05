package study.algorithm.tree.avlTree;

public class Node {
	public int keyData;

	public Node leftChild;
	public Node rightChild;

	public int height = 0;

	public void showNode() {
		System.out.print('[');
		System.out.print(keyData);
		System.out.print(']');
	}
}
