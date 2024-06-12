package stage1;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Solution76 {
	public int[] solution(String today, String[] terms, String[] privacies) {
		List list = new ArrayList<Integer>();
		LocalDate day = LocalDate.parse(today, DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		Map m = new HashMap<String, String>();
		for (String part : terms) {
			String[] parts = part.split(" ");
			m.put(parts[0], parts[1]);
		}
		for (int i = 0; i < privacies.length; i++) {
			String[] parts = privacies[i].split(" ");
			LocalDate date = LocalDate.parse(parts[0], DateTimeFormatter.ofPattern("yyyy.MM.dd"));
			int plusDay = Integer.parseInt((String) m.get(parts[1]));
			LocalDate newDate = date.plusMonths(plusDay);
            
            // newDate가 day 이전인지 확인
            if (!newDate.isAfter(day)) {
            	list.add(i+1);
            }
		}
		int[] answer = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			
			answer[i] = (int) list.get(i);
		}
		return answer;
	}

	public static void main(String[] args) {
		Solution76 s = new Solution76();
		String today = "2022.05.19";
		String[] terms = { "A 6", "B 12", "C 3" };
		String[] privacies = { "2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C" };
		s.solution(today, terms, privacies);
	}
}
