package study.algorithm.vaildParenthesis;

import java.util.HashMap;
import java.util.Stack;
import java.util.TreeSet;

public class TestMain {
	public static void main(String[] args) {
		TestMain testMain = new TestMain();

		String correct = "[{(<>)}]";
		String incorrect = "[{(<><)}]";

		System.out.println("괄호 유효성 여부 : " + testMain.isValid(correct));
		System.out.println("괄호 유효성 여부 : " + testMain.isValid(incorrect));
	}

	public boolean isValid(String parenthesis) {
		HashMap<Character, Character> map = getParenthesisRule();
		Stack<Character> stack = new Stack<Character>();
		TreeSet<Character> set = new TreeSet<Character>();

		for (int i = 0; i < parenthesis.length(); i++) {

			char curr = parenthesis.charAt(i);

			if (!set.add(curr)) {
				return false;
			}

			if (map.containsKey(curr)) {
				
				stack.push(curr);
				
			} else if (!stack.isEmpty() && map.containsValue(curr)) {

				if (map.get(stack.peek()) == curr) {
					stack.pop();
					continue;
				}

				return false;

			}

		}
		
		for (int i = 0; i < set.size(); i++) {
			System.out.print(set.toArray()[i] + " ");
		}

		System.out.println();

		return stack.isEmpty();

	}

	private HashMap<Character, Character> getParenthesisRule() {
		HashMap<Character, Character> map = new HashMap<Character, Character>();

		map.put('(', ')');
		map.put('{', '}');
		map.put('[', ']');
		map.put('<', '>');
		
		return map;
	}
}
