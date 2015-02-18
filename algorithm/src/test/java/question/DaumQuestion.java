package question;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

public class DaumQuestion {

	private int count = 0;
	private String p = "XYZ";
	private String q = "XY";
	private String r = "P6P";

	Set<String> resultSet = new HashSet<String>();

	@Test
	public void question2() {

		excute(p, q, r);
		for (String result : resultSet) {
			System.out.println(result);
		}
		System.out.println("count: " + count + "번 비교");
	}

	private void excute(String pString, String qString, String rString) {

		Map<String, Boolean> alphabets = getAlphabets(pString, qString, rString);

		if (alphabets.keySet().size() < 1) {
			int result = Integer.parseInt(pString) + Integer.parseInt(qString);

			if (result == Integer.parseInt(rString)) {
				resultSet.add(pString + " + " + qString + " = " + rString);
			}
		} else {
			for (String alphabet : alphabets.keySet()) {

				int start = alphabets.get(alphabet) ? 0 : 1;

				for (int i = start; i < 10; i++) {
					count++;

					if (isNumber(pString.replaceAll(alphabet, i + ""))
							&& isNumber(qString.replaceAll(alphabet, i + ""))) {

						if (isNumber(rString.substring(0, 1))) {

							int sumValue = Integer.parseInt(pString.replaceAll(
									alphabet, i + ""))
									+ Integer.parseInt(qString.replaceAll(
											alphabet, i + ""));

							String maxRValue = rString.substring(0, 1);

							for (int j = 0; j < rString.length() - 1; j++) {
								maxRValue = maxRValue + "9";
							}
							if (sumValue > Integer.parseInt(maxRValue)) {
								break;
							}
						}
					}
					excute(pString.replaceAll(alphabet, i + ""),
							qString.replaceAll(alphabet, i + ""),
							rString.replaceAll(alphabet, i + ""));
				}
			}
		}

	}

	private Map<String, Boolean> getAlphabets(String... stringValues) {
		Map<String, Boolean> alphabets = new HashMap<String, Boolean>();

		for (String stringValue : stringValues) {

	    	for (int i = 0; i < stringValue.length(); i++) {

				if (!"0123456789".contains(stringValue.charAt(i) + "")) {
					alphabets.put(stringValue.charAt(i) + "", i == 0 ? false
							: true);
				}

			}
		}
		return alphabets;
	}

	private boolean isNumber(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}