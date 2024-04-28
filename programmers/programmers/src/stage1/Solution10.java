package stage1;

public class Solution10 {
	public boolean solution(int x) {
		boolean answer = false;
		String str = "";
		int y = 0;
		str = Integer.toString(x);
		for (int i = 0; i < str.length(); i++) {
			y += Character.getNumericValue(str.charAt(i));
		}
		if (x % y == 0) {
			answer = true;
		}
		return answer;
	}
}
