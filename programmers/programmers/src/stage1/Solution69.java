package stage1;

import java.util.Stack;

public class Solution69 {
	public int solution(int[] ingredient) {
		Stack<Integer> stack = new Stack<Integer>();

		int answer = 0;

		for (int i : ingredient) {
			stack.add(i);
			if (stack.size() >= 4) {
				int size = stack.size();
				if (stack.get(size - 1) == 1 && stack.get(size - 2) == 3 && stack.get(size - 3) == 2
						&& stack.get(size - 4) == 1) {
					for (int j = 0; j < 4; j++) {
						stack.pop();
					}
					answer++;
				}

			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution69 s = new Solution69();
		int[] x = { 2, 1, 1, 2, 3, 1, 2, 3, 1 };
		int[] y = { 1, 3, 2, 1, 2, 1, 3, 1, 2 };

		s.solution(x);
	}
}
