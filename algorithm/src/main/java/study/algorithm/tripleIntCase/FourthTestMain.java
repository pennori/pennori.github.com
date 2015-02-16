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
	public String strP = "XYZ";
	public String strQ = "XY";
	public String strR = "6PP";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FourthTestMain main = new FourthTestMain();
		main.execute();
	}

	public void execute() {
		initKeyListAndMap(strP + strQ + strR);
		calculate(strP, strQ, strR, keyList.get(0));

		System.out.println("수행횟수 : " + resultSet.size());
		System.out.println("수행 상세: " + resultSet);
	}

	private void initKeyListAndMap(String input) {
		for (int i = 0; i < input.length(); i++) {

			char key = input.charAt(i);

			if (keyList.contains("" + key) || isNum("" + key)) {
				continue;
			}

			keyList.add("" + key);
			keyMap.put("" + key, -1);
		}
	}

	private void calculate(String p, String q, String r, String key) {
		String op = p;
		String oq = q;
		String or = r;

		int size = keyList.size();
		for (int i = 0; i < size; i++) {
			String resultKey = keyList.get(i);
			Integer resultValue = keyMap.get(resultKey);

			if (-1 == resultValue) {
				continue;
			}

			op = op.replaceAll(resultKey, "" + resultValue);
			oq = oq.replaceAll(resultKey, "" + resultValue);
			or = or.replaceAll(resultKey, "" + resultValue);
		}

		if (isNum(op) && isNum(oq) && isNum(or)) {

			int expected = Integer.parseInt(or);
			int left = Integer.parseInt(op);
			int right = Integer.parseInt(oq);
			int result = left + right;
			if (expected == result
					&& keyList.size() - 1 == keyList.indexOf(key)) {
				return;
			}

		}

		int start = 0;
		if (0 == op.indexOf(key) || 0 == oq.indexOf(key)
				|| 0 == or.indexOf(key)) {
			start = 1;
		}

		for (int i = start; i < 10; i++) {

			if (!isPossible(key, i)) {
				continue;
			}

			keyMap.put(key, i);

			String nextKey = getNextKey(key);
			if (null != nextKey) {
				calculate(op, oq, or, nextKey);
			}

		}



	}

	private boolean isPossible(String key, int i) {
		boolean isPossible = true;

		int size = keyList.size();
		for (int j = 0; j < size; j++) {

			String tempKey = keyList.get(j);
			if (key != tempKey && i == keyMap.get(tempKey)
					&& keyList.indexOf(tempKey) < keyList.indexOf(key)) {
				isPossible = false;
			}

		}

		return isPossible;
	}

	private String getNextKey(String key) {
		String nextKey = null;

		int size = keyList.size();
		for (int i = 0; i < size; i++) {
			String compareKey = keyList.get(i);
			if (compareKey.equals(key) && i < size - 1) {
				nextKey = keyList.get(i + 1);
				break;
			}
		}

		return nextKey;
	}

	private boolean isNum(String input) {
		boolean isNum = true;
		for (int i = 0; i < input.length(); i++) {
			char key = input.charAt(i);

			if (!"0123456789".contains("" + key)) {
				isNum = false;
			}
		}
		return isNum;
	}


}
