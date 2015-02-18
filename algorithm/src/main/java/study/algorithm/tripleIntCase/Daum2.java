package study.algorithm.tripleIntCase;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

public class Daum2 {

	private String p = "XYZ";
	private String q = "XY";
	private String r = "6PP";

	private int iInputStringLength = 0;

	private Set<String> sInputStringType = new HashSet<String>();
	private Map<Integer, String> sInputString = new HashMap<Integer, String>();
	private Map<String, String> sInputStringANDValue = new HashMap<String, String>();
	// private Set<String> sOutPut = new HashSet<String>();

	// 정규식 확인용(숫자)
	String regex = "^[0-9]*$";

	public void startDaum2() {
		splitString(p);
		splitString(q);
		splitString(r);

		// 추출 문자를 숫자로 변경 하는 함수 호출
		changStringToInt();

	}// end startDaum2

	//
	public void changStringToInt() {
		// 시작 번호 확인
		int iStartNumber = (int) Math.pow(10, sInputString.size() - 1); // 10^(sInputStringType.size()-1);
		String sSplitString;
		Iterator<Integer> itr; // 이터레이터 사용

		// 숫자 대입
		for (int i = iStartNumber; i < iStartNumber * 10; i++) {
			if (!haveSameNumber(i)) {
				sInputStringANDValue = new HashMap<String, String>();
				itr = sInputString.keySet().iterator(); // 이터레이터 사용
				sSplitString = "" + i;
				int j = 0;
				while (itr.hasNext()) {
					sInputStringANDValue.put(sInputString.get(itr.next()),
							sSplitString.substring(j, j + 1));

					j++;
				}// end while
				calculationNumber();
			}

		}// end for(숫자 대입)

	}// end changStringToInt

	// 숫자 적용 및 값 계산.
	public String calculationNumber() {

		Iterator<String> itr = sInputStringANDValue.keySet().iterator();
		String p = this.p;
		String q = this.q;
		String r = this.r;
		String sKey = this.r;
		while (itr.hasNext()) {
			sKey = itr.next();
			p = p.replaceAll(sKey, sInputStringANDValue.get(sKey));
			q = q.replaceAll(sKey, sInputStringANDValue.get(sKey));
			r = r.replaceAll(sKey, sInputStringANDValue.get(sKey));
		}// end while

		if (notStartNumberZero(p) && notStartNumberZero(p)
				&& notStartNumberZero(p)) {
			try {
				if (Integer.parseInt(p) + Integer.parseInt(q) == Integer
						.parseInt(r)) {
					// sOutPut.add(p + "+" + q + "=" + r);
					System.out.println(this.p + "+" + this.q + "=" + this.r
							+ "=>" + p + "+" + q + "=" + r);
				}
			} catch (NumberFormatException e) {
				System.out.print(" p=" + p);
				System.out.print(" q=" + q);
				System.out.print(" r=" + r);
				System.out.println("");
			} catch (Exception e) {
				System.out.println("");
			}
		}// end if

		return null;
	}

	// 숫자의 시작 번호가 0인 확인 하는 함수
	public boolean notStartNumberZero(String sNumber) {

		if (sNumber == null) {
			return false;
		}
		if (sNumber.length() < 1) {
			return false;
		}

		if ("0".equals(sNumber.substring(0, 1))) {
			return false;
		}

		return true;
	}// end notStartNumberZero

	// 동일한 숫자가 있는지 확인 하는 함수
	public boolean haveSameNumber(int number) {
		if (number < 0) {
			return false;
		}
		String sNumber = "" + number;
		Set<String> temSet = new HashSet<String>();
		for (int i = 0; i < sNumber.length(); i++) {
			if (!temSet.add(sNumber.substring(i, i + 1))) {
				return true;
			}
		}
		return false;
	}// end haveSameNumber

	// 임력 분자 분리
	public void splitString(String splitString) {

		if (splitString == null || splitString.length() == 0) {
			return;
		}

		// 총 문자 길이 확인
		iInputStringLength = iInputStringLength + splitString.length();

		// 입력 문자 분리
		for (int i = 0; i < splitString.length(); i++) {
			// 숫자인지 확인
			if (!Pattern.matches(regex, splitString.substring(i, i + 1))) {
				if (sInputStringType.add(splitString.substring(i, i + 1))) {
					sInputString.put(sInputString.size(),
							splitString.substring(i, i + 1));
				}

			}
		}// end for
	}// end splitString

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Daum2 d2 = new Daum2();
		d2.startDaum2();

	}
}// end class