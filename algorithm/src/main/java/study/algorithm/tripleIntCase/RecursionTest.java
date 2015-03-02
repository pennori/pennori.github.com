package study.algorithm.tripleIntCase;

import java.util.ArrayList;
import java.util.List;

public class RecursionTest {

	List<Integer> list = new ArrayList<Integer>();
	int count = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RecursionTest test = new RecursionTest();
		test.excute();
	}

	private void excute() {
		// TODO Auto-generated method stub
		int depth = 3;
		int[] index = new int[depth];

		for (int i = 0; i < index.length; i++) {
			index[i] = 0;
		}

		int[] max = new int[depth];

		for (int i = 0; i < max.length; i++) {
			max[i] = 10;
		}

		doLoop(index, max, 0);
	}

	private void doLoop(int[] index, int[] max, int level) {
		if (index.length == level) {
			print(index);
		} else {
			for (index[level] = 0; index[level] < max[level]; index[level]++) {
				doLoop(index, max, level + 1);
			}
		}

	}

	private void print(int[] index) {
		String str = "";
		for (int i = 0; i < index.length; i++) {

			str += index[i];
			if (i < index.length - 1) {
				str += ", ";
			}

		}
		System.out.println(str);
	}





}
