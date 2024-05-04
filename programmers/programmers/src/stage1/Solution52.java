package stage1;

	import java.util.ArrayList;
	import java.util.List;

public class Solution52 {
	public int[] solution(int[] answers) {
		int[] x = { 1, 2, 3, 4, 5 };
		int[] y = { 2, 1, 2, 3, 2, 4, 2, 5 };
		int[] z = { 3, 3, 1, 1, 2, 2, 4, 4, 5, 5 };

		int[] score = new int[3];

		for (int i = 0; i < answers.length; i++) {
			if (answers[i] == x[i % 5]) {
				score[0]++;
			}
			if (answers[i] == y[i % 8]) {
				score[1]++;
			}
			if (answers[i] == z[i % 10]) {
				score[2]++;
			}
		}

		int max = Math.max(score[0], Math.max(score[1], score[2]));
		System.out.println(max);
		List<Integer> list = new ArrayList();
		for (int i = 0; i < 3; i++) {
			if (score[i] == max) {
				list.add(i + 1);
			}
		}
		int[] answer = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			answer[i] = list.get(i);
			System.out.println(answer[i]);
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution52 s = new Solution52();
		int x[] = { 1, 3, 2, 4, 2 };
		s.solution(x);
	}
}
