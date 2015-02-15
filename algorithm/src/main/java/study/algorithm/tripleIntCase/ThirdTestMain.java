package study.algorithm.tripleIntCase;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ThirdTestMain {

	public String p = "XYZ";
	public String q = "XY";
	public String r = "6PP";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThirdTestMain main = new ThirdTestMain();
		main.execute();
	}

	public void execute() {
		System.out.println(isStr(p));
		calc(p, q, r);
	}

	private boolean isStr(String str) {
		Pattern pattern = Pattern.compile("^[A-Za-z]+");
		Matcher m = pattern.matcher(str);
		return m.find();
	}

	private void calc(String p, String q, String r) {
		// TODO Auto-generated method stub
		return;
	}

}
