package stage2;

import java.util.Stack;

public class Solution09 {
	public int solution(String s) {
		Stack<Character> stack = new Stack<>();

		for (char c : s.toCharArray()) {
			if (stack.isEmpty()) {
				stack.add(c);
			}

			else {
				if (c == stack.peek()) {
					stack.pop();
				}
				else {
					stack.add(c);
				}
			}
		}

		return stack.isEmpty() ? 1 : 0;
	}

	public static void main(String[] args) {
		Solution09 s = new Solution09();
		System.out.println(s.solution("cdcd"));
	}
}
