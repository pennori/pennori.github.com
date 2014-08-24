package study.algorithm.sort.insertSort;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		int[] unsort = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 };
		int temp = 0;
		int round = 0;

		for (int i = 1; i < unsort.length; i++) {
			temp = unsort[i];

			for (int j = i - 1; j >= 0; j--) {

				if (unsort[j] > temp) {
					unsort[j + 1] = unsort[j];
					unsort[j] = temp;
				} else {
					break;
				}

				round++;
			}

		}

		System.out.println(round + "회 비교");

		for (int i = 0; i < unsort.length; i++) {
			System.out.print(unsort[i] + " ");
		}

	}

}
