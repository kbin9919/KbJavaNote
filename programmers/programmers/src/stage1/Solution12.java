package stage1;

public class Solution12 {
	public int solution(int n) {
		int x = 1;
		while (true) {
			if (n % x == 1) {
				break;
			}
			x++;
		}
		int answer = x;
		return answer;
	}
}
