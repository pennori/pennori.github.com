package study.algorithm.sort.bubbleSort;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.bubbleSort();
	}

	public void bubbleSort() {
		int[] unsort = { 3, 13, 10, 2, 12, 4, 1 };
		int temp;
		int cnt = 0;
		int loop = unsort.length - 1;
		
		for (int i = 0; i < loop; i++) {

			for (int j = 0; j < loop - i; j++) {

				if (unsort[j] > unsort[j + 1]) {
					temp = unsort[j];
					unsort[j] = unsort[j + 1];
					unsort[j + 1] = temp;
				}

				cnt++;
			}

		}

		System.out.println(cnt + " 회 비교");

		for (int i = 0; i < unsort.length; i++) {
			System.out.print(unsort[i] + " ");
		}
	}

}
