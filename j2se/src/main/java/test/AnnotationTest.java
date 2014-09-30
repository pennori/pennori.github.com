package test;

import java.lang.reflect.Method;

import advice.TestAdvice;
import annotation.Switching;

public class AnnotationTest {

	public static void main(String[] args) throws Exception {

		Class<?> clazz = TestAdvice.class;
		TestAdvice testAdvice = (TestAdvice) clazz.newInstance();

		if (clazz.isAnnotationPresent(Switching.class)) {
			Switching switching = clazz.getAnnotation(Switching.class);
			
			Method method = clazz.getMethod(switching.operation(), String.class);
			method.invoke(testAdvice, "something");
		}

	}

}
