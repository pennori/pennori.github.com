package study.algorithm.sort.quickSort;

import org.junit.Test;

import junit.framework.Assert;

public class QuickSortTest {

	Solution actual = new Solution();

	@Test
	public void test() {
		Assert.assertEquals(1, 1);
		int[] params = { 1, 11, 88, 55, 99, 77, 66, 44, 22, 33 };
		actual.display(params);
		actual.quickSort(params, 0, params.length - 1);
		actual.display(params);
	}

	class Solution {

		public void quickSort(int[] a, int left, int right) {

			if (right - left <= 0) {
				return;
			}

			int pivot = a[right];

			int i = left - 1;
			int j = right;

			while (true) {

				while (a[++i] < pivot)
					;

				while (j > left && a[--j] > pivot)
					;

				if (i >= j) {
					break;
				} else {
					swap(a, i, j);
				}

			}

			swap(a, i, right);
			quickSort(a, left, i - 1);

			quickSort(a, left + 1, right);

		}

		public void swap(int[] a, int i, int j) {
			int temp = a[i];
			a[i] = a[j];
			a[j] = temp;
		}

		public void display(int[] a) {
			for (int i = 0; i < a.length; i++) {
				System.out.print(a[i] + " ");
			}
			System.out.println();
		}
	}

}
