package programmers.stage1;

import java.util.Arrays;

public class Solution35 {
	public String[] solution(String[] strings, int n) {
		String[] answer = new String[strings.length];
		char[] charArr = new char[strings.length];
		for (int i = 0; i < strings.length; i++) {
			charArr[i] = strings[i].charAt(n);
		}
		Arrays.sort(charArr);
		Arrays.sort(strings);
		for (int i = 0; i < strings.length; i++) {
			for (int j = 0; j < charArr.length; j++) {
				if (strings[j] != "") {
					if (strings[j].charAt(n) == charArr[i]) {
						answer[i] = strings[j];
						strings[j] = "";
						break;
					}
				}
			}
		}
		for (int i = 0; i < answer.length; i++) {
			System.out.println(answer[i]);
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution35 s = new Solution35();
		String[] str = new String[3];
		str[0] = "abce";
		str[1] = "abcd";
		str[2] = "cdx";
		s.solution(str, 2);
	}
}
