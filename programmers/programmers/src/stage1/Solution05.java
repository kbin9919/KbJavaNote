package stage1;

public class Solution05 {
	public int[] solution(long n) {
		String str1 = String.valueOf(n);
		String str2 = " ";
		int j = 1;
		int p = 0;
		int[] answer = new int[str1.length()];
		// 길이가 5인 인트 배열 생성
		System.out.println(str1.length());
		for (int i = str1.length() - 1; i >= 0; i--) {
			str2 += str1.charAt(i);
		}
		System.out.println(str2);
		while (j < str2.length()) {
			answer[p] = (str2.charAt(j) - 48);
			System.out.println(answer[p]);
			j++;
			p++;
		}
		return answer;
	}
}
