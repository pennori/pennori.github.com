package study.algorithm.tripleIntCase;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		System.out.println("AA + BC = *00 와 a + b = c 인 경우 찾기");
		testMain.prepare();
	}

	private void prepare() {
		int count = 0;
		int loop = 0;

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

					loop++;

					if (i + j == k) {

						String p = String.valueOf(i);
						String q = String.valueOf(j);
						String r = String.valueOf(k);

						int pp = Integer.parseInt(p + p);
						int qr = Integer.parseInt(q + r);

						String result = String.valueOf(pp + qr);

						System.out.println(pp + " + " + qr + " = " + result);

						if (3 > result.length()) {
							continue;
						}

						if (result.charAt(1) != result.charAt(2)) {
							continue;
						}

						if ('0' != result.charAt(1) || '0' != result.charAt(2)) {

						}

						System.out.println("i  : " + i + ", j : " + j
								+ ", k : " + k);
						count++;

					}

				}

			}

		}

		System.out.println("경우의 수 : " + count);
		System.out.println("수행횟수 : " + loop);
	}

}
