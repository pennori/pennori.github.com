package study.algorithm.tree.tree234;


public class Tree234 {
	// 트리의 루트 노드
	private Node root;

	public Tree234() {
		root = new Node();
	}

	// 탐색
	public Node find(int key) {
		Node current = root;

		while (true) {
			// 탐색 성공
			if (current.findItem(key) != -1) {
				return current;
				// 잎 노드에서 탐색 실패 = 존재하지 않는 키
			} else if (current.isLeaf()) {
				return null;
				// 일반노드에서 탐색 실패 = 하위트리로
			} else {

				int i;
				int itemNum = current.getItemNum();

				for (i = 0; i < itemNum; i++) {

					if (key < current.getItem(i)) {
						break;
					}

				}
				current = current.getChild(i);

			}

		}
	}

	// 삽입
	public void insert(int key) {
		Node current = root;
		while (true) {
			// 꽉 찬 노드인가?
			if (current.isFull()) {
				split(current);
				// 앞에서부터 다시 진행
				current = current.getParent();

				// 하위트리로
				int i;
				int itemNum = current.getItemNum();

				for (i = 0; i < itemNum; i++) {

					if (key < current.getItem(i)) {
						break;
					}

				}

				current = current.getChild(i);
				// 꽉 찬 노드가 아닌 잎 노드일 때
			} else if (current.isLeaf()) {

				current.insertItem(key);
				return;
				// 하위트리로
			} else {
				int i;
				int itemNum = current.getItemNum();

				for (i = 0; i < itemNum; i++) {

					if (key < current.getItem(i)) {

						break;

					}

					current = current.getChild(i);

				}

			}

		}
	}

	// 분할
	private void split(Node current) {
		int itemB, itemC;
		Node parent, childC, childD;
		int itemIndex;

		// 현 노드에서 이동을 위한 자료 삭제
		itemC = current.moveItem();
		itemB = current.moveItem();

		// 이동을 위한 자식노드 해제
		childC = current.disconnectChild(2);
		childD = current.disconnectChild(3);
		// 꽉 찬 노드가 루트노드일 경우
		if (current == root) {
			// 새로운 루트노드 생성
			root = new Node();
			// 현 노드를 새로운 루트의 첫번째 자식으로
			parent = root;
			root.connectChild(0, current);
			// 루트노드가 아닐 경우
		} else {
			parent = current.getParent();
		}
		// 새로운 오른쪽 형제노드 생성
		Node rightSibling = new Node();
		// 부모노드에서 B삽입후 자식들의 위치 정리
		// B가 삽입된 위치
		itemIndex = parent.insertItem(itemB);
		// 삽입 후 총 아이템 개수
		int n = parent.getItemNum();

		for (int i = n - 1; i < itemIndex; i--) {

			Node temp = parent.disconnectChild(i);
			parent.connectChild(i + 1, temp);

		}
		// 새로운 오른쪽 형제노드를 부모에 연결
		parent.connectChild(itemIndex + 1, rightSibling);

		// C 이동, c,d 자식노드 이동
		rightSibling.insertItem(itemC);
		rightSibling.connectChild(0, childC);
		rightSibling.connectChild(1, childD);
	}

	public void display() {
		show(root, 0, 0);
		System.out.println();
	}

	private void show(Node current, int level, int childNum) {
		// TODO Auto-generated method stub
		System.out.print("Level : " + level + " Child(" + childNum + ") = ");
		current.showNode();
		System.out.println();

		int itemNum = current.getItemNum();
		for (int i = 0; i < itemNum + 1; i++) {

			Node next = current.getChild(i);

			if (next != null) {
				show(next, level + 1, i);
			} else {
				return;
			}

		}
	}

}
