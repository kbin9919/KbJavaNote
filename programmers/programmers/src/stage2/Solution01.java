package stage2;

import java.util.ArrayList;
import java.util.List;

public class Solution01 {
	public String solution(String s) {
		String answer = "";
		String[] number = s.split(" ");
		List<Integer> numberList = new ArrayList<>();
		for (int i = 0; i < number.length; i++) {
			numberList.add(Integer.parseInt(number[i]));
		}
		numberList.sort(null);
		answer += numberList.get(0).toString() + " " + numberList.get(numberList.size() - 1);
		return answer;
	}
}
