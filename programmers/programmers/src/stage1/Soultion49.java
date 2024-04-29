package stage1;

public class Soultion49 {
	public String solution(String[] cards1, String[] cards2, String[] goal) {
		String answer = "";
		for (int i = 0; i < goal.length; i++) {
			for (int j = 0; j < cards1.length; j++) {
				if (goal[i].equals(cards1[j])) {
					if (j != 0 && !cards1[j - 1].equals("")) {
						break;
					}
					goal[i] = "";
					cards1[j] = "";
					break;
				}
			}
			for (int j = 0; j < cards2.length; j++) {
				if (goal[i].equals(cards2[j])) {
					if (j != 0 && !cards2[j - 1].equals("")) {
						break;
					}
					goal[i] = "";
					cards2[j] = "";
					break;
				}
			}
			answer += goal[i];
			System.out.println(answer);
		}
		if (answer.equals("")) {
			answer = "Yes";
		} else {
			answer = "No";
		}
		System.out.println(answer);
		return answer;
	}
}
