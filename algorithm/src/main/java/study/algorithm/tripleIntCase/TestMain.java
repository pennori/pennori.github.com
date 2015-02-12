package study.algorithm.tripleIntCase;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		String[] input = testMain.prepare();
		testMain.print(input[0], input[1], input[2]);
	}

	private String[] prepare() {
		int a = 0;
		int b = 0;
		int c = 0;

		while (true) {
			a = (int) (Math.random() * 10);
			b = (int) (Math.random() * 10);
			c = (int) (Math.random() * 10);

			if (a + b == c) {
				System.out.println(a + " + " + b + " = " + c);
				break;
			}
		}

		return new String[]{"1","8","9"};
		// TODO Auto-generated method stub
	}

	private void print(String p, String q, String r) {
		int a = Integer.parseInt(p);
		int b = Integer.parseInt(q);
		int c = Integer.parseInt(r);
		int aa = Integer.parseInt(p + p);
		int bc = Integer.parseInt(q + r);
		System.out.println(p + p + " + " + q + r + " = 100 => "
				+ ((aa + bc) == 100));
		System.out.println(p + " + " + q + " = " + r + " => " + (a + b == c));
	}

}
