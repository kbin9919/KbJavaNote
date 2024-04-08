package programmers.stage1;

public class Solution29 {
	  public int solution(String t, String p) {
	        int answer = 0;
	        String num = "";
	        for(int i =0; i<t.length(); i++) {
	        	if(i <= t.length() - p.length()) {
	        		num = t.substring(i, i+p.length());
	        		System.out.println(num);
		        	if(Long.parseLong(num) <= Long.parseLong(p)) {
		        		answer++;
		        	}
	        	}
	        }
	        System.out.println(answer);
	        return answer;
	    }
	  public static void main(String[] args) {
		Solution29 s = new Solution29();
		s.solution("1111111111111111111111111111111", "111111111111111111");
	}
}
