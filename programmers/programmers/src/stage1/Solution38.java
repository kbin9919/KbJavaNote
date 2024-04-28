package stage1;

import java.util.Arrays;

public class Solution38 {
	public int solution(int[][] sizes) {
		int answer = 0;
		int maxH = 0;
		int maxW = 0;
		for (int i = 0; i < sizes.length; i++) {
			Arrays.sort(sizes[i]);
		}
		for (int i = 0; i < sizes.length; i++) {
			if (maxH < sizes[i][0]) {
				maxH = sizes[i][0];
			}
			if (maxW < sizes[i][1]) {
				maxW = sizes[i][1];
			}
		}
		answer = maxH * maxW;
		System.out.println(answer);
		return answer;
	}
}
