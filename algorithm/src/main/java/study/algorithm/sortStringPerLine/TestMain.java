package study.algorithm.sortStringPerLine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestMain {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() throws IOException {
		System.out.println("아래에 문자를 입력하세요");
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		String words = br.readLine();
		words = words.replaceAll("\\s", "");

		String[] array = words.split("");
		Set<String> set = new TreeSet<String>();

		for (int i = 0; i < array.length; i++) {

			if (!"".equals(array[i])) {

				int count = 0;

				Pattern p = Pattern.compile(array[i]);
				Matcher m = p.matcher(words);

				while (m.find()) {
					count++;
				}

				set.add(count + "번 사용됨 => " + array[i]);

			}

		}

		System.out.println(set.toArray()[0]);
		
		for (String string : set) {
			System.out.println(string);
		}

	}

}
