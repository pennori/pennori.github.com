package study.algorithm.sort.selectionSort;

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
		int loop = array.length;

		for (int i = 0; i < loop - 1; i++) {

			for (int j = i + 1; j < loop; j++) {

//				System.out.println(i + " / " + j);
//				System.out.println(unsort[i] + " VS " + unsort[j]);
				
				if (array[i] > array[j]) {
//					System.out.println(unsort[i] + " <==> " + unsort[j]);
					temp = array[i];
					array[i] = array[j];
					array[j] = temp;
				}

				round++;
			}

		}

		System.out.println(round + " 회 비교");

		for (int i = 0; i < loop; i++) {
			System.out.print(array[i] + " ");
		}
	}

}
