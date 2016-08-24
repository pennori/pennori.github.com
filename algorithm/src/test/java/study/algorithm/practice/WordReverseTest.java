package study.algorithm.practice;

import java.util.Stack;

import org.junit.Test;

import junit.framework.Assert;

public class WordReverseTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals("implemented yet Not", actual.solution("Not yet implemented"));
	}

	class Solution {

		public String solution(String S) {
			String result = "";
			String[] args = S.split(" ");

			Stack<String> stack = new Stack<>();
			for (String item : args) {
				stack.push(item);
			}

			int spaceCount = stack.size() - 1;
			while (!stack.isEmpty()) {

				result += stack.pop();

				if (spaceCount > 0) {

					result += " ";
					spaceCount--;

				}

			}

			System.out.println(result);

			return result;
		}

	}

}
