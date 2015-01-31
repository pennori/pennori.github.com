package study.algorithm.recursion.hanoi;

public class TestMain {

	static int num_disk = 3;

	public static void main(String[] args) {
		moveDisk(num_disk, 'A', 'B', 'C');
	}

	public static void moveDisk(int top, char from, char mid, char to) {
		if (1 == top) {
			System.out.println("원판1 이 기둥" + from + "에서 기둥" + to + "로 이동");
		} else {
			moveDisk(top - 1, from, to, mid);
			System.out.println("원판" + top + "이 기둥" + from + "에서 기둥" + to
					+ "로 이동");
			moveDisk(top - 1, mid, from, to);
		}
	}
}
