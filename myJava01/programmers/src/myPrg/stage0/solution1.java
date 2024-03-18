package myPrg.stage0;

public class solution1 {

	public long[] solution(int x, int n) {
    	long[] answer = new long[n];
        long result = 0;
    	for(int i = 0; i<n; i++) {
            result += x;
    		answer[i] = result;
    	}
        return answer;
    }

}
