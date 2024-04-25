package programmers;

import java.util.Arrays;

public class Solution37 {
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
}
