package programmers.stage1;

public class Solution21 {
	public boolean solution(String s) {
        boolean answer = false;
        int num = 0;
        if(s.length() == 4 || s.length() == 6) {
        	for(int i =0; i<s.length(); i++) {
        		if((int)s.charAt(i) >= 48 && (int)s.charAt(i) <= 57 ) { 
        			num ++;
        		}
        	}
        }
        if(num == s.length()) {
        	answer = true;
        }
        return answer;
    }
	public static void main(String[] args) {
		String str = "ZabczAZ";
		int i = 91;
		System.out.println((char) i);
		System.out.println((int)str.charAt(0));
	}
}
