package programmers.stage1;

public class Solution31 {
	public String solution(String s, int n) {
		String answer = "";
		int x = 0;
		for (int i = 0; i < s.length(); i++) {
			x = 0;
			if (s.charAt(i) != ' ') {
				x = n + s.charAt(i);
				if(s.charAt(i) < 91) {
					if(x > 90 && x < 122) {
						x -= (91 - 65);
					}	
				}else {
					if(x > 122) {
						x -= (123 - 97);
					}
				}
				answer += (char)x;
			} else {
				answer += s.charAt(i);
			}
		}
		return answer;
	}
	public static void main(String[] args) {
		
		Solution31 s = new Solution31();
		for(int i = 1; i < 26; i++) {
			System.out.println(i);
			System.out.println(s.solution("ABCDEFI", i));
		}
		System.out.println((int)'I');
		
		
		//a = 97~122
		//A = 65~90
	}
}
