package stage1;

public class Solution58 {
	public int solution(String[] babbling) {
		int answer = 0;
		String[] str = { "aya", "ye", "woo", "ma" };
		for (String b : babbling) {
			for (String s : str) {
				if(b.indexOf(s + s) >= 0) {
					break;
				}
				b = b.replaceAll(s, " ");
			}
			if(b.trim().length() == 0) {
				answer++;
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		String str[] = { "aya", "yee", "u", "maa" };
		String str2[] = { "ayaye", "uuuye", "yeye", "yema woo", "ayaayaa" };
		Solution58 s = new Solution58();
		s.solution(str2);
		String str3 = "woo";
		System.out.println(str3.replaceAll("woo", "") + "1");
	}
}
