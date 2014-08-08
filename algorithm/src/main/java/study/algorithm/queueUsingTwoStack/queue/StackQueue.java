package study.algorithm.queueUsingTwoStack.queue;

import java.util.Stack;

public class StackQueue {
	Stack<String> rear;
	Stack<String> front;

	public StackQueue() {
		super();
		this.rear = new Stack<String>();
		this.front = new Stack<String>();
	}

	public void push(String item) {
		rear.push(item);
		System.out.println(rear.peek() + " push complete");
	}

	public String pop() {
		if (isEmpty()) {
			System.out.println("queue is empty");
			return null;
		}

		while (!rear.isEmpty()) {
			front.push(rear.pop());
		}

		System.out.println(front.peek() + " pop complete");
		return front.pop();
	}

	public boolean isEmpty() {
		return rear.isEmpty() && front.isEmpty();
	}

}
