package study.algorithm.recursion;

import java.util.ArrayList;
import java.util.List;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		
		Object[] arr = testMain.getObjectArray();
		
		print(arr);
	}

	/**
	 * @param arr
	 */
	private static void print(Object[] arr) {
		for (int i = 0; i < arr.length; i++) {
			Object outer = arr[i];
			
			if (outer instanceof Integer) {
				System.out.print(outer);
				if (i < arr.length - 1) System.out.print(", ");	
				continue;
			}
			
			System.out.println(outer.toString());

		}
	}
	
	Object[] getObjectArray(){
		List<Object> arr1 = new ArrayList<Object>();
		
		arr1.add(1);
		arr1.add(2);

		List<Object> arr2 = new ArrayList<Object>();
		
		arr2.add(1);
		arr2.add(3);
		arr2.add(5);
		
		arr1.add(arr2);
		arr1.add(45);
		arr1.add(7);
		arr1.add(8);
		
		List<Object> arr3 = new ArrayList<Object>();
		
		arr3.add(9);
		arr3.add(10);
		arr3.add(13);
		
		arr1.add(arr3);
		arr1.add(5);
		arr1.add(2);
		
		return arr1.toArray(new Object[]{});
	}

}
