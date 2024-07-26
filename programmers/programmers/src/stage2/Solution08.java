package stage2;

public class Solution08 {
	public int solution(int n) {
		
		int before = 1;
		int beforeLast = 1;
		int answer = 0;
		
		for (int i = 2; i < n; i++) {
			answer = (before + beforeLast) % 1234567;
			beforeLast = before;
			before = answer;
		}
		
		return answer;
	}
	
	public static void main(String[] args) {
		Solution08 s = new Solution08();
		s.solution(5);
	}
}
