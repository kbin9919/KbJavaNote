package stage1;

public class Solution55 {
	public int solution(int number, int limit, int power) {
		int answer = 0;
		int a = 0;
		int powers[] = new int[number];
		for (int i = 1; i <= number; i++) {
			for (int j = 1; j <= Math.sqrt(i); j++) {
				if (j == Math.sqrt(i)) {
					powers[a]--;
				}
				if (i % j == 0) {
					powers[a] += 2;
				}
			}
			a++;
		}
		for (int i = 0; i < number; i++) {
			if (powers[i] <= limit) {
				answer += powers[i];
			} else {
				answer += power;
			}
		}

		return answer;
	}
}
