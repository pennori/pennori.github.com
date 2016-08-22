package study.algorithm.practice;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;

public class FactorialTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(0, actual.solution(0));
		Assert.assertEquals(1, actual.solution(1));
		Assert.assertEquals(2, actual.solution(2));
		Assert.assertEquals(6, actual.solution(3));
	}
	
	@Test
	public void testAnotherMethod() throws Exception {
		Solution actual = new Solution();
		Assert.assertEquals(0, actual.anotherSolution(0));
		Assert.assertEquals(1, actual.anotherSolution(1));
		Assert.assertEquals(2, actual.anotherSolution(2));
		Assert.assertEquals(6, actual.anotherSolution(3));
	}

	class Solution {

		public int solution(int n) {
			return fact(n);
		}

		public int fact(int n) {
			if (n <= 1) {

				return n;

			} else {

				return fact(n - 1) * n;

			}
		}
		
		public int anotherSolution(int n){
			if (n <= 1) {
				return n;
			}
			
			int fact = 1;
			
			for (int i = 2; i <= n; i++) {
				
				fact *= i;
				
			}
			
			return fact;
		}

	}

}