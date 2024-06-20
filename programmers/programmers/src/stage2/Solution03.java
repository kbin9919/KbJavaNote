package stage2;

import java.util.Arrays;

public class Solution03 {
	public static int solution(int []A, int []B)
    {
        int answer = 0;
        Arrays.sort(A);
        Arrays.sort(B);
        for(int i=0;i<A.length;i++) {
        		answer += (A[i]*B[A.length-i-1]);
        	
        }

        return answer;
    }
}
