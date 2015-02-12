package study.algorithm.tripleIntCase;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		System.out.println("AA + BC = *00 와 a + b = c 인 경우 찾기");
		testMain.prepare();
		System.out.println();
		System.out.println("본 문제");
		testMain.execute();
	}

	private void execute() {
		// TODO Auto-generated method stub

	}

	private void prepare() {
		int count = 0;

		for (int i = 0; i < 10; i++) {

			if (i == 0) {
				continue;
			}

			for (int j = 0; j < 10; j++) {

				if (j == 0) {
					continue;
				}

				for (int k = 0; k < 10; k++) {

					if (i == j || i == k) {
						continue;
					}

					String p = String.valueOf(i);
					String q = String.valueOf(j);
					String r = String.valueOf(k);

					int pp = Integer.parseInt(p + p);
					int qr = Integer.parseInt(q + r);

					String result = String.valueOf(pp + qr);

					if (!"100".equals(result)) {
						continue;
					}

					System.out.println(pp + " + " + qr + " = " + result);

					count++;

				}

			}

		}

		System.out.println("경우의 수 : " + count);
	}

}
