package study.algorithm.findDuplicateInt;

import java.util.Arrays;
import java.util.HashSet;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array = { 1, 2, 3, 5, 4, 5, 6, 7, 9, 7 };

		TestMain testMain = new TestMain();
		System.out.println("single set : " + testMain.checkDupSingleUsingSet(array));
		System.out.println("single prev : " + testMain.checkDupSingleUsingPrev(array));
		System.out.println("multi set : " + testMain.checkDupMultiUsingSet(array));
		System.out.println("multi prev : " + testMain.checkDupMultiUsingPrevArray(array));

	}

	public boolean checkDupSingleUsingSet(int[] array) {
		HashSet<Integer> set = new HashSet<Integer>();
		
		for (int i = 0; i < array.length; i++) {
		
			if (!set.add(array[i])) {
				return true;
			}
		
		}

		return false;
	}
	
	public boolean checkDupSingleUsingPrev(int[] array) {
		int prev = 0;
		int[] refineArray = array.clone();
		
		Arrays.sort(refineArray);
		
		for (int i = 0; i < refineArray.length; i++) {

			if (0 != prev && prev == refineArray[i]) {
				return true;
			}
			
			prev = refineArray[i];
			
		}
		
		return false;
	}
	
	public HashSet<Integer> checkDupMultiUsingSet(int[] array){
		HashSet<Integer> uniqueSet = new HashSet<Integer>();
		HashSet<Integer> dupSet = new HashSet<Integer>();
		
		for (int i = 0; i < array.length; i++) {
			
			if (!uniqueSet.add(array[i])) {
				dupSet.add(array[i]);
			}
			
		}
		
		return dupSet;
	}
	
	public boolean checkDupMultiUsingPrevArray(int[] array) {
		int[] prev = new int[array.length];
		
		for (int i = 0; i < array.length; i++) {

			if (0 != prev[i]) {
				
			}
			
		}
		
		return false;
	}

}
