package study.algorithm.hash;

/**
 * 해시 분리 연결법 셀의 헤더가 되는 해시 테이블의 크기는 11개로 설정되어 있으며, 해시 테이블의 각 셀은 Link 클래스로 이루어져
 * 있다. 모듈러 연산을 사용한 간단한 해시 메소드를 사용하며, 각 자료를 삽입할 때에는 정렬된 위치를 찾아내어 링크를 연결시킨다.
 * 
 * @author pennori
 * 
 */
public class SeparateChaining {
	private int hTableSize;
	private Link[] hTable;

	public SeparateChaining(int value) {
		hTableSize = value;
		hTable = new Link[hTableSize];
		// 해시 테이블의 링크들은 모두 헤더로 null
	}

	public int hFunc(int key) {
		return key % hTableSize;
	}

	public int getKey(int data) {
		return data;
	}

	public int insert(int data) {
		int key, hVal;

		// 삽입할 링크
		Link link;
		// 현재 작업하는 링크와 그 앞의 링크
		Link pre, cur;
		key = getKey(data);
		hVal = hFunc(key);

		// 삽입할 링크에 메모리 할당, 동시에 주소도 할당
		link = new Link();
		link.setValue(data);

		// 해시 값이 가리키는 자리의 헤더가 비어있을 경우
		if (hTable[hVal] == null) {

			// 헤더에 삽입한다
			hTable[hVal] = link;
			return 0;

		}

		pre = null;
		// 헤더부터 시작
		cur = hTable[hVal];

		while (true) {

			// 리스트의 끝이므로 삽입
			if (cur == null) {

				pre.next = link;
				return 0;
				// cur 링크의 우선순위가 높으므로 뒤에 삽입하기 위해서 cur 가 다음 링크를 가리키게 함
			} else if (cur.getValue() < key) {

				// 작업하던 현재 링크를 pre 로 지정
				pre = cur;
				// 작업하던 현재 링크의 다음 링크를 cur 로 지정
				cur = cur.next;

			} else {

				// cur 링크의 우선순위가 더 낮으므로 이 링크의 앞에 삽입
				if (cur == hTable[hVal]) {
					// 삽입할 link 의 next 로 헤더인 cur 를 지정
					link.next = cur;
					// 헤더에 link 삽입
					hTable[hVal] = link;
					return 0;
					// cur 링크가 리스트의 헤더가 아닐 경우
				} else {

					// 삽입할 link 의 next 로 헤더인 cur 를 지정
					link.next = cur;
					// pre 가 null 이 아니므로 pre 의 next 로 link 를 지정
					pre.next = link;
					return 0;
				}

			}

		}

	}

	public int search(int data) {
		// 사용자가 탐색할 때를 위해 찾은 자료를 보여줌
		int key, hVal = 0;
		Link cur;

		key = getKey(data);
		cur = hTable[hVal];

		while (true) {

			// 리스트의 끝
			if (cur == null) {
				System.out.println(key + " : 찾지못하고 리스트의 끝에 닿음\n");
				return -1;
			} else if (cur.getValue() == key) {
				// 찾은 자료의 앞 자료를 반환한다.
				System.out.println(cur.getValue() + " 찾음 \n");
				return 0;
				// 찾는 자료보다 큰 자료 등장
			} else if (cur.getValue() > key) {
				System.out.println(key + " : 찾지못하고 더 큰 자료를 만남\n");
				return -1;
			} else {
				// 현재 가리키고 있는 자료가 찾는 자료보다 작을 경우
				cur = cur.next;
			}

		}

	}

	public Link searchForDel(int data) {
		// delete 메소드를 위해 결과를 보여주지 않음
		int key, hVal;
		Link pre, cur;
		key = getKey(data);
		hVal = hFunc(key);
		pre = hTable[hVal];
		cur = pre.next;

		while (true) {

			if (cur.getValue() == key) {

				// 찾는 자료의 앞 자료를 반환한다.
				return pre;

				// 리스트의 끝
			} else if (cur == null) {
				return null;
				// 찾는 자료보다 큰 자료 등장
			} else if (cur.getValue() > key) {
				return null;
				// 현재 가리키고 있는 자료가 찾는 자료보다 작을 경우
			} else {
				pre = cur;
				cur = cur.next;
			}

		}

	}

	public int delete(int data) {

		int key, hVal;
		Link pre, cur;
		key = getKey(data);
		hVal = hFunc(key);

		if ((pre = searchForDel(data)) == null) {
			System.out.println(data + " 자료가 존재하지 않습니다\n");
			return -1;
		}

		cur = pre.next;
		pre.next = cur.next;

		return 0;

	}

	public void showHashTable() {
		Link cur;

		for (int i = 0; i < hTableSize; i++) {

			int length = String.valueOf(i).length();

			if (1 < length) {
				System.out.print(" | " + i + " |\t");
			} else {
				System.out.print(" |  " + i + " |\t");
			}

			cur = hTable[i];

			if ((cur == null)) {
				System.out.print("n ");
			} else {

				while (cur != null) {
					System.out.print(cur.getValue() + " ");
					cur = cur.next;
				}

			}

			System.out.println("");
		}

		System.out.println("");

	}

	public static void main(String[] args) {
		System.out.println("This is Separate Chaining");

		SeparateChaining sc = new SeparateChaining(11);

		sc.insert(12);
		sc.showHashTable();

		sc.insert(1);
		sc.showHashTable();

		sc.insert(13);
		sc.showHashTable();

		sc.insert(4);
		sc.showHashTable();

		sc.insert(28);
		sc.showHashTable();

		sc.insert(37);
		sc.showHashTable();

		sc.insert(7);
		sc.showHashTable();

		sc.insert(29);
		sc.showHashTable();

		// 분리 연결법의 정렬 삽입
		sc.insert(18);
		sc.showHashTable();

		sc.delete(29);
		sc.showHashTable();

		// 분리 연결법의 탐색 실패 예
		sc.search(29);
		sc.insert(40);
		sc.showHashTable();
		// 분리 연결법의 탐색 실패 예
		sc.search(29);
	}

}
