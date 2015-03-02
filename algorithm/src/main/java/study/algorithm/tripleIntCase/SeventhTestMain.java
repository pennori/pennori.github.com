package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SeventhTestMain {

	List<String> strList = new ArrayList<String>();
	Map<String, String> strMap;
	Set<String> resultSet = new HashSet<String>();

	String strP = "XYZ";
	String strQ = "XY";
	String strR = "6PP";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SeventhTestMain main = new SeventhTestMain();
		main.execute();
	}

	private void execute() {
		// TODO Auto-generated method stub
		setUniqueStrList(strP + strQ + strR);

		int depth = strList.size();
		int[] start = getNestedLoopDepth(depth, 0);
		int[] end = getNestedLoopDepth(depth, 10);

		doLoop(start, end, 0);
		System.out.println(resultSet);
	}

	private void doLoop(int[] start, int[] end, int level) {
		// TODO Auto-generated method stub
		if (level == start.length) {
			calculate(start);
			return;
		}
		
		for (start[level] = 0; start[level] < end[level]; start[level]++) {
			doLoop(start, end, level + 1);
		}

	}

	private void calculate(int[] start) {
		strMap = new LinkedHashMap<String, String>();
		for (int i = 0; i < start.length; i++) {
			String value = "" + start[i];
			if (strMap.containsValue(value)) {
				return;
			}

			strMap.put(strList.get(i), value);
		}
		print(strMap);
	}

	private int[] getNestedLoopDepth(int depth, int initValue) {
		int[] target = new int[depth];

		for (int i = 0; i < target.length; i++) {
			target[i] = initValue;
		}
		return target;
	}

	private void print(Map<String, String> strMap) {
		String tempP = strP;
		String tempQ = strQ;
		String tempR = strR;

		int size = strList.size();
		for (int i = 0; i < size; i++) {

			String key = strList.get(i);
			String value = strMap.get(key);

			tempP = tempP.replaceAll(key, value);
			tempQ = tempQ.replaceAll(key, value);
			tempR = tempR.replaceAll(key, value);
		}

		int intP = Integer.parseInt(tempP);
		int intQ = Integer.parseInt(tempQ);
		int intR = Integer.parseInt(tempR);
		int actual = intP + intQ;

		if (actual == intR) {
			resultSet.add(tempP + "+" + tempQ + "=" + tempR);
		}

	}

	private void setUniqueStrList(String input) {
		for (int i = 0; i < input.length(); i++) {

			String str = "" + input.charAt(i);
			if ("0123456789".contains(str) || strList.contains(str)) {
				continue;
			}

			strList.add(str);

		}
	}

}
