package stage1;

public class Solution04 {
	public int solution(int n) {
		int answer = 0;
		String str = String.valueOf(n); // "123"
		int[] x = new int[str.length()]; // 길이가 문자열의 길이와 같음 : x[3]
		String[] s = new String[str.length()]; // 길이가 문자열의 길이와 같음 : x[3]
		for (int i = 0; i < str.length(); i++) { // 0부터 2까지
			s[i] = String.valueOf(str.charAt(i)); // x[0] = 1, x[1] = 2, x[2] = 3
			x[i] = Integer.parseInt(s[i]);
			System.out.println(x[i]);
			answer += x[i]; // 0 + 1 + 2 + 3;
		}
		return answer;
	}
}
