package programmers.stage1;

public class Solution24 {
	public long[] solution(long n, long m) {
		long[] answer = new long[2];

		for (int i = 1; i <= n; i++) {
			for (int j = 1; j <= m; j++) {
				if(n%i == 0) {
					if(m%j == 0 && i == j) {
						answer[0] = j;
						System.out.println(answer[0]);
					}
				}
			}
		}

		int num = 0;
		for (int i = 1; i <= n * m; i++) {
			for (int j = 1; j <= n * m; j++) {
				if (n * i == m * j) {
					answer[1] = n * i;
					System.out.println(answer[1]);
					num++;
					break;
				}
			}
			if (num == 1) {
				break;
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution24 s = new Solution24();
		s.solution(555122, 667);
	}
}
