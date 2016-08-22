package study.algorithm.naver;

import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;

public class UppercaseTest {

	@Test
	public void testWithIntProcessing() {
		Solution actual = new Solution();
		Assert.assertEquals("AAAABB", actual.execute1st("aaAaBB"));
	}
	
	@Test
	public void testWithCharMap() throws Exception {
		Solution actual = new Solution();
		Assert.assertEquals("AAAABB", actual.execute2nd("aaAaBB"));
	}

	class Solution {

		public String execute1st(String arg) {
			String result = new String();

			for (int i = 0; i < arg.length(); i++) {
				char c = arg.charAt(i);

				if (c >= 97 && c <= 120) {
					result += (char) (c - 32);
					continue;
				}

				result += c;

			}

			return result;
		}
		
		public String execute2nd(String arg){
			
			String result = new String();
			
			Map<Character,Character> dic = getCharMap();

			for (int i = 0; i < arg.length(); i++) {
				char c = arg.charAt(i);

				if (dic.containsKey(c)) {
					result += dic.get(c);
					continue;
				}

				result += c;

			}
			
			return result;
			
		}

		public Map<Character, Character> getCharMap() {
			Map<Character, Character> map = new HashMap<Character, Character>();

			int a = 'a';
			int z = 'z';

			for (int i = a; i <= z; i++) {
				map.put((char) i, (char) (i - 32));
			}

			return map;
		}
		
	}

}
