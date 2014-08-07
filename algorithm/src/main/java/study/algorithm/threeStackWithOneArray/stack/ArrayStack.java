package study.algorithm.threeStackWithOneArray.stack;

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
		System.out.println(this.arrayZone[top] + " push complete");
	}

	public String pop() {
		if (isEmpty()) {
			System.out.println("stack is empty");
			return null;
		}
		
		String item = this.arrayZone[top--];
		this.arrayZone[top + 1] = null;
		
		System.out.println(item + " pop complete");
		
		return item;
	}

	public boolean isEmpty() {
		return this.top == this.bottom - 1;
	}

	public boolean isFull() {
		return this.top == this.bottom + this.size - 1;
	}

	public void peekAll(){
		for (int i = this.bottom; i <= this.top; i++) {
			System.out.println("remain : " + arrayZone[i]);
		}
	}
	

}