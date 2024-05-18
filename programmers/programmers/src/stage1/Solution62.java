package stage1;

public class Solution62 {
	public int solution(String s) {
		int answer = 1;
		int first = 1;
		int different = 0;
		int num = 0;
		for (int i = 1; i < s.length() - 1; i++) {
			if (s.charAt(num) == s.charAt(i)) {
				first++;
			}else {
				different++;
			}
			if(first == different) {
				answer++;
				num = i+1;
				i = num;
				first = 1;
				different = 0;
			}
		}
		System.out.println(answer);
		return answer;
	}
}
