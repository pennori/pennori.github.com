package advice;

import annotation.Switching;

@Switching(operation = "around")
public class TestAdvice {
	public void before(String main, String work) {
		System.out.println("before " + work);
		System.out.println(main + " " + work);
	}

	public void after(String main, String work) {
		System.out.println(main + " " + work);
		System.out.println("after " + work);
	}

	public void around(String main, String work) {
		before(main, work);
		after(main, work);
	}

}
