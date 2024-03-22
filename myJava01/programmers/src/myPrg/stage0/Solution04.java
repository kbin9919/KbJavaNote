package programmers.stage1;

public class Solution04 {
	 public long solution(long n) {
			long answer = -1;
				for(long i = 0; i<=n; i++) {
					if(n == i*i) {
						return answer = (i+1)*(i+1);
					}
				}
			
			return answer;
		}
}
