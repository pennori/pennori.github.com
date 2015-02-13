package study.algorithm.tripleIntCase;

import java.util.HashMap;
import java.util.Map;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();

		long start = System.currentTimeMillis();
		System.out.println("식 형태로 입력 받아서 경우의 수 찾기");
		testMain.execute("XYZ + XY = 6PP");
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));
	}

	private void execute(String data) {
		String input = data.replaceAll("\\s", "").toUpperCase();

		Map<Character, String> ruleMap = getRuleMap(input);

		String[] strArr = new String[input.length()];

		for (int i = 0; i < input.length(); i++) {

			char c = input.charAt(i);

			if ('+' == c) {
				continue;
			}

			if ('=' == c) {
				break;
			}

			if (ruleMap.containsKey(c)) {

				int value = (int) (Math.random() * 10);

				while (true) {

					boolean isFirstDigit = i == 0 || i == input.indexOf("+") + 1;

					if (isFirstDigit && 0 == value) {
						System.out.println(value);
						value = (int) (Math.random() * 10);
					} else {
						break;
					}

				}

				if (-1 != ruleMap.get(c).indexOf("_")) {

					String[] rule = ruleMap.get(c).split("_");

					for (int j = 0; j < rule.length; j++) {
						strArr[Integer.parseInt(rule[j])] = String
								.valueOf(value);
					}

				} else {

					strArr[i] = String.valueOf(value);

				}

			}

		}

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < strArr.length; i++) {
			System.out.println(input.charAt(i) + " : " + strArr[i]);

			if (null != strArr[i]) {
				sb.append(strArr[i]);
			} else {
				sb.append(input.charAt(i));
			}

		}

		String out = sb.toString();

		String left = out.substring(0, out.indexOf("+"));
		String right = out.substring(out.indexOf("+") + 1, out.indexOf("="));
		String misc = out.substring(out.indexOf("=") + 1);

		int intResult = Integer.parseInt(left) + Integer.parseInt(right);
		System.out.println(left + " + " + right + " = " + intResult);
		System.out.println("결과 비교 : " + misc);

	}

	private Map<Character, String> getRuleMap(String in) {
		Map<Character, String> ruleMap = new HashMap<Character, String>();

		for (int i = 0; i < in.length(); i++) {

			char c = in.charAt(i);

			if (ruleMap.containsKey(c)) {
				ruleMap.put(c, ruleMap.get(c) + "_" + i);
			} else {
				ruleMap.put(c, String.valueOf(i));
			}

		}
		return ruleMap;
	}

}
