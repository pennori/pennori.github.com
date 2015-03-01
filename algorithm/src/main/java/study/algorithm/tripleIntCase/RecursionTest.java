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
		list.add(1);
		list.add(2);
		list.add(3);

		calc(list.get(0));
		System.out.println(count);
	}

	private void calc(Integer num) {
		for (int i = 0; i < 10; i++) {
			System.out.println(num);
			if (list.size() - 1 > list.indexOf(num)) {
				calc(list.get(list.indexOf(num) + 1));
			}
		}

	}



}
