package study.algorithm.findDuplicateInt;

import java.util.HashSet;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array = { 1, 2, 3, 4, 5, 5, 6, 7, 7, 9 };

		TestMain testMain = new TestMain();
		System.out.println("use set : " + testMain.checkDupWithSet(array));
		System.out.println("use prev : " + testMain.checkDupWithPrev(array));

	}

	public boolean checkDupWithSet(int[] array) {
		HashSet<Integer> set = new HashSet<Integer>();

		for (int i = 0; i < array.length; i++) {
		
			if (!set.add(array[i])) {
				return true;
			}
		
		}

		return false;
	}
	
	public boolean checkDupWithPrev(int[] array) {
		int prev = 0;
		
		for (int i = 0; i < array.length; i++) {

			if (0 != prev && array[i] == prev) {
				return true;
			}
			
			prev = array[i];
			
		}
		
		return false;
	}

}
