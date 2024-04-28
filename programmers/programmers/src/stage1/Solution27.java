package stage1;

public class Solution27 {
	public boolean solution(String s) {
		boolean answer = false;
		int num = 0;
		if (s.length() == 4 || s.length() == 6) {
			for (int i = 0; i < s.length(); i++) {
				if ((int) s.charAt(i) >= 48 && (int) s.charAt(i) <= 57) {
					num++;
				}
			}
		}
		if (num == s.length()) {
			answer = true;
		}
		return answer;
	}
}
