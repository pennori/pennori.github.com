package unknown.naver;

import org.junit.Assert;
import org.junit.Test;

public class ArmstrongNumTest {

	@Test
	public void test() {
		Solution actual = new Solution();
		Assert.assertEquals(4, actual.solution(100, 500));
		Assert.assertEquals(5, actual.solution(100, 1000));
	}

	class Solution {

		public int solution(int min, int max) {

			boolean isMinSmall = min < 100;
			boolean isMaxSmall = max < 100;
			boolean minGreaterThanMax = min > max;
			
			if (isMinSmall || isMaxSmall || minGreaterThanMax) {
				return 0;
			}

			int param = 0;
			int result = 0;
			
			int x = 0;
			int y = 0;
			int z = 0;
			
			int sum = 0;

			for (int i = min; i <= max; i++) {

				param = i;
				x = param / 100;
				y = (param % 100) / 10;
				z = param % 10;
				
				int xCube = 1;
				int yCube = 1;
				int zCube = 1;

				for (int j = 0; j < 3; j++) {
					xCube *= x;
					yCube *= y;
					zCube *= z;
				}
				
				sum = xCube + yCube + zCube;
				
				if (param == sum) {
					result++;
				}
				
			}

			return result;
		}

	}

}
