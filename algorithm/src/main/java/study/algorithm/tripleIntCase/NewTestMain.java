package study.algorithm.tripleIntCase;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;


public class NewTestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NewTestMain testMain = new NewTestMain();

		long start = System.currentTimeMillis();
		System.out.println("식 형태로 입력 받아서 경우의 수 찾기");
		testMain.execute("XYZ + XY = 6PP");
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));
	}

	private void execute(String data) {
		String input = data.replaceAll("\\s", "").toUpperCase();
		Map<Character, String> dupCheckMap = getDupCheckMap(input);
		Set<Character> charSet = getKeySet(input);
		Set<Integer> intSet = new TreeSet<Integer>();

		Map<Character, Integer> map = new LinkedHashMap<Character, Integer>();

		Iterator<Character> it = charSet.iterator();
		while (it.hasNext()) {

			char key = it.next();

			while (true) {
				int value = (int) (Math.random() * 10);

				boolean isFirstDigit = 0 == input.indexOf(key)
						|| input.indexOf(key) == (input.indexOf("+") + 1);

				if (isFirstDigit && 0 == value) {

					value = (int) (Math.random() * 10);

				} else if (!intSet.add(value)) {

					value = (int) (Math.random() * 10);

				} else {

					map.put(key, value);
					break;

				}

			}

		}

		System.out.println(map.entrySet());

	}

	private Set<Character> getKeySet(String input) {
		Set<Character> set = new TreeSet<Character>();
		
		for (int i = 0; i < input.length(); i++) {

			char c = input.charAt(i);

			if ('+' == c) {
				continue;
			}

			if ('=' == c) {
				break;
			}

			set.add(c);

		}
		return set;
	}
	
	private Map<Character, String> getDupCheckMap(String in) {
		Map<Character, String> dupCheckMap = new HashMap<Character, String>();

		for (int i = 0; i < in.length(); i++) {

			char c = in.charAt(i);

			if (dupCheckMap.containsKey(c)) {
				dupCheckMap.put(c, dupCheckMap.get(c) + "_" + i);
			} else {
				dupCheckMap.put(c, String.valueOf(i));
			}

		}
		return dupCheckMap;
	}

}
