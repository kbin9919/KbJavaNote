package stage1;

import java.util.ArrayList;

public class Solution34 {
	public int solution(int[] d, long budget) {
		int answer = 0;
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < d.length; i++) {
			list.add(d[i]);
		}
		list.sort(null);
		for (int i = 0; i < d.length; i++) {
			if (list.get(i) > budget) {
				break;
			}
			budget -= list.get(i);
			answer++;
		}
		return answer;
	}
}
