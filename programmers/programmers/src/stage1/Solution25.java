package stage1;

import java.util.ArrayList;
import java.util.Collections;

public class Solution25 {
	public String solution(String s) {
		String str = s;
		String answer = "";
		ArrayList<Character> x = new ArrayList<>();
		for (int i = 0; i < str.length(); i++) {
			x.add(str.charAt(i));
		}
		Collections.sort(x, Collections.reverseOrder());
		x.sort(null);
		Collections.reverse(x);
		for (int i = 0; i < x.size(); i++) {
			answer += x.get(i);
		}
		return answer;
	}
}
