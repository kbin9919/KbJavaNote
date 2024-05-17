package stage1;

public class Solution61 {
	public int[] solution(int[] lottos, int[] win_nums) {
		int[] answer = new int[2];
		int win = 0;
		int fail = 0;
		for (int i = 0; i < lottos.length; i++) {
			for (int j = 0; j < win_nums.length; j++) {
				if (lottos[i] == win_nums[j]) {
					win++;
				}
			}
			if (lottos[i] == 0) {
				fail++;
			}
		}

		if (fail == 0 && win == 0) {
			win = 1;
		}
		answer[0] = 7 - (win + fail); // 최대
		answer[1] = 7 - (win); // 최소

		if (fail == 6) {
			answer[1] = 6;
		}
		return answer;
	}
}
