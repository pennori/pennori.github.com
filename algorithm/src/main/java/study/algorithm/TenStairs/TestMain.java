package study.algorithm.TenStairs;

import java.util.HashMap;
import java.util.Map;

public class TestMain {

	static Map<Integer, Integer> memo = new HashMap<Integer, Integer>();

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	public void execute() {
		long start;
		long end;

		start = System.currentTimeMillis();
		System.out.println("recursion : " + recursionWays(10));
		end = System.currentTimeMillis();
		System.out.println("elapsed : " + (end - start));

		start = System.currentTimeMillis();
		System.out.println("another : " + anotherWays(10));
		end = System.currentTimeMillis();
		System.out.println("elapsed : " + (end - start));

		start = System.currentTimeMillis();
		System.out.println("memoization : " + memoizationWays(10));
		end = System.currentTimeMillis();
		System.out.println("elapsed : " + (end - start));
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
		
		int[] prev = { 1, 2, 4 };
		int current = 3;
		
		while(current < n){
			
			int result = prev[0] + prev[1] + prev[2];
			prev[0] = prev[1];
			prev[1] = prev[2];
			prev[2] = result;
			
			current++;
		}

		return prev[2];
	}

	private int memoizationWays(int n) {
		if (1 == n)
			return 1;
		if (2 == n)
			return 2;
		if (3 == n)
			return 4;

		if (memo.get(n) == null) {
			memo.put(n, memoizationWays(n - 1) + memoizationWays(n - 2)
					+ memoizationWays(n - 3));
		}
		System.out.println(n + " : " + memo.get(n));
		return memo.get(n);
	}

}
