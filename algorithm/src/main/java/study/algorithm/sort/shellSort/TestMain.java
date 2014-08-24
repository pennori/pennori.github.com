package study.algorithm.sort.shellSort;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		int[] array = { 22, 1, 11, 88, 55, 99, 77, 66, 44, 33 };

		display(array);

		int h = 1;

		while (h <= array.length / 3) {
			h = h * 3 + 1;
		}

		while (h > 0) {
			for (int i = h; i < array.length; i++) {
				int temp = array[i];
				int j = i;

				while (j > h - 1 && array[j - h] >= temp) {
					array[j] = array[j - h];
					j -= h;
				}

				array[j] = temp;
				display(array);

			}

			h = (h - 1) / 3;

		}
		
		display(array);

	}

	private void display(int[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " ");
		}
		System.out.println();
	}
}
