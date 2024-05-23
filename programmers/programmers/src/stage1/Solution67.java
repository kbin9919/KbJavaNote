package stage1;

public class Solution67 {
	public int[] solution(String[] keymap, String[] targets) {
		int tL = targets.length;
		int[] answer = new int[tL];

		for (int i = 0; i < tL; i++) {
			for (char c : targets[i].toCharArray()) {
				int cnt = Integer.MAX_VALUE;
				for (String str : keymap) {
					for (int j = 0; j < str.length(); j++) {
						if (c == str.charAt(j)) {
							cnt = Math.min(cnt, j);
							break;
						}
					}
				}
				if (cnt == Integer.MAX_VALUE) {
					answer[i] = -1;
					break;
				} else {
					answer[i] += cnt +1;
				}
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution67 s = new Solution67();
		s.solution(args, args);
	}
}
