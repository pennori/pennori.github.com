package study.algorithm.tree.tree234;


public class Node {
	private static final int ORDER = 4;

	// 자료 아이템(키)
	private int[] item = new int[ORDER];
	// 현재 자료의 수, 초기값 0
	private int itemNum = 0;
	// 부모노드 표현
	private Node parent;
	// 자식들
	private Node[] children = new Node[ORDER];

	// 노드 내 아이템 탐색
	public int findItem(int key) {
		for (int i = 0; i < ORDER - 1; i++) {

			if (item[i] == key) {
				// 노드 내 키 값 존재
				return 1;
			}

		}
		// 노드 내 키 값 존재하지 않음
		return -1;

	}

	// 노드 내 아이템 삽입
	public int insertItem(int key) {
		// 첫아이템 삽입시
		if (itemNum == 0) {

			item[0] = key;
			itemNum++;
			// 아이템 삽입과 함께 정렬
		} else {

			for (int i = itemNum - 1; i >= 0; i--) {

				if (key < item[i]) {
					item[i + 1] = item[i];
				} else {

					item[i + 1] = key;
					itemNum++;
					return i + 1;

				}

			}

			item[0] = key;
			itemNum++;

		}

		return 0;

	}

	// 노드 내 가장 큰 아이템 삭제
	public int moveItem() {
		int result = item[itemNum - 1];
		item[itemNum - 1] = -1;
		itemNum--;

		return result;

	}

	// 자식으로 연결
	public void connectChild(int childNum, Node child) {
		children[childNum] = child;

		if (child != null) {
			child.parent = this;
		}
	}

	// 자식에서 해제
	public Node disconnectChild(int childNum) {
		Node tempNode = children[childNum];
		children[childNum] = null;

		return tempNode;
	}

	// 잎 노드인가?
	public boolean isLeaf() {
		if (children[0] == null) {
			return true;
		} else {
			return false;
		}
	}

	// 꽉 찬 노드인가?
	public boolean isFull() {
		if (itemNum == ORDER - 1) {
			return true;
		} else {
			return false;
		}
	}

	public int getItemNum() {
		return itemNum;
	}

	public int getItem(int index) {
		return item[index];
	}

	public Node getChild(int childNum) {
		return children[childNum];
	}

	public Node getParent() {
		return parent;
	}

	// 노드 정보 출력
	public void showNode() {
		System.out.println('[');

		for (int i = 0; i < itemNum; i++) {

			if (i != 0) {
				System.out.println(',');
			}

			System.out.println(item[i]);

		}

		System.out.println(']');
	}

}
