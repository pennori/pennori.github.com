package study.algorithm.queueUsingTwoStack;

import study.algorithm.queueUsingTwoStack.queue.StackQueue;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestMain testMain = new TestMain();
		testMain.execute();
	}

	private void execute() {
		// TODO Auto-generated method stub
		StackQueue stackQueue = new StackQueue();
		
		stackQueue.push("1");
		stackQueue.push("2");
		stackQueue.push("3");
		
		stackQueue.pop();
		stackQueue.pop();
		stackQueue.pop();
		stackQueue.pop();
	}

}
