package report.oop;

import java.util.Calendar;
import java.util.Scanner;

public class Solution {

	public static void main(String[] args) {
		Solution solution = new Solution();
		solution.execute();
	}

	public void execute() {

		System.out.println("프로그램이 시작되었습니다.\n");
		Scanner scanner = new Scanner(System.in);

		try {

			while (true) {

				System.out.println("이름을 입력해주세요.");
				String name = scanner.nextLine();

				System.out.println("태어난 연도를 입력해주세요.");
				String year = scanner.nextLine();

				if (!isNumberOnly(year)) {
					throw new RuntimeException("연도형식이 올바르지 않습니다.");
				}

				System.out.println(Person.newInstance(name, Integer.parseInt(year)));

				System.out.println("계속 하시겠습니까? (y/n)");
				String repeatFlag = scanner.nextLine();
				if ("n".equals(repeatFlag) || 1 < repeatFlag.length()) {
					break;
				}

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			scanner.close();
			System.out.println("\n프로그램이 종료되었습니다.");
		}

	}

	private boolean isNumberOnly(String year) {
		boolean isValidated = true;

		for (int i = 0; i < year.length(); i++) {

			char number = year.charAt(i);
			if ('0' > number || '9' < number) {
				isValidated = false;
				break;
			}

		}

		return isValidated;
	}

	static class Person {

		private String name;
		private int year;
		private int age;

		public int calculateAge() {
			Calendar calendar = Calendar.getInstance();
			int currentYear = calendar.get(Calendar.YEAR);

			return currentYear - this.year + 1;
		}

		private Person(String name, int year) {
			super();
			this.name = name;
			this.year = year;
			this.age = calculateAge();
		}

		private Person() {
		}

		public static Person newInstance(String name, int year) {
			return new Person(name, year);
		}

		@Override
		public String toString() {
			return "이름 : " + name + ", 나이 : " + age;
		}

	}
}
