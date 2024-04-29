package stage1;

public class Solution48 {
	public int[] solution(String[] name, int[] yearning, String[][] photo) {
		int[] answer = new int[photo.length];
		for (int i = 0; i < photo.length; i++) {
			for (int j = 0; j < photo[i].length; j++) {
				for (int a = 0; a < name.length; a++) {
					if(photo[i][j].equals(name[a])) {
						answer[i] += yearning[a];
					}
				}
			}
		}
		return answer;
	}
}
