package programmers.stage1;

public class Solution39 {
	public String solution(int[] food) {
		String answer = "";
		for (int i = 0; i < food.length; i++) {
			while (food[i] - 2 >= 0) {
				food[i] -= 2;
				answer += i;
			}
		}
		StringBuffer sb = new StringBuffer(answer);
		answer += "0";
		answer += sb.reverse();
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {
		Solution39 s = new Solution39();
		int x[] = { 1, 2, 4, 6 };
		s.solution(x);
	}
}
