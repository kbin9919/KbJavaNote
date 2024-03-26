package programmers.stage1;

import java.util.ArrayList;

public class Solution12 {
	public int[] solution(int[] arr, int divisor) {
		ArrayList<Integer> x = new ArrayList<Integer>();
		int cnt = 0;
		for(int i  = 0; i<arr.length; i++) {
			if(arr[i] % divisor == 0) {
				x.add(arr[i]);
				cnt++;
			}
		}
		if(cnt == 0) {
			x.add(-1);
		}
		x.sort(null);
		int[] answer = new int[x.size()];
		for(int i = 0; i<x.size(); i++) {
			answer[i] = x.get(i);
			System.out.println(answer[i]);
		}
		return answer;
	}
}
