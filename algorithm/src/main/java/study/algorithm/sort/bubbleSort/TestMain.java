package study.algorithm.sort.bubbleSort;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		int[] array = { 3, 13, 10, 2, 12, 4, 1 };
		int temp;
		int cnt = 0;
		int loop = array.length - 1;
		
		for (int i = 0; i < loop; i++) {

			for (int j = 0; j < loop - i; j++) {

//				System.out.println(j + " / " + (j + 1));
//				System.out.println(unsort[j] + " VS " + unsort[j + 1]);
				
				if (array[j] > array[j + 1]) {
//					System.out.println(unsort[j] + " <==> " + unsort[j + 1]);
					temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				}

				cnt++;
			}

		}

		System.out.println(cnt + " 회 비교");

		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " ");
		}
	}

}
