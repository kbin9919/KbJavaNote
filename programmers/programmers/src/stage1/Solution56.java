package stage1;

public class Solution56 {
	public int solution(int[] nums) {
		int answer = 0;
		for (int i = 0; i < nums.length; i++) {
			int x = nums[i];
			for (int j = i + 1; j < nums.length; j++) {
				for (int q = j + 1; q < nums.length; q++) {
					nums[i] = x; 
					nums[i] += nums[j] + nums[q];
					if(m01(nums[i])) {
						answer++;
					}
				}
			}
		}
		return answer;
	}

	public boolean m01(int x) {

		for (int i = 2; i <= Math.sqrt(x); i++) {
			if(x % i == 0) {
				return false;
			}
		}
		return true;
	}
}
