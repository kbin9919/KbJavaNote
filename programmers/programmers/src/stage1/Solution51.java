package stage1;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class Solution51 {
	public String solution(int a, int b) {
		String answer = "";
		LocalDate specificDate = LocalDate.of(2016, a, b);
		DayOfWeek dayOfWeek = specificDate.getDayOfWeek();

		answer = dayOfWeek.toString();
		answer = answer.substring(0, 3);
		return answer;
	}
}
