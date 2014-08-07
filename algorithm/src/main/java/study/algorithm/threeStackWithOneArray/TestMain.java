package study.algorithm.threeStackWithOneArray;

import study.algorithm.threeStackWithOneArray.stack.ArrayStack;

public class TestMain {

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		
		TestMain testMain = new TestMain();
		testMain.execute();
		
		long end = System.currentTimeMillis();
		long elapsed = end - start;
		
		System.out.println("elapsed : " + elapsed + " ms");
		System.out.println("start : " + start + " ms");
		System.out.println("end : " + end + " ms");
	}

	private void execute() {
		String[] arrayZone = new String[9];
		int size = 3;
		int firstBottom = 0;
		int secondBottom = firstBottom + size;
		int thirdBottom = secondBottom + size;

		ArrayStack stack1 = new ArrayStack(size, firstBottom, arrayZone);

		stack1.push("1");
		stack1.push("2");
		stack1.push("3");
		stack1.push("4");
		
		stack1.pop();
		stack1.pop();

		stack1.peekAll();

		ArrayStack stack2 = new ArrayStack(size, secondBottom, arrayZone);

		stack2.push("11");
		stack2.push("22");
		stack2.push("33");
		stack2.push("44");
		
		stack2.pop();

		stack2.peekAll();

		ArrayStack stack3 = new ArrayStack(size, thirdBottom, arrayZone);

		stack3.push("111");
		stack3.push("222");
		stack3.push("333");
		stack3.push("444");
		
		stack3.pop();
		stack3.pop();
		stack3.pop();
		stack3.pop();

		stack3.peekAll();

		for (int i = 0; i < arrayZone.length; i++) {
			String zone = arrayZone[i];
			System.out.println(i + " : " + zone);
		}
	}

}
