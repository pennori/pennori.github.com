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
		int count = 0;

		for (int i = 0; i < 10; i++) {

			for (int j = 0; j < 10; j++) {

				for (int k = 0; k < 10; k++) {

					if (i == j || i == k || j == k) {
						continue;
					}

					if (i + j == k) {

						System.out.println("i  : " + i + ", j : " + j
								+ ", k : " + k);
						count++;

					}

				}

			}

		}

		System.out.println(count);

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
