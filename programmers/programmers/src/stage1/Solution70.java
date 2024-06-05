package stage1;

import java.util.Stack;

public class Solution70 {
	public int solution(int[][] board, int[] moves) {
		int answer = 0;
		Stack<Integer> stack = new Stack<Integer>();
		for (int i = 0; i < moves.length; i++) {
			for (int j = 0; j < board.length; j++) {
				int picked = board[j][moves[i] - 1]; // move 값은 1부터 시작하기 때문에 인덱스를 맞추기 위해 -1 필요
				if (picked != 0) {
					board[j][moves[i] - 1] = 0;
					if (!stack.isEmpty() && stack.peek() == picked) {
						stack.pop();
						answer += 2; // 같은 인형이 연속으로 쌓이면 사라지므로 점수 2 추가
					} else {
						stack.push(picked);
					}
					break;
				}
			}
		}
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {
		Solution70 s = new Solution70();
		int[][] x = { { 0, 0, 0, 0, 0 }, { 0, 0, 1, 0, 3 }, { 0, 2, 5, 0, 1 }, { 4, 2, 4, 4, 2 }, { 3, 5, 1, 3, 1 } };
		int[] y = { 1, 5, 3, 5, 1, 2, 1, 4 };
		s.solution(x, y);
	}
}
