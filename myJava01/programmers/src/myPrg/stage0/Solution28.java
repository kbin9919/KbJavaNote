package programmers;

public class Solution28 {
	public String solution(String s) {
		String[] str = s.split(" ", -1);
		String answer = "";
		for (int i = 0; i < str.length; i++) {
			if(i == 0) {
				if(str[i] == " ") {
					answer += " ";
				}
			}else if (i != 0){
				answer += " ";
			}
			
			for (int j = 0; j < str[i].length(); j++) {
				
				if (j % 2 == 0) {
					answer += str[i].toUpperCase().charAt(j);
				} else if (j % 2 != 0) {
					answer += str[i].toLowerCase().charAt(j);
				}
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution28 s = new Solution28();
		System.out.println(s.solution("abc acc aaa aaaaa"));

	}
}
