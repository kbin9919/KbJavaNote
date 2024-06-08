package stage1;

import java.util.HashMap;
import java.util.Map;

public class Solution73 {
	public String solution(String[] survey, int[] choices) {
		String answer = "";
		Map<Character, Integer> m = new HashMap<Character, Integer>();
		for (int i = 0; i < survey.length; i++) {
			if (choices[i] <= 4) {
				m.put(survey[i].charAt(0), m.getOrDefault(survey[i].charAt(0), 0) + score(choices[i]));
				m.put(survey[i].charAt(1), m.getOrDefault(survey[i].charAt(1), 0) + 0);
			}
			if (choices[i] >= 4) {
				m.put(survey[i].charAt(1), m.getOrDefault(survey[i].charAt(1), 0) + score(choices[i]));
				m.put(survey[i].charAt(0), m.getOrDefault(survey[i].charAt(0), 0) + 0);
			}
		}
		System.out.println(m.get('T'));
		System.out.println(m.get('R'));
		answer += getLargerKey(m, 'R', 'T');
		answer += getLargerKey(m, 'C', 'F');
		answer += getLargerKey(m, 'J', 'M');
		answer += getLargerKey(m, 'A', 'N');
		System.out.println(answer);
		return answer;
	}

	private int score(int choices) {
		int score = 0;
		if (choices == 1) {
			score = 3;
		} else if (choices == 2) {
			score = 2;
		} else if (choices == 3) {
			score = 1;
		} else if (choices == 4) {
			score = 0;
		} else if (choices == 5) {
			score = 1;
		} else if (choices == 6) {
			score = 2;
		} else if (choices == 7) {
			score = 3;
		}
		return score;
	}

	private char getLargerKey(Map<Character, Integer> map, char keyA, char keyB) {
		if (map.containsKey(keyA) && map.containsKey(keyB)) {
            if (map.get(keyA) >= map.get(keyB)) {
                return keyA;
            } else {
                return keyB;
            }
        } else {
        	return keyA;
        }
	}

	public static void main(String[] args) {
		Solution73 s = new Solution73();
		String str[] = { "AN", "CF", "MJ", "RT", "NA" };
		String str2[] = { "TR", "RT", "TR" };
		
		int[] x = { 5, 3, 2, 7, 5 };
		int[] x2 = { 7, 1, 3 };
		s.solution(str2, x2);
	}
}
