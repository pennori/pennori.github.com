package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class SixthTestMain {

	List<String> strList = new ArrayList<String>();
	Map<String, String> strMap;
	Set<String> uniqueSet = new HashSet<String>();
	Set<String> resultSet = new HashSet<String>();

	String strP = "XYZ";
	String strQ = "XY";
	String strR = "6PP";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SixthTestMain testMain = new SixthTestMain();
		testMain.execute();
	}

	private void execute() {
		// TODO Auto-generated method stub
		setUniqueStr(strP + strQ + strR);

		calculate();

		System.out.println(resultSet);
	}

	private void calculate() {
		int maxLoop = (int) Math.pow(10, strList.size());

		for (int i = 0; i < maxLoop; i++) {
			String str = "" + i;
			if (strList.size() > str.length()) {
				continue;
			}

			if (!isDup(i)) {
				strMap = new HashMap<String, String>();
				for (int j = 0; j < strList.size(); j++) {
					String value = "" + i;
					strMap.put(strList.get(j), "" + value.charAt(j));
				}

				print(strMap);

			}

		}
	}

	private void print(Map<String, String> strMap) {
		String op = strP;
		String oq = strQ;
		String or = strR;

		int size = strList.size();
		for (int i = 0; i < size; i++) {

			String key = strList.get(i);
			String value = strMap.get(key);

			op = op.replaceAll(key, value);
			oq = oq.replaceAll(key, value);
			or = or.replaceAll(key, value);
		}

		int intP = Integer.parseInt(op);
		int intQ = Integer.parseInt(oq);
		int intR = Integer.parseInt(or);
		int actual = intP + intQ;

		if (actual == intR) {
			resultSet.add(op + "+" + oq + "=" + or);
		}

	}

	private boolean isDup(int i) {
		if (i < 0) {
			return false;
		}

		String str = "" + i;

		Set<String> set = new HashSet<String>();

		for (int j = 0; j < str.length(); j++) {

			if (!set.add("" + str.charAt(j))) {
				return true;
			}

		}
		return false;
	}

	private void setUniqueStr(String input) {
		for (int i = 0; i < input.length(); i++) {

			String str = "" + input.charAt(i);
			if ("0123456789".contains(str) || strList.contains(str)) {
				continue;
			}

			strList.add(str);

		}
	}

}
