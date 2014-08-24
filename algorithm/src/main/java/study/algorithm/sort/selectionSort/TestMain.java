package study.algorithm.sort.selectionSort;

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
		int loop = unsort.length;

		for (int i = 0; i < loop - 1; i++) {

			for (int j = i + 1; j < loop; j++) {

				System.out.println(i + " / " + j);
				System.out.println(unsort[i] + " VS " + unsort[j]);
				
				if (unsort[i] > unsort[j]) {
					System.out.println(unsort[i] + " <==> " + unsort[j]);
					temp = unsort[i];
					unsort[i] = unsort[j];
					unsort[j] = temp;
				}

				round++;
			}

		}

		System.out.println(round + " 회 비교");

		for (int i = 0; i < loop; i++) {
			System.out.print(unsort[i] + " ");
		}
	}

}
