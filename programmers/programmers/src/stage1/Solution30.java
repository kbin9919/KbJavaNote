package stage1;

import java.util.ArrayList;

public class Solution30 {
	public int[] solution(int[] arr) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < arr.length; i++) {
			if (i > 0) {
				if (arr[i] != arr[i - 1]) {
					list.add(arr[i]);
				}
			} else {
				list.add(arr[i]);
			}
		}

		int[] answer = new int[list.size()];
		for (int j = 0; j < list.size(); j++) {
			answer[j] = list.get(j);
		}
		return answer;
	}
}
