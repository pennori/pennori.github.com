package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FourthTestMain {

	List<String> list = new ArrayList<String>();
	Map<String, Integer> map = new HashMap<String, Integer>();

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
	}

	private void initListAndMap(String input) {
		list = new ArrayList<String>();
		map = new HashMap<String, Integer>();

		for (int i = 0; i < input.length(); i++) {

			char key = input.charAt(i);

			System.out.println(key);
			if (list.contains("" + key) || "0123456789".contains("" + key)) {
				continue;
			}

			list.add("" + key);
			map.put("" + key, -1);
		}
	}

	private void calculate(String p, String q, String r) {
		// TODO Auto-generated method stub
		System.out.println(p);
		System.out.println(q);
		System.out.println(r);
		System.out.println(list);
		System.out.println(map);
	}

}
