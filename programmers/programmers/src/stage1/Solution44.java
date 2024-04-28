package stage1;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Solution44 {
	public int[] solution(int[] numbers) {
		Set<Integer> set = new HashSet<Integer>();

		for (int i = 0; i < numbers.length; i++) {
			for (int j = 0; j < numbers.length; j++) {
				if (i != j) {
					set.add(numbers[i] + numbers[j]);
				}
			}
		}
		int[] answer = new int[set.size()];
		Iterator iter = set.iterator();
		int i = 0;
		while (iter.hasNext()) {
			answer[i] = (int) iter.next();
			System.out.println(answer[i]);
			i++;
		}
		Arrays.sort(answer);
		return answer;
	}
}
