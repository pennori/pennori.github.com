package study.algorithm.sort.radixSort;

import java.util.Stack;

public class TestMain {

	public static void main(String[] args) {
		int[] array = new int[10];

		array[0] = 753;
		array[1] = 427;
		array[2] = 450;
		array[3] = 422;
		array[4] = 220;
		array[5] = 125;
		array[6] = 332;
		array[7] = 339;
		array[8] = 199;
		array[9] = 660;

		System.out.println("기수 정렬 전");
		displayArray(array);

		System.out.println("기수 정렬 시작");
		radixSort(array);
		System.out.println("기수 정렬 끝");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static int[] radixSort(int[] arr) {
		int num_digits = 0;

		for (int i = 0; i < arr.length; i++) {

			if (Integer.toString(arr[i]).length() > num_digits) {
				num_digits = Integer.toString(arr[i]).length();
			}

		}

		Integer[] array = new Integer[arr.length];

		for (int i = 0; i < array.length; i++) {
			array[i] = new Integer(arr[i]);
		}

		for (int i = 0; i < num_digits; i++) {
			Stack[] s = new Stack[10];

			for (int j = 0; j < s.length; j++) {
				s[j] = new Stack();
			}

			for (int j = array.length - 1; j >= 0; j--) {
				int idx = (int) ((array[j].intValue() % (Math.pow(10, i + 1))) / (Math
						.pow(10, i)));

				s[idx].push(array[j]);
				System.out.println("idx : " + idx);
				System.out.println("peek : " + s[idx].peek());
			}

			int k = 0;

			for (int j = 0; j < s.length; j++) {

				while (!s[j].empty()) {
					array[k++] = (Integer) s[j].pop();
				}

			}

			displayArray_Integer(array);

		}

		for (int i = 0; i < array.length; i++) {
			arr[i] = array[i].intValue();
		}

		return arr;

	}

	private static void displayArray_Integer(Integer[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i] + " ");
		}

		System.out.println();
	}

	private static void displayArray(int[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i] + " ");
		}

		System.out.println();
	}

}
