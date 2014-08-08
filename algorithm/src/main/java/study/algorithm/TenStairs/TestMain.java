package study.algorithm.TenStairs;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		System.out.println(ways(10));
	}

	public int ways(int n) {
		if (1 == n)	return 1;
		if (2 == n)	return 2;
		if (3 == n)	return 4;

		return ways(n - 1) + ways(n - 2) + ways(n - 3);
	}

}
