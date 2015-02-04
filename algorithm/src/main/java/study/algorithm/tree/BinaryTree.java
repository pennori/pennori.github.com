package study.algorithm.tree;

import java.util.Stack;

public class BinaryTree {
	private Node root;

	public BinaryTree() {
		root = null;
	}

	public void traverse(int type) {
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

	private void preOrder(Node tempRoot) {
		if (null != tempRoot) {
			System.out.print(tempRoot.keyData + " ");
			preOrder(tempRoot.leftChild);
			preOrder(tempRoot.rightChild);
		}
	}

	private void inOrder(Node tempRoot) {
		if (null != tempRoot) {
			inOrder(tempRoot.leftChild);
			System.out.print(tempRoot.keyData + " ");
			inOrder(tempRoot.rightChild);
		}
	}

	private void postOrder(Node tempRoot) {
		if (null != tempRoot) {
			postOrder(tempRoot.leftChild);
			postOrder(tempRoot.rightChild);
			System.out.print(tempRoot.keyData + " ");
		}
	}

	public Node find(int key) {
		Node current = root;
		while (current.keyData != key) {
			// 탐색 실패
			if (current == null) {
				return null;
			}
			// 키 값이 현재 노드의 키값보다 작은 경우
			if (key < current.keyData) {
				current = current.leftChild;
				// 키 값이 현재 노드의 키값보다 큰 경우
			} else {
				current = current.rightChild;
			}

		}
		// 탐색 성공, 현재 노드 반환
		return current;
	}

	public Node findMin() {
		Node current = root;

		while (current.leftChild != null) {
			current = current.leftChild;
		}

		return current;
	}

	public Node findMax() {
		Node current = root;

		while (current.rightChild != null) {
			current = current.rightChild;
		}

		return current;
	}

	public void insert(int key) {
		// 새 노드 생성
		Node insertNode = new Node();
		insertNode.keyData = key;

		// 새로운 트리 생성
		if (null == root) {
			root = insertNode;
		} else {
			
			Node current = root;
			Node parent;

			while (true) {
				// 부모노드 설정
				parent = current;

				if (key < current.keyData) {
					
					current = current.leftChild;
					// 현재 위치에 삽입 가능
					if (null == current) {
						parent.leftChild = insertNode;
						return;
					}
					
				} else {
					
					current = current.rightChild;
					if (null == current) {
						parent.rightChild = insertNode;
						return;
					}
					
				}

			}

		}
	}

	public boolean delete(int key) {
		Node current = root;
		Node parent = current;

		while (current.keyData != key) {
			// 키 값을 갖는 노드 없음
			if (null == current) {
				return false;
			}

			parent = current;

			if (key < current.keyData) {
				current = current.leftChild;
			} else {
				current = current.rightChild;
			}

		}

		if (current.leftChild == null && current.rightChild == null) {
			// 트리 삭제
			if (current == root) {
				root = null;
			} else if (current == parent.leftChild) {
				parent.leftChild = null;
			} else {
				parent.rightChild = null;
			}
			// 자식이 하나일 때
			// 왼쪽 자식만 존재
		} else if (current.rightChild == null) {

			if (current == root) {
				root = current.leftChild;
			} else if (current == parent.leftChild) {
				parent.leftChild = current.leftChild;
			} else {
				parent.rightChild = current.leftChild;
			}
			// 오른쪽 자식만 존재
		} else if (current.leftChild == null) {

			if (current == root) {
				root = current.rightChild;
			} else if (current == parent.leftChild) {
				parent.leftChild = current.rightChild;
			} else {
				parent.rightChild = current.rightChild;
			}
			// 자식이 둘일 때
		} else {
			// 삭제노드의 후보노드 찾기
			Node candidate = getCandidate(current);

			if (current == root) {
				root = candidate;
			} else if (current == parent.leftChild) {
				parent.leftChild = candidate;
			} else {
				parent.rightChild = candidate;
			}

			candidate.leftChild = current.leftChild;
		}

		return true;
	}

	// 후보노드를 찾고 후보노드를 삭제노드의 오른쪽 노드로 만든다.
	private Node getCandidate(Node deleteNode) {
		Node candidateParent = deleteNode;
		Node candidate = candidateParent.rightChild;

		while (candidate.leftChild != null) {
			candidateParent = candidate;
			candidate = candidate.leftChild;
		}

		// 후보노드가 삭제노드 오른쪽 자식의 왼쪽 자식일 때
		if (candidate != deleteNode.rightChild) {
			candidateParent.leftChild = candidate.rightChild;
			candidate.rightChild = deleteNode.rightChild;
		}

		return candidate;
	}

	public void display() {
		Stack globalStack = new Stack();
		globalStack.push(root);
		int blank = 32;
		boolean isRowEmpty = false;

		while (isRowEmpty == false) {

			Stack localStack = new Stack();
			isRowEmpty = true;

			for (int i = 0; i < blank; i++) {
				System.out.print(' ');
			}

			while (globalStack.isEmpty() == false) {

				Node temp = (Node) globalStack.pop();

				if (temp != null) {

					System.out.print(temp.keyData);
					localStack.push(temp.leftChild);
					localStack.push(temp.rightChild);

					if (temp.leftChild != null || temp.rightChild != null) {
						isRowEmpty = false;
					}

				} else {
					
					System.out.print("**");
					localStack.push(null);
					localStack.push(null);
					
				}
				
				for (int i = 0; i < blank * 2 - 2; i++) {
					System.out.print(' ');
				}

			}

			System.out.println();
			blank = blank / 2;

			while (localStack.isEmpty() == false) {
				globalStack.push(localStack.pop());
			}

		}

		System.out.println();

	}
}
