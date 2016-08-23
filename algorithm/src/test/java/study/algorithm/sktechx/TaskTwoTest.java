package study.algorithm.sktechx;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TaskTwoTest {

	private Solution actual;

	@Before
	public void setUp() {
		actual = new Solution();
	}

	@Test
	public void testOne() {
		Assert.assertEquals("004-448-555-583-61", actual.solution("00-44   48 5555 8361"));
	}

	@Test
	public void testTwo() {
		Assert.assertEquals("022-198-53-24", actual.solution("0 - 22  1985--324"));
	}

	@Test
	public void testThree() {
		Assert.assertEquals("555-372-654", actual.solution("555372654"));
	}

	class Solution {

		public String solution(String S) {
			String numberOnly = S.replaceAll("/", "").replaceAll("-", "").replaceAll(" ", "");
			StringBuffer remainBuffer = new StringBuffer(numberOnly);
			StringBuffer resultBuffer = new StringBuffer();

			int length = numberOnly.length();

			int share = length / 3;
			int mod = length % 3;

			if (mod == 1) {
				share--;
				mod += 3;
			}

			while (share > 0) {

				resultBuffer.append(remainBuffer.substring(0, 3));
				resultBuffer.append("-");
				remainBuffer.delete(0, 3);
				share--;

			}

			while (mod > 0) {

				resultBuffer.append(remainBuffer.substring(0, 2));
				resultBuffer.append("-");
				remainBuffer.delete(0, 2);
				mod -= 2;

			}

			resultBuffer.deleteCharAt(resultBuffer.length() - 1);

			return resultBuffer.toString();
		}

	}

}
