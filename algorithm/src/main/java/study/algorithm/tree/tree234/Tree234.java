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

}
