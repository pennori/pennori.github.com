package study.algorithm.recursion;

public class TestMain {
	
	static int R;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();

		Object[] arr = testMain.getObjectArray();

		System.out.println("for iterate over array * 2");
		testMain.print(arr);
		System.out.println("\n");
		System.out.println("Recursion Call");
		testMain.executetRecursionFunction(arr);
	}

	private void print(Object[] arr) {
		for (int i = 0; i < arr.length; i++) {
			Object outer = arr[i];

			if (outer instanceof Integer) {
				System.out.print(outer);
				if (i < arr.length - 1) {
					System.out.print(", ");
				}
				continue;
			}

			Object[] inner = (Object[]) outer;

			for (int j = 0; j < inner.length; j++) {
				System.out.print(inner[j] + ", ");
			}

		}
	}
	
	private void executetRecursionFunction(Object[] arr) {
		if (R >= arr.length - 1) {
			return;
		}
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] instanceof Integer) {
				System.out.print(arr[i]);
				if (R == arr.length) {
					continue;
				}
				System.out.print(", ");
				continue;
			}
			this.executetRecursionFunction((Object[]) arr[i]);
		}
		R++;
	}

	Object[] getObjectArray() {
		Object[] arr = { 1, 2, new Object[] { 1, 3, 5 }, 45, 7, 8, new Object[] { 9, 10, 13 }, 5, 2 };
		return arr;
	}

}
