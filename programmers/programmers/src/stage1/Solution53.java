package stage1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class Solution53 {
	public int solution(int k, int m, int[] score) {
		Arrays.sort(score);
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (int i = 0; i < score.length; i++) {
			list.add(score[i]);
		}
		Collections.reverse(list);
		int answer = 0;
		int a = m;
		while (true) {
			if (a > score.length) {
				break;
			}
			answer += list.get(a - 1) * m;
			a += m;
		}
		return answer;
	}
}
