package programmers;

public class Solution15 {
    public int solution(int[] a, int[] b) {
        int answer = 0;
        for(int i = 0; i<a.length; i++) {
        	answer += a[i]*b[i]; 
        }
        return answer;
    }

	public static void main(String[] args) {
		Solution15 s = new Solution15();
	}
}

//a b c d e f g h i j
