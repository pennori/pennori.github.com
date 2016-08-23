package study.algorithm.coupang;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;

public class MinimalUsingCountTest {

	@Test
	public void testOne() {
		Solution actual = new Solution();
		Assert.assertEquals("a1", actual.solution("this is a this"));
	}
	
	@Test
	public void testTwo() throws Exception {
		Solution actual = new Solution();
		Assert.assertEquals("u1", actual.solution("miniminimum"));
	}

	class Solution {

		public String solution(String S) {
			String input = new String(S);
			Map<Character, Integer> map = new HashMap<>();

			for (int i = 0; i < input.length(); i++) {

				char c = input.charAt(i);
				if (c == ' ') {
					continue;
				}
				
				if (map.containsKey(c)) {
					map.put(c, map.get(c) + 1);
					continue;
				}
				map.put(c, 1);

			}

			System.out.println(map.entrySet());

			String word = "";
			int count = 0;

			Iterator<Character> it = map.keySet().iterator();

			while (it.hasNext()) {
				char c = (Character) it.next();

				if (count == 0) {
					word = "" + c;
					count = map.get(c);
					continue;
				}
				
				if (count > map.get(c)) {
					word = "" + c;
					count = map.get(c);
				}

			}
			
			String result = word + "" + count;

			return result;
		}

	}

}
