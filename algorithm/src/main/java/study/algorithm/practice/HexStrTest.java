package study.algorithm.practice;

import org.junit.Assert;
import org.junit.Test;

public class HexStrTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals("19b", actual.solution("AA", "F1"));
	}
	
	class Solution {
		public String solution(String a, String b){
			int left = Integer.parseInt(a, 16);
			int right = Integer.parseInt(b, 16);
			int sum = left + right;
			System.out.println(left);
			System.out.println(right);
			System.out.println(sum);
			String hex = Integer.toHexString(sum);
			System.out.println(hex);
			System.out.println(Integer.parseInt(hex, 16));
			
			return hex;
			
		}
	}
}
