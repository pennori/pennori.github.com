package study.algorithm.threeStackUsingOneArray.stack;

public class ArrayStack {
	int size;
	int top;
	int bottom;
	String[] arrayZone;

	public ArrayStack(int size, int bottom, String[] arrayZone) {
		super();
		this.size = size;
		this.bottom = bottom;
		this.arrayZone = arrayZone;
		this.top = bottom - 1;
	}

	public void push(String item) {
		if (isFull()) {
			System.out.println("stack is full");
			return;
		}
		
		this.arrayZone[++top] = item;
		System.out.println(arrayZone[top] + " push complete");
	}

	public String pop() {
		if (isEmpty()) {
			System.out.println("stack is empty");
			return null;
		}
		
		String item = arrayZone[top--];
		arrayZone[top + 1] = null;
		
		System.out.println(item + " pop complete");
		
		return item;
	}

	public boolean isEmpty() {
		return top == bottom - 1;
	}

	public boolean isFull() {
		return top == bottom + size - 1;
	}

	public void peekAll(){
		for (int i = bottom; i <= top; i++) {
			System.out.println("remain : " + arrayZone[i]);
		}
	}
	

}