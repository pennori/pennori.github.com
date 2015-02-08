package study.algorithm.sortStringPerLine;

import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		String words = "내가 그린 기린 그림은 잘 그린 그림이고 니가 그린 기린 그림은 못 그린 기린 그림이다";

		String[] array = words.replaceAll("\\s", "").split("");
		int length = array.length;

		Set<String> set = new TreeSet<String>();

		for (int i = 0; i < length; i++) {

			int count = 0;

			if (array[i].equals("") || !set.add(array[i])) {
				continue;
			}

			Pattern p = Pattern.compile(array[i]);
			Matcher m = p.matcher(words);

			while (m.find()) {
				count++;
			}

			System.out.println(array[i] + " : " + count);

		}
	}

}
