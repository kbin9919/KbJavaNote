package programmers.stage1;

public class Solution30 {
	public int solution(int[] number) {
		int answer = 0;
		int num = 0;
		for (int i = 0; i < number.length; i++) {
			num = 0;
			num += number[i];

			for (int j = i + 1; j < number.length; j++) {

				num += number[j];

				for (int k = j + 1; k < number.length; k++) {

					num += number[k];

					if (num == 0) {
						answer++;
					}
					num -= number[k];
				}
				num -= number[j];
			}
		}
		return answer;
	}
}
