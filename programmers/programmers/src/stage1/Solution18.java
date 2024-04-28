package stage1;

public class Solution18 {
	public int solution(int num) {
		long n = (long) num;
		int answer = 0;

		while (n != 1) {
			if (answer >= 500) {
				return answer = -1;
			}
			if (n % 2 == 0) {
				n /= 2;
			} else if (n % 2 != 0) {
				n = (n * 3) + 1;
			}
			answer++;
		}
		return answer;
	}
}
