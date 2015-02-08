package study.algorithm.sortStringPerLine;

import java.util.HashMap;
import java.util.Map;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		String words = "내가 그린 기린 그림은 잘 그린 그림이고 니가 그린 기린 그림은 못 그린 기린 그림이다";

		String[] wordArray = words.split("\\s");

		System.out.println(wordArray.length);
		Map<String, Integer> map = new HashMap<String, Integer>();

		for (String word : wordArray) {

			if (map.containsKey(word)) {
				map.put(word, map.get(word) + 1);
			} else {
				map.put(word, 1);
			}

		}
	}

}
