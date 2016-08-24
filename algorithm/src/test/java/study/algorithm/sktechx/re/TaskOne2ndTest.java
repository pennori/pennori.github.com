package study.algorithm.sktechx.re;

import java.util.regex.Pattern;

import org.junit.Assert;
import org.junit.Test;

public class TaskOne2ndTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals("23:18", actual.solution(1, 8, 3, 2));
	}

	class Solution {

		public final String INVALID_INPUT = "NOT POSSIBLE";
		final String TIME24HOURS_PATTERN = "([01]?[0-9]|2[0-3])[0-5][0-9]";

		public String solution(int A, int B, int C, int D) {
			// write your code in Java SE 8

			StringBuilder sb = new StringBuilder();
			sb.append(A);
			sb.append(B);
			sb.append(C);
			sb.append(D);

			StringBuilder output = new StringBuilder();
			permutation("", sb.toString(), output);

			String[] out = new String[24];

			out = output.toString().split(";");

			int max = 0;
			String outputFormat = INVALID_INPUT;
			for (String s : out) {
				if (Pattern.matches(TIME24HOURS_PATTERN, s)) {
					if (max < getsecond(s)) {
						outputFormat = s;
					}
				}
			}

			if (outputFormat.equals(INVALID_INPUT)) {
				return outputFormat;
			} else {
				return outputFormat.substring(0, 2) + ":" + outputFormat.substring(2, 4);
			}
		}

		private void permutation(String prefix, String str, StringBuilder output) {
			int n = str.length();
			if (n == 0) {
				output.append(prefix + ";");
			} else {
				for (int i = 0; i < n; i++)
					permutation(prefix + str.charAt(i), str.substring(0, i) + str.substring(i + 1, n), output);
			}
		}

		private int getsecond(String s) {
			int seconds = 0;
			for (int indx = 0; indx < 4; indx++) {
				int second = Integer.parseInt(s.charAt(indx) + s.charAt(indx + 1) + "");
				if (indx == 0) {
					seconds = seconds + second * 3600;
					indx++;
				} else {
					seconds = seconds + second * 60;
					indx++;
				}
			}
			return seconds;
		}
	}

}
