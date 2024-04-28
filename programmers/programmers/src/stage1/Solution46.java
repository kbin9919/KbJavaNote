package stage1;

public class Solution46 {
	public int solution(int a, int b, int n) {

		int answer = 0;
		while (true) {
			// 남은 병 수
			int pN = n % a;
			// 반환받을 병 수
			int rC1 = n / a * b;

			answer += rC1;
			n = rC1 + pN;

			System.out.println("남은 빈 병 수 : " + n);
			if (n < a) {
				break;
			}
		}
		return answer;
	}
}
