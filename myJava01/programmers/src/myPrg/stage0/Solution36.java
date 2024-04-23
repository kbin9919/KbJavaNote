package programmers.stage1;

import java.util.Stack;

public class Solution36 {
	public String[] solution(int n, int[] arr1, int[] arr2) {
		String[] answer = new String[n];
		String[][] strArr = new String[2][n];
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < n; j++) {
				if (i == 0) {
					strArr[i][j] = me01(arr1[j], n);
				} else {
					strArr[i][j] = me01(arr2[j], n);
				}
			}
		}
		for(int i = 0 ; i < answer.length; i++) {
			answer[i] = "";
		}
		for (int i = 0; i < strArr[0].length; i++) {
			for (int j = 0; j < strArr[0].length; j++) {
				int x = strArr[0][i].charAt(j) - 48;
				int y = strArr[1][i].charAt(j) - 48;
				if(x + y >0) {
					answer[i] += "#";
				}else {
					answer[i] += " ";	
				}
			}
		}
		return answer;
	}

	public String me01(int n, int l) {
		int num = 0;
		String str = "";
		String str2 = "0";
		Stack<String> s = new Stack();
		while (n != 0) {
			s.add(String.valueOf(n % 2));
			n /= 2;
			num++;
		}
		for (int i = 0; i < num; i++) {
			str += s.pop();
		}
		while (str.length() != l) {
			str = "0" + str;
		}

		return str;
	}

	public static void main(String[] args) {
		Solution36 s = new Solution36();
		int[] a = { 9, 20, 28, 18, 11 };
		int[] b = { 30, 1, 21, 17, 28 };

		s.solution(5, a, b);
	}
}