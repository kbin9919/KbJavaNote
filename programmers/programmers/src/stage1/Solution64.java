package stage1;

import java.util.Arrays;

public class Solution64 {
	public int solution(int n, int[] lost, int[] reserve) {
		int lostNum = lost.length;
		int cnt = 0;
		int answer = n - lostNum;
		Arrays.sort(lost); Arrays.sort(reserve);
		for (int i = 0; i < lostNum; i++) {
			for (int j = 0; j < reserve.length; j++) {
				if (cnt >= lostNum) {
					break;
				}
				if (reserve[j] == lost[i]) {
					reserve[j] = -1;
					lost[i] = -10;
					answer++;
					cnt++;
				}
			}
		}
		for (int i = 0; i < lostNum; i++) {
			for (int j = 0; j < reserve.length; j++) {
				if (cnt >= lostNum) {
					break;
				}
				if (reserve[j] - 1 <= lost[i] && reserve[j] + 1 >= lost[i]) {
					reserve[j] = -1;
					lost[i] = -10;
					answer++;
					cnt++;
				}
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution64 s = new Solution64();
		int x[] = { 4, 2 };
		int y[] = { 3 };
		s.solution(5, x, y);

	}

}
