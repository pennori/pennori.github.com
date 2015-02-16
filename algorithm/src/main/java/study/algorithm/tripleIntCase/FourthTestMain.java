package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class FourthTestMain {

	List<String> keyList = new ArrayList<String>();
	Map<String, Integer> keyMap = new HashMap<String, Integer>();
	Set<String> resultSet = new TreeSet<String>();

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FourthTestMain main = new FourthTestMain();
		main.execute("XYZ + XY = 6PP");
	}

	public void execute(String inputStr) {
		System.out.println("start");
		String input = inputStr.replaceAll("\\s", "").toUpperCase();

		String p = input.substring(0, input.indexOf("+"));
		String q = input.substring(input.indexOf("+") + 1, input.indexOf("="));
		String r = input.substring(input.indexOf("=") + 1);

		initListAndMap(p + q + r);

		calculate(p, q, r);

		System.out.println("경우의 수 : " + resultSet.size());
		System.out.println("경우의 수 상세 : " + resultSet);
	}

	private void initListAndMap(String input) {
		keyList = new ArrayList<String>();
		keyMap = new HashMap<String, Integer>();

		for (int i = 0; i < input.length(); i++) {

			char key = input.charAt(i);

			if (keyList.contains("" + key) || "0123456789".contains("" + key)) {
				continue;
			}

			keyList.add("" + key);
			keyMap.put("" + key, -1);
		}
	}

	private void calculate(String p, String q, String r) {
		// TODO Auto-generated method stub
		if (isNum(p) && isNum(q) && isNum(r)) {
			String result = p + "+" + q + "=" + r;
			resultSet.add(result);
			return;
		}

		calculate(p, q, r);
	}

	private boolean isNum(String input) {
		boolean isNum = true;

		for (int i = 0; i < input.length(); i++) {
			char c = input.charAt(i);

			if (!"0123456789".contains("" + c)) {
				isNum = false;
			}

		}

		return isNum;
	}

}
