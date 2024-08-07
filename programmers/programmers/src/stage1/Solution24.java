package stage1;

public class Solution24 {
	public int solution(int left, int right) {
		int answer = 0;
		for (int i = left; i <= right; i++) {
			int num = 0;
			for (int j = 1; j <= i / 2; j++) {
				if (i % j == 0) {
					num++;
				}
			}
			answer = num % 2 == 0 ? answer - i : answer + i;
		}
		return answer;
	}
}
