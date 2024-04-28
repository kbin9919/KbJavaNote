package stage1;

public class Solution45 {
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
}
