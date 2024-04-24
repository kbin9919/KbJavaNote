package programmers.stage1;

import java.util.Arrays;

public class Solutoin37 {
	public int[] solution(int[] array, int[][] commands) {
		int[] answer = new int[commands.length];
		for (int i = 0; i < commands.length; i++) {
            int[] subArray = Arrays.copyOfRange(array, commands[i][0] - 1, commands[i][1]);
            Arrays.sort(subArray);
            answer[i] = subArray[commands[i][2] - 1];
            System.out.println(answer[i]);
        }

		return answer;
	}

	public static void main(String[] args) {
		Solutoin37 s = new Solutoin37();
		int[] x = { 1, 5, 2, 6, 3, 7, 4 };
		int[][] y = new int[3][3];
		y[0][0] = 2;
		y[0][1] = 5;
		y[0][2] = 3;
		y[1][0] = 4;
		y[1][1] = 4;
		y[1][2] = 1;
		y[2][0] = 1;
		y[2][1] = 7;
		y[2][2] = 3;
		s.solution(x, y);
	}
}
