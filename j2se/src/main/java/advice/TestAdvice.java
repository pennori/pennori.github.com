package advice;

import annotation.Switching;

@Switching(operation = "before")
public class TestAdvice {
	public void before(String work) {
		System.out.println("do " + work);
	}

}
