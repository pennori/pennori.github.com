package study.algorithm.coin;

import org.junit.Test;

import junit.framework.Assert;

public class MergeCoinTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(158, actual.solution(1000));
	}

	class Solution {

		int cents[] = { 500, 100, 50, 10 };

		public int count(int amount) {
			return count(amount, 0);
		}

		private int count(int amount, int idx) {
			if (amount == 0)
				return 1;
			else if (amount < 0 || idx >= cents.length)
				return 0;
			else
				return count(amount - cents[idx], idx) + count(amount, idx + 1);
		}

		public int solution(int n) {
			return count(n);
		}

	}

}
