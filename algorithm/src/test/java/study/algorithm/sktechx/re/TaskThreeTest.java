package study.algorithm.sktechx.re;

import org.junit.Test;

import junit.framework.Assert;

public class TaskThreeTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(13, actual.solution("11:30", "13:40"));
	}

	class Solution {

		public int solution(String start, String end) {
			int cost = 2;

			int startH = Integer.parseInt(start.substring(0, 2));
			int startM = Integer.parseInt(start.substring(3));

			int endH = Integer.parseInt(end.substring(0, 2));
			int endM = Integer.parseInt(end.substring(3));

			int elapsedTimes = endH - startH;
			if (elapsedTimes > 0) {
				cost += 3 + (4 * (elapsedTimes - 1));
			}

			if (endM - startM > 0) {
				cost += 4;
			}

			System.out.println(cost);

			return cost;

		}

	}

}
