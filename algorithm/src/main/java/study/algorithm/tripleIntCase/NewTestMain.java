package study.algorithm.tripleIntCase;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;


public class NewTestMain {

	static int loop;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NewTestMain testMain = new NewTestMain();

		long start = System.currentTimeMillis();
		System.out.println("식 형태로 입력 받아서 경우의 수 찾기");
		testMain.execute("XYZ + XY = 6PP");
		System.out.println("소요 (ms) : " + (System.currentTimeMillis() - start));
	}

	private boolean execute(String data) {
		String input = data.replaceAll("\\s", "").toUpperCase();

		System.out.println(getResult(input));

		return false;

	}

	private String getResult(String input) {
		Map<Character, Integer> map = new LinkedHashMap<Character, Integer>();
		Set<Integer> intSet = new TreeSet<Integer>();
		// 문자형 문자열만 선별
		Set<Character> charSet = getUniqueLeftRightKeySet(input);
		
		// 중복 배제 난수 생성
		Iterator<Character> charSetIt = charSet.iterator();
		
		while (charSetIt.hasNext()) {
		
			char key1 = charSetIt.next();
		
			// while 처리
			while (true) {
				int value = (int) (Math.random() * 10);
		
				boolean isFirstDigit = 0 == input.indexOf(key1)
						|| input.indexOf(key1) == (input.indexOf("+") + 1);
				// 각 변의 첫 숫자는 0 이 될 수 없음
				if (isFirstDigit && 0 == value) {
		
					value = (int) (Math.random() * 10);
		
					// 중복 숫자 제거
				} else if (!intSet.add(value)) {
		
					value = (int) (Math.random() * 10);
		
				} else {
		
					map.put(key1, value);
					break;
		
				}
		
			}
		
		}

		String[] resultArr = new String[input.length()];
		
		// 문자열 중복 현황
		Map<Character, String> dupCheckMap = getDupCheckMap(input);
		
		Iterator<Character> mapIt = map.keySet().iterator();
		
		// 문자 <==> 숫자 치환
		while (mapIt.hasNext()) {
		
			char key = mapIt.next();
		
			if (-1 != dupCheckMap.get(key).indexOf("_")) {
		
				String[] position = dupCheckMap.get(key).split("_");
		
				for (int i = 0; i < position.length; i++) {
					resultArr[Integer.parseInt(position[i])] = String
							.valueOf(map.get(key));
				}
		
			} else {
				resultArr[Integer.parseInt(dupCheckMap.get(key))] = String
						.valueOf(map.get(key));
			}
		
		}
		
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < resultArr.length; i++) {
			// System.out.println(input.charAt(i) + " : " + resultArr[i]);
		
			if (null != resultArr[i]) {
				sb.append(resultArr[i]);
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
		System.out.println("결과 형태 : " + misc);
		
		return out;
	}

	private Set<Character> getUniqueLeftRightKeySet(String input) {
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
