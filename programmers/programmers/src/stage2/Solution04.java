package stage2;

public class Solution04 {
	public String solution(String s) {
		String answer = "";
		for (int i = 0; i < s.length(); i++) {
			if(s.charAt(i) == ' ') {
				answer += ' ';
				if(i < s.length()-1) {
					if(s.charAt(i+1) != ' ') {
						i++;
						answer += Character.toUpperCase(s.charAt(i));
					}
				}
			}else {
				if(i != 0) {
					answer += Character.toLowerCase(s.charAt(i));;
				}else {
					answer += Character.toUpperCase(s.charAt(i));
				}
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		String str = "  for the what 1what  ";
		Solution04 s = new Solution04();
		s.solution(str);
	}
}
