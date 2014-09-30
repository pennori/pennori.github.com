package test;

import service.TestService;
import service.TestServiceImpl;

public class AnnotationTest {

	public static void main(String[] args) throws Exception {
		String treeVO = "treeVO";
		String callback = "callback";

		TestService testService = new TestServiceImpl();
		testService.execute(treeVO, callback);
	}

}
