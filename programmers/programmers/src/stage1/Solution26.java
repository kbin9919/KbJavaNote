package stage1;

public class Solution26 {
	public long solution(long price, long money, long count) {
		long answer = 0;
		for (long i = 1; i <= count; i++) {
			money -= price * i;
		}
		if (money < 0) {
			answer = (money * -1);
		}
		return answer;
	}
}
