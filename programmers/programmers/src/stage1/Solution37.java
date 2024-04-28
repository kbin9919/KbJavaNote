package stage1;

public class Solution37 {
	public String solution(String s, int n) {
		String answer = "";
		int x = 0;
		for (int i = 0; i < s.length(); i++) {
			x = 0;
			if (s.charAt(i) != ' ') {
				x = n + s.charAt(i);
				if (s.charAt(i) < 91) {
					if (x > 90 && x < 122) {
						x -= (91 - 65);
					}
				} else {
					if (x > 122) {
						x -= (123 - 97);
					}
				}
				answer += (char) x;
			} else {
				answer += s.charAt(i);
			}
		}
		return answer;
	}
}
