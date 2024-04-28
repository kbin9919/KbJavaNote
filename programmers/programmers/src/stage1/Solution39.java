package stage1;

public class Solution39 {
	public int solution(String s) {
		int answer = 0;
		String strArr[] = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
		for (int i = 0; i < strArr.length; i++) {
			if (s.contains(strArr[i])) {
				s = s.replace(strArr[i], String.valueOf(i));
			}
		}
		answer = Integer.parseInt(s);
		return answer;
	}
}
