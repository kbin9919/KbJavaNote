package stage1;

public class Solution36 {
	public int solution(String t, String p) {
		int answer = 0;
		String num = "";
		for (int i = 0; i < t.length(); i++) {
			if (i <= t.length() - p.length()) {
				num = t.substring(i, i + p.length());
				System.out.println(num);
				if (Long.parseLong(num) <= Long.parseLong(p)) {
					answer++;
				}
			}
		}
		System.out.println(answer);
		return answer;
	}
}
