package stage1;

import java.util.ArrayList;
import java.util.List;

public class Solution60 {
	public int solution(String dartResult) {
		int answer = 0;
		List<Integer> list = new ArrayList<>();
		String dartString = "";
		for (int i = 0; i < dartResult.length(); i++) {
			char c = dartResult.charAt(i);
			int dartInt = 0;
			if (Character.isDigit(c)) {
				dartString += c;
			} else if (c == 'S' || c == 'D' || c == 'T') {
				dartInt = Integer.parseInt(dartString);
				if (c != '*' && c != '#') {
					if (c == 'S') {
						list.add(dartInt);
					} else if (c == 'D') {
						list.add(dartInt * dartInt);
					} else if (c == 'T') {
						list.add(dartInt * dartInt * dartInt);
					}
				}
				dartString = "";
			} else {
				if (c == '#') {
					list.set(list.size() - 1, list.get(list.size() - 1) * -1);
				} else if (c == '*') {
					if (i == 2) {
						list.set(list.size() - 1, list.get(list.size() - 1) * 2);
					} else {
						list.set(list.size() - 1, list.get(list.size() - 1) * 2);
						list.set(list.size() - 2, list.get(list.size() - 2) * 2);
					}
				}
			}
		}
		for (int i = 0; i < list.size(); i++) {
			answer += list.get(i);
		}
		return answer;
	}
}
