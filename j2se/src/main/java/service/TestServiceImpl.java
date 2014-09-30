package service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import annotation.Switching;
import constant.Handling;

@Switching(operation = "before")
public class TestServiceImpl implements TestService, BeforeService,
		AfterService {

	public void execute(String treeVO, String callback)
			throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {

		Class<? extends TestService> clazz = this.getClass();

		if (clazz.isAnnotationPresent(Switching.class)) {

			Switching switching = clazz.getAnnotation(Switching.class);

			if (Handling.AROUND.getType().equals(switching.operation())) {
				Method before = getMethod(clazz, Handling.BEFORE.getType());
				before.invoke(this, treeVO, callback);

				System.out.println("main process");

				Method after = getMethod(clazz, Handling.AFTER.getType());
				after.invoke(this, treeVO, callback);

				return;
			}
			
			if (Handling.BEFORE.getType().equals(switching.operation())) {
				Method method = getMethod(clazz, switching.operation());
				method.invoke(this, treeVO, callback);
			}
			
			System.out.println("main process");

			if (Handling.AFTER.getType().equals(switching.operation())) {
				Method method = getMethod(clazz, switching.operation());
				method.invoke(this, treeVO, callback);
			}

		}
	}

	private Method getMethod(Class<? extends TestService> clazz,
			String methodName) throws NoSuchMethodException {
		return clazz.getMethod(methodName, String.class, String.class);
	}

	public void before(String treeVO, String callback) {
		System.out.println("before process");

	}

	public void after(String treeVO, String callback) {
		System.out.println("after process");

	}

}
