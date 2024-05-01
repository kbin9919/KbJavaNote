package stage1;

import java.util.HashSet;
import java.util.Set;

public class Solution50 {
	public int solution(int[] nums) {
		int answer = 0;
		Set<Integer> s = new HashSet();
		for (int i = 0; i < nums.length; i++) {
			s.add(nums[i]);
		}
		if (nums.length / 2 >= s.size()) {
			answer = s.size();
		} else {
			answer = nums.length / 2;
		}
		return answer;
	}
}
