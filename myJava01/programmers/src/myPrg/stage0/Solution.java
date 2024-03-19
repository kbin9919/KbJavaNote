package chap0;

public class Solution {
	
	public double solution(int[] arr) {
        double answer = 0;
        for(int i = 0; i<arr.length; i++) {
        	answer += arr[i];
        }
        answer /= arr.length;
        
        return answer;
        
    }
	public static void main(String[] args) {
		Solution s = new Solution();
		int[] ss = {1, 3, 3 ,2};
		System.out.println(s.solution(ss));
	}
}