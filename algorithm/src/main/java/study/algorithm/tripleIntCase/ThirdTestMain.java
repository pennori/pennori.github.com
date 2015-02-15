package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class ThirdTestMain {

	public String p = "XYZ";
	public String q = "XY";
	public String r = "6PP";
	List<Character> strList;
	Map<Character, Integer> strMap;

	public Set<String> resultSet = new TreeSet<String>();

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThirdTestMain main = new ThirdTestMain();
		main.execute();
	}

	public void execute() {
		String pqr = p + q + r;
		strList = getUniqueStrList(pqr);
		System.out.println(strList);

		strMap = getUniqueStrMap(pqr);
		System.out.println(strMap.entrySet());

		calculate(p, q, r);
	}

	private void calculate(String p, String q, String r) {


		for (int i = 0; i < strList.size(); i++) {

			for (int j = 0; j < 10; j++) {

				p = p.replaceAll(String.valueOf(strList.get(i)),
						String.valueOf(i));
				q = q.replaceAll(String.valueOf(strList.get(i)),
						String.valueOf(i));
				r = r.replaceAll(String.valueOf(strList.get(i)),
						String.valueOf(i));

			}

		}

		calculate(p, q, r);
	}

	private Map<Character, Integer> getUniqueStrMap(String input) {
		Map<Character, Integer> strMap = new HashMap<Character, Integer>();
		for (int i = 0; i < input.length(); i++) {

			char key = input.charAt(i);

			if (key > 47 && key < 58) {
				continue;
			}
			
			if (!strMap.containsKey(key)) {
				strMap.put(key, -1);
			}

		}
		return strMap;
	}

	private List<Character> getUniqueStrList(String input) {
		List<Character> strList = new ArrayList<Character>();
		for (int i = 0; i < input.length(); i++) {

			char key = input.charAt(i);

			if (key > 47 && key < 58) {
				continue;
			}

			if (!strList.contains(key)) {
				strList.add(key);
			}

		}
		return strList;
	}

	private boolean isFirstDigit(String p, String q, String r, Character key) {
		return 0 == p.indexOf(key) || 0 == q.indexOf(key)
				|| 0 == r.indexOf(key);
	}

}
