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
		strMap = getUniqueStrMap(pqr);

		calculate(p, q, r);

		System.out.println("경우의 수 : " + resultSet.size());
		System.out.println("경우의 수 상세 : " + resultSet);
	}

	private void calculate(String inP, String inQ, String inR) {
		String outP = inP;
		String outQ = inQ;
		String outR = inR;

		if (isNum(outP) && isNum(outQ) && isNum(outR)) {

			int numR = Integer.parseInt(outR);
			int numP = Integer.parseInt(outP);
			int numQ = Integer.parseInt(outQ);

			if (numR == numP + numQ) {

				resultSet.add(outP + "+" + outQ + "=" + outR);
				System.out.println(outP + "+" + outQ + "=" + outR);
				return;

			}

		}

		int size = strList.size();

		for (int i = 0; i < size; i++) {

			int start = 0;
			char key = strList.get(i);
			
			if (0 == inP.indexOf(key) || 0 == inQ.indexOf(key)
					|| 0 == inR.indexOf(key)) {
				start = 1;
			}

			for (int j = start; j < 10; j++) {

				if (outP.contains("" + j) || outQ.contains("" + j)
						|| outR.contains("" + j)) {
					continue;
				}

				outP = replaceAll(outP, key, "" + j);
				outQ = replaceAll(outQ, key, "" + j);
				outR = replaceAll(outR, key, "" + j);

			}

		}

		calculate(outP, outQ, outQ);
	}

	private String replaceAll(String input, char key, String value) {
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < input.length(); i++) {

			char compareKey = input.charAt(i);

			if (compareKey == key) {
				sb.append(value);
			}

		}

		return sb.toString();
	}

	private boolean isNum(String numStr) {
		boolean isNum = false;

		for (int i = 0; i < numStr.length(); i++) {
			char c = numStr.charAt(i);

			if (c > 47 && c < 58) {
				isNum = true;
			}

		}

		return isNum;
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

}
