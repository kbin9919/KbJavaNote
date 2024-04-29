package stage1;

import java.util.ArrayList;

public class Solution47 {
	public int[] solution(int k, int[] score) {
		int[] answer = new int[score.length];
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (int i = 0; i < score.length; i++) {
			list.add(score[i]);
			list.sort(null);

			if (i < k) {
				answer[i] = list.get(0);
			} else {
				answer[i] = list.get(list.size() - k);
			}
		}
		for (int i = 0; i < score.length; i++) {
			System.out.println(answer[i]);
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution47 s = new Solution47();
		int x[] = { 10, 100, 20, 150, 1, 100, 200 };
		s.solution(3, x);
	}
}
