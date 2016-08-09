package codility.sktechx;

import org.junit.Assert;
import org.junit.Test;

public class TaskOneTest {

	@Test
	public void test() {
		Solution actual = new Solution();

		Assert.assertEquals(3, actual.solution(3, 7));
		Assert.assertEquals(6, actual.solution(9, 7));
		Assert.assertEquals(3, actual.solution(9, 9));
		Assert.assertEquals(4, actual.solution(9, 10));
	}

	class Solution {

		public int solution(int A, int B) {
			int paramA = A;
			int paramB = B;

			int multi = paramA * paramB;
			int bitCount = 0;

			while (multi > 0) {

				int mod = multi % 2;

				if (mod == 1) {
					bitCount++;
				}

				multi /= 2;

			}

			return bitCount;

		}
	}

}
