package programmers;

public class Solution16 {
	  public String solution(String s) {
			String answer = "";
			if(s.length() % 2 != 0) {
				answer += s.charAt(s.length()/2);
				return answer;
			}
	        answer = s.substring(s.length()/2 -1, s.length()/2+1);
	        return answer;
	    }
}
