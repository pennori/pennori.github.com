package study.algorithm.practice;

import org.junit.Assert;
import org.junit.Test;

public class FibonacciTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(1, actual.solution(1));
		Assert.assertEquals(1, actual.solution(2));
		Assert.assertEquals(2, actual.solution(3));
		Assert.assertEquals(3, actual.solution(4));
		Assert.assertEquals(5, actual.solution(5));
	}
	
	class Solution {

		public int solution(int n) {
			return fibo(n);
		}

		public int fibo(int n) {
			if (n <= 1) {
				return n;
			} else {
				return fibo(n - 2) + fibo(n - 1);
			}
		}
		
	}

}