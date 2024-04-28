package stage1;

public class Solution01 {
	boolean solution(String s) {
		boolean answer = true;
		int num1 = 0;
		int num2 = 0;
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) == 'p' || s.charAt(i) == 'P') {
				num1++;
			} else if (s.charAt(i) == 'y' || s.charAt(i) == 'Y') {
				num2++;
			}
		}
		if (num1 != num2) {
			return answer = false;
		}
		return answer;
	}
}
