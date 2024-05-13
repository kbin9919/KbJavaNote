package stage1;

public class Solution57 {
	public int solution(int n, int m, int[] section) {
		int answer = 0;
		for (int i = 1; i <= n; i++) {
			for (int j = 0; j < section.length; j++) {
				if (i == section[j]) {
					section[j] = 0;
					i += m - 1;
					answer++;
					break;
				}
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution57 s = new Solution57();
		int[] x = { 1, 4, 5 };
		s.solution(5, 2, x);
	}
}
