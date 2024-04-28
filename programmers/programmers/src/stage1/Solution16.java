package stage1;

public class Solution16 {
	public int solution(int[] numbers) {
		int answer = 0;
		int[] x = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		for (int i = 0; i < numbers.length; i++) {
			for (int j = 0; j < x.length; j++) {
				if (numbers[i] == x[j]) {
					x[j] = 0;
				}
			}
		}
		for (int i = 0; i < x.length; i++) {
			answer += x[i];
		}
		return answer;
	}
}
