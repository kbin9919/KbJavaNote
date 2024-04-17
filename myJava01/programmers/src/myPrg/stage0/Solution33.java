package programmers.stage1;

public class Solution33 {
	public int solution(String s) {
		int answer = 0;
		String strArr[] = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
		for (int i = 0; i < strArr.length; i++) {
			if (s.contains(strArr[i])) {
				s = s.replace(strArr[i], String.valueOf(i));
			}
		}
		answer = Integer.parseInt(s);
		return answer;
	}
	public static void main(String[] args) {
		String str = "one4seveneight";
		String str2 = "123";
		Solution33 s = new Solution33();
		System.out.println(s.solution(str));

	}
}
