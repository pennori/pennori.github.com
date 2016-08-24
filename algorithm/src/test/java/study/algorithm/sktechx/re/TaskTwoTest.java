package study.algorithm.sktechx.re;

import org.junit.Test;

import junit.framework.Assert;

public class TaskTwoTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(true, actual.solution(new int[] { 1, 3, 5, 3, 7 }));
		Assert.assertEquals(false, actual.solution(new int[] { 1, 3, 5, 3, 4 }));
	}

	class Solution {

		public boolean solution(int[] A) {
			boolean result = true;
			int count = 0;

			int length = A.length;

			for (int i = 0; i < length - 1; i++) {

				for (int j = i + 1; j < length; j++) {

					if (A[i] > A[j]) {

						int temp = A[i];
						A[i] = A[j];
						A[j] = temp;
						count++;
						
					}

				}

			}
			

			if (count > 1) {
				result = false;
			}

			return result;

		}

	}

}
