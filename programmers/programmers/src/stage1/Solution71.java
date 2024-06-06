package stage1;

public class Solution71 {
	public String solution(int[] numbers, String hand) {
		String answer = "";

		int left = 10; 
		int right = 12; 

		for (int number : numbers) {
			if (number == 0) {
				number = 11; 
			}

			if (number % 3 == 1) { 
				answer += ("L");
				left = number;
			} else if (number % 3 == 0) { 
				answer += ("R");
				right = number;
			} else { 
				int leftDistance = getDistance(left, number);
				int rightDistance = getDistance(right, number);

				if (leftDistance < rightDistance) {
					answer += ("L");
					left = number;
				} else if (leftDistance > rightDistance) {
					answer += ("R");
					right = number;
				} else { // 거리가 같을 경우
					if (hand.equals("right")) {
						answer += ("R");
						right = number;
					} else {
						answer += ("L");
						left = number;
					}
				}
			}
		}
		return answer;
	}

	private int getDistance(int currentPos, int targetPos) {
		int x1 = (currentPos - 1) / 3;
		int y1 = (currentPos - 1) % 3;
		int x2 = (targetPos - 1) / 3;
		int y2 = (targetPos - 1) % 3;
		return Math.abs(x1 - x2) + Math.abs(y1 - y2);
	}
}
