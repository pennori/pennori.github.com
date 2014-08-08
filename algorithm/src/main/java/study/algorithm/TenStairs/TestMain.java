package study.algorithm.TenStairs;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		System.out.println("recursion : " + recursionWays(10));
		System.out.println("another : " + anotherWays(10));
	}

	public int recursionWays(int n) {
		if (1 == n)	return 1;
		if (2 == n)	return 2;
		if (3 == n)	return 4;

		return recursionWays(n - 1) + recursionWays(n - 2) + recursionWays(n - 3);
	}
	
	public int anotherWays(int n){
		if (1 == n)	return 1;
		if (2 == n)	return 2;
		if (3 == n)	return 4;
		
		return 0;
	}

}
