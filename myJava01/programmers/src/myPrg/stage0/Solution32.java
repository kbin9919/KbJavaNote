package programmers.stage1;

public class Solution32 {
	public int solution(int[][] sizes) {
		int answer = 0;
		int maxH = 0;
		int maxW = 0;
		for(int i =0; i<sizes.length; i++) {
			maxW = Math.max(maxW, Math.max(sizes[i][0], sizes[i][1]));
            maxH = Math.max(maxH, Math.min(sizes[i][0], sizes[i][1]));
		}
		answer = maxH * maxW;
		System.out.println(answer);
		return answer;
	}

	public static void main(String[] args) {

		int[][] x1 = new int[4][2];
		x1[0][0] = 60;
		x1[0][1] = 50;

		x1[1][0] = 30;
		x1[1][1] = 70;

		x1[2][0] = 60;
		x1[2][1] = 30;

		x1[3][0] = 80;
		x1[3][1] = 40;

		Solution32 s = new Solution32();
		s.solution(x1);
	}
}
