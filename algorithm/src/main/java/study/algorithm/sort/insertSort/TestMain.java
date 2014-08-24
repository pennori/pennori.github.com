package study.algorithm.sort.insertSort;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		int[] array = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 };
		int temp = 0;
		int round = 0;

		for (int i = 1; i < array.length; i++) {
			temp = array[i];

			for (int j = i - 1; j >= 0; j--) {

				if (array[j] > temp) {
					array[j + 1] = array[j];
					array[j] = temp;
				} else {
					break;
				}

				round++;
			}

		}

		System.out.println(round + "회 비교");

		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " ");
		}

	}

}
