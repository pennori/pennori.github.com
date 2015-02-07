package study.algorithm.TenStairs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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

		start = System.currentTimeMillis();
		System.out.println("merge : " + mergeWays(10));
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

	private int mergeWays(int n) {
		int count = 0;
		for (int[] combination : stairClimbingRoutes(new int[] { 1, 2, 3 }, n)) {
			int check = 0;
			for (int s : combination) {
				check += s;
			}
			System.out.println("Actual " + check + " using "
					+ Arrays.toString(combination));
			count++;
		}
		return count;
	}

	public static final List<int[]> stairClimbingRoutes(int[] strides, int steps) {

        // create the combination stack.
        // Longest possible combination is 1 step each time.
        int[] combination = new int[steps];
        int comblength = 0;

		List<int[]> results = new ArrayList<int[]>();

        recurseRoute(steps, strides, combination, comblength, results);
        return results;
    }

	private static void recurseRoute(final int remaining, final int[] strides,
			final int[] combination, final int comblength,
			final List<int[]> results) {
		if (remaining < 0) {
			// this combination takes us too far.
			return;
		}
		if (remaining == 0) {
			// this combination is just right.
			results.add(Arrays.copyOf(combination, comblength));
			return;
		}
		// need to go further.
		for (int s : strides) {
			combination[comblength] = s;
			recurseRoute(remaining - s, strides, combination, comblength + 1,
					results);
		}

	}

}
