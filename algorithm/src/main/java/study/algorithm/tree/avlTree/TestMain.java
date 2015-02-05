package study.algorithm.tree.avlTree;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class TestMain {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		int value;
		AvlTree tree = new AvlTree();

		tree.insert(50);

		while (true) {

			System.out.println("------------------------------------------");
			System.out.println("1. Traverse");
			System.out.println("2. Find");
			System.out.println("3. Find Min & Max");
			System.out.println("4. Insert");
			System.out.println("5. Delete");
			System.out.println("6. Display Tree");
			System.out.print("Enter the number of command : ");
			int command = getInt();

			switch (command) {
			case 1:

				System.out.println("1. PreOrder");
				System.out.println("2. InOrder");
				System.out.println("3. PostOrder");
				System.out.print("Enter number of type : ");
				value = getInt();
				tree.traverse(value);
				System.out.println();
				break;

			case 2:

				System.out.println("Enter value : ");
				value = getInt();
				Node found = tree.find(value);

				if (found != null) {

					System.out.println("Found : ");
					found.showNode();
					System.out.println();

				} else {

					System.out.println("Could not find " + value + '\n');
					System.out.println();

				}

				break;

			case 3:

				System.out.println("1. Find Minimum value");
				System.out.println("2. Find Maximum value");
				System.out.println("Enter number of type : ");
				value = getInt();

				if (value == 1) {

					found = tree.findMin();
					System.out.print("Found : ");
					found.showNode();
					System.out.println();

				} else if (value == 2) {

					found = tree.findMax();
					System.out.print("Found : ");
					found.showNode();
					System.out.println();

				}
				System.out.println();
				break;

			case 4:

				System.out.println("Enter integer value to insert : ");
				value = getInt();
				tree.insert(value);
				System.out.println();
				System.out.println("Insert Result");
				tree.display();
				System.out.println();
				break;

			case 5:

				System.out.println("Enter integer value to delete : ");
				value = getInt();
				boolean complete = tree.delete(value);

				if (complete) {

					System.out.print("Deleted " + value + '\n');
					System.out.println("Delete Result");
					tree.display();

				} else {
					System.out.print("Could not delete " + value + '\n');
				}
				System.out.println();
				break;

			case 6:

				tree.display();
				break;

			default:

				System.out.println("Invalid entry");
				break;

			}
		}

	}

	private static int getInt() throws IOException {
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		String s = br.readLine();

		return Integer.parseInt(s);
	}

}
