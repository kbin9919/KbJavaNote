package programmers;

import java.util.ArrayList;

public class Solution34 {
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
		return answer;
	}

	public static void main(String[] args) {
		Solution34 s = new Solution34();
		String str = "elepentsaa";
		s.solution(str);
	}
}
