package stage1;

import java.util.ArrayList;

public class Solution40 {
	public int[] solution(String s) {
		int[] answer = new int[s.length()];
		int n1 = 0;
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < s.length(); i++) {
			if (s.indexOf(s.charAt(i)) == i) {
				answer[i] = -1;
			} else {
				list.clear();
				for (int j = 0; j < s.length(); j++) {
					if (s.charAt(i) == s.charAt(j)) {
						list.add(j);

					}
				}

				for (int z = 0; z < list.size(); z++) {
					if (list.get(z) == i) {
						if (z != list.size() - 1) {
							n1 = list.get(z) - list.get(z - 1);
							answer[i] = n1;
						} else {
							n1 = list.get(z) - list.get(z - 1);
							answer[i] = n1;
						}

					}
				}
			}
		}
		for (int i = 0; i < answer.length; i++) {
			System.out.println(answer[i]);
		}
		return answer;
	}
}
