package study.algorithm.tripleIntCase;

import java.util.HashMap;
import java.util.Map;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();

		long start = System.currentTimeMillis();
		System.out.println("AA + BC = 100 인 경우의 수 찾기");
		testMain.practice01();
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));

		System.out.println();

		start = System.currentTimeMillis();
		System.out.println("XYZ + XY + 6PP 인 경우의 수 찾기");
		testMain.practice02();
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));

		System.out.println();

		start = System.currentTimeMillis();
		System.out.println("식 형태로 입력 받아서 경우의 수 찾기");
		testMain.execute("XYZ + XY = 6PP");
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));
	}

	private void execute(String data) {
		String in = data.replaceAll("\\s", "").toUpperCase();

		String left = in.substring(0, in.indexOf("+"));
		String right = in.substring(in.indexOf("+") + 1, in.indexOf("="));
		String equal = in.substring(in.indexOf("=") + 1);

		System.out.println(left);
		System.out.println(right);
		System.out.println(equal);

		System.out.println(in);

		Map<Character, String> ruleMap = new HashMap<Character, String>();

		for (int i = 0; i < in.length(); i++) {

			char c = in.charAt(i);

			if (ruleMap.containsKey(c)) {
				ruleMap.put(c, ruleMap.get(c) + "_" + i);
			} else {
				ruleMap.put(c, String.valueOf(i));
			}

		}

		System.out.println(ruleMap.entrySet());

		String[] strArr = new String[in.length()];

		for (int i = 0; i < in.length(); i++) {

			char c = in.charAt(i);

			if ('+' == c) {
				continue;
			}

			if ('=' == c) {
				break;
			}

			if (ruleMap.containsKey(c)) {

				int value = (int) (Math.random() * 10);

				if (-1 != ruleMap.get(c).indexOf("_")) {

					String[] arr = ruleMap.get(c).split("_");

					for (int j = 0; j < arr.length; j++) {
						strArr[Integer.parseInt(arr[j])] = String
								.valueOf(value);
					}

				} else {

					strArr[i] = String.valueOf(value);

				}

			}

		}

		for (int i = 0; i < strArr.length; i++) {
			System.out.println(in.charAt(i) + " : " + strArr[i]);
		}

	}

	private void practice02() {
		int count = 0;
		int loop = 0;

		for (int i = 0; i < 10; i++) {

			if (i == 0) {
				continue;
			}

			for (int j = 0; j < 10; j++) {

				if (i == j) {
					continue;
				}

				loop++;

				for (int k = 0; k < 10; k++) {

					if (k == i || k == j) {
						continue;
					}

					String x = String.valueOf(i);
					String y = String.valueOf(j);
					String z = String.valueOf(k);

					int xyz = Integer.parseInt(x + y + z);
					int xy = Integer.parseInt(x + y);

					String result = String.valueOf(xyz + xy);

					if (3 != result.length()) {
						continue;
					}

					if (0 != result.indexOf("6")) {
						continue;
					}

					if (!result.substring(1, 2).equals(result.substring(2))) {
						continue;
					}
					
					if (result.substring(2).equals(x)
							|| result.substring(2).equals(y)
							|| result.substring(2).equals(z)) {
						continue;
					}

					System.out.println(xyz + " + " + xy + " = " + result);
					count++;

				}

			}

		}

		System.out.println("경우의 수 : " + count);
		System.out.println("수행횟수 : " + loop);

	}

	private void practice01() {
		int count = 0;
		int loop = 0;

		for (int i = 0; i < 10; i++) {

			if (i == 0) {
				continue;
			}

			for (int j = 0; j < 10; j++) {

				if (j == 0) {
					continue;
				}

				for (int k = 0; k < 10; k++) {

					if (i == j || i == k) {
						continue;
					}

					loop++;

					String p = String.valueOf(i);
					String q = String.valueOf(j);
					String r = String.valueOf(k);

					int pp = Integer.parseInt(p + p);
					int qr = Integer.parseInt(q + r);

					String result = String.valueOf(pp + qr);

					if (!"100".equals(result)) {
						continue;
					}

					System.out.println(pp + " + " + qr + " = " + result);

					count++;

				}

			}

		}

		System.out.println("경우의 수 : " + count);
		System.out.println("수행횟수 : " + loop);
	}

}
