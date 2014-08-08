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

		while (!this.rear.isEmpty()) {
			this.front.push(this.rear.pop());
		}

		System.out.println(this.front.peek() + " pop complete");
		return this.front.pop();
	}

	public boolean isEmpty() {
		return this.rear.isEmpty() && this.front.isEmpty();
	}

}
