package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class FifthTestMain {

	private String strP = "XYZ";
	private String strQ = "XY";
	private String strR = "6PP";

	private List<String> strList = new ArrayList<String>();
	private Set<String> resultSet = new HashSet<String>();
	private Map<String, String> strMap;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FifthTestMain main = new FifthTestMain();
		main.execute();
	}

	private void execute() {
		// TODO Auto-generated method stub
		initStrList();
		calculate();
		System.out.println("수행횟수 : " + resultSet.size());
		System.out.println("상세" + resultSet);
	}

	private void calculate() {

		int strListSize = strList.size();
		int startNum = (int) Math.pow(10, strListSize - 1);
		for (int i = startNum; i < startNum * 10; i++) {
			if (!haveSameNum(i)) {

				strMap = new HashMap<String, String>();
				for (int j = 0; j < strListSize; j++) {
					String value = "" + i;
					String key = strList.get(j);
					strMap.put(key, value.substring(j, j + 1));
				}

				print(strListSize);

			}
		}

	}

	private void print(int strListSize) {
		String p = strP;
		String q = strQ;
		String r = strR;

		for (int j = 0; j < strListSize; j++) {
			String resultKey = strList.get(j);
			String resultValue = strMap.get(resultKey);
			p = p.replaceAll(resultKey, resultValue);
			q = q.replaceAll(resultKey, resultValue);
			r = r.replaceAll(resultKey, resultValue);
		}

		if (isNum(p) && isNum(q) && isNum(r)) {
			int intP = Integer.parseInt(p);
			int intQ = Integer.parseInt(q);
			int intR = Integer.parseInt(r);
			int sum = intP + intQ;

			if (sum == intR) {
				resultSet.add(p + "+" + q + "=" + r);
			}

		}
	}

	private boolean isNum(String input) {
		int length = input.length();
		for (int i = 0; i < length; i++) {

			char c = input.charAt(i);
			if (!"0123456789".contains("" + c)) {
				return false;
			}

		}

		return true;
	}

	private boolean haveSameNum(int num) {
		if (0 > num) {
			return false;
		}

		Set<String> set = new HashSet<String>();
		String strNum = "" + num;
		for (int i = 0; i < strNum.length(); i++) {
			if (!set.add(strNum.substring(i, i + 1))) {
				return true;
			}
		}

		return false;
	}

	private void initStrList() {
		String input = strP + strQ + strR;
		for (int i = 0; i < input.length(); i++) {
		
			char c = input.charAt(i);
			if (strList.contains("" + c) || "0123456789".contains("" + c)) {
				continue;
			}
			strList.add("" + c);
		
		}
	}

}
