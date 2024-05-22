package stage1;

public class Solution66 {
	public String solution(String s, String skip, int index) {
		String answer = "";
		for (char c : s.toCharArray()) {
			int cnt = 0;
			for (int i = 0; i < index; i++) {
				if(++c > 'z') {
					c ='a';
				}
				if(skip.contains(String.valueOf(c))) {
					i--;
				}
			}
			answer += c;
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution66 s = new Solution66();
		s.solution("zzzzzz", "abcdefghijklmnopqrstuvwxy", 6);
		// abcdefghizklmnopqrstuvwxyz
		// a == 97 z==122
	}
}
